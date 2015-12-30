package com.hdsx.jxzhpt.jhgl.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_bhsd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_bhsdServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckbhsd;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_bhsdController extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_bhsdServerImpl")
	private Plan_bhsdServer wqgzServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	@Resource(name="xtglServerImpl")
	private XtglServer xtglServer;
	private Plan_zjzj zjzj;
	private Plan_bhsd jh;
	private Jckbhsd lx;
	private Sckbhsd sc;
	private Plan_upload uploads;
	private String fileuploadFileName;
	private File fileupload;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	private String jhIds;//计划id串
	private String mode;
	
	/**
	 * 修改危桥状态
	 */
	public void editBhsdStatusBatch(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
			List<Plan_bhsd> splist = wqgzServer.queryWqgzByStatus(jh,lx);
			for (Plan_bhsd item : splist) {
				System.out.println(item.getId());
				item.setJh_sbthcd(""+(Integer.parseInt(item.getJh_sbthcd())+2));
				item.setSpzt("1");
				item.setSpsj(new Date());
				item.setSpbmdm(lx.getXzqhdm());//这里行政区划代码保存的是管养单位编码
			}
			result.put("result", new Boolean(wqgzServer.updateStatusBatch(splist)).toString());
			System.out.println("结果："+result.get("result"));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据状态查询危桥列表，在计划上报时用来查询出所有未上报的计划，并修改状态
	 */
	public void queryBhsdByStatus(){
		try {
			lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
			JsonUtils.write(wqgzServer.queryWqgzByStatus(jh, lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询危桥列表
	 */
	public void queryBhsdList(){
		try {
			if (lx.getGydwbm().indexOf(",")==-1) {
				lx.setGydwbm(" lx.gydwbm like '%"+lx.getGydwbm()+"%'");
			}else {
				lx.setGydwbm(" lx.gydwbm in ("+lx.getGydwbm()+")");
			}
			if (lx.getXzqhdm().indexOf(",")==-1) {
				lx.setXzqhdm(" lx.xzqhdm like '%"+lx.getXzqhdm()+"%'");
			}else {
				lx.setXzqhdm(" lx.xzqhdm in ("+lx.getXzqhdm()+")");
			}
			if (jh.getXtType()!=null && !jh.getXtType().equals("")
					&& jh.getXtType().equals("nc")) {
				jh.setXtType("and substr(lx.lxbm,1,1)  not in('G','S')");
			}else {
				jh.setXtType("and substr(lx.lxbm,1,1) in('G','S')");
			}
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", wqgzServer.queryWqgzCount(jh, lx));
			jsonMap.put("rows", wqgzServer.queryWqgzList(page, rows, jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询危桥总计信息
	 */
	public void querySumBhsd(){
		try {
			if (lx.getGydwbm().indexOf(",")==-1) {
				lx.setGydwbm(" lx.gydwbm like '%"+lx.getGydwbm()+"%'");
			}else {
				lx.setGydwbm(" lx.gydwbm in ("+lx.getGydwbm()+")");
			}
			if (lx.getXzqhdm().indexOf(",")==-1) {
				lx.setXzqhdm(" lx.xzqhdm like '%"+lx.getXzqhdm()+"%'");
			}else {
				lx.setXzqhdm(" lx.xzqhdm in ("+lx.getXzqhdm()+")");
			}
			if (jh.getXtType()!=null && !jh.getXtType().equals("")
					&& jh.getXtType().equals("nc")) {
				jh.setXtType("and substr(lx.lxbm,1,1)  not in('G','S')");
			}else {
				jh.setXtType("and substr(lx.lxbm,1,1) in('G','S')");
			}
			JsonUtils.write(wqgzServer.querySumWqgz(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * excel导出
	 * 通过flag来区分导出哪个excel
	 * 导出的excel将要设置sheet名，数据，表头，以及excel文件名
	 * @throws UnsupportedEncodingException 
	 */
	public void exportExcel_jh_bhsd() throws UnsupportedEncodingException{
		if (lx.getJsdj()!=null) {
			lx.setJsdj(URLDecoder.decode(lx.getJsdj(), "UTF-8"));
		}
		if (lx.getGydwbm().indexOf(",")==-1) {
			lx.setGydwbm(" lx.gydwbm like '%"+lx.getGydwbm()+"%'");
		}else {
			lx.setGydwbm(" lx.gydwbm in ("+lx.getGydwbm()+")");
		}
		if (lx.getXzqhdm().indexOf(",")==-1) {
			lx.setXzqhdm(" lx.xzqhdm like '%"+lx.getXzqhdm()+"%'");
		}else {
			lx.setXzqhdm(" lx.xzqhdm in ("+lx.getXzqhdm()+")");
		}
		if (jh.getXtType()!=null && !jh.getXtType().equals("")
				&& jh.getXtType().equals("nc")) {
			jh.setXtType("and substr(lx.lxbm,1,1)  not in('G','S')");
		}else {
			jh.setXtType("and substr(lx.lxbm,1,1) in('G','S')");
		}
		System.out.println("******************");
		List<SjbbMessage> list = new ArrayList<SjbbMessage>();
		ExportExcel_new ee = new ExportExcel_new();
		List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
		SheetBean sheetb = new SheetBean();
		String excelHtml="";
		String tableName="";
		if (mode.equals("gl")) {
			list = wqgzServer.exportExcel_jh(jh, lx);
			excelHtml="<tr><td>计划状态</td><td>计划年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>隧道代码</td><td>隧道名称</td><td>批复总投资</td></tr>";
		}else if (mode.equals("sh")) {
			list = wqgzServer.exportExcel_jh_sh(jh, lx);
			excelHtml="<tr><td>审批状态</td><td>计划年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>隧道代码</td><td>隧道名称</td><td>批复总投资</td></tr>";
		}else if (mode.equals("sd")) {
			list = wqgzServer.exportExcel_jh_sd(jh, lx);
			excelHtml="<tr><td>审定状态</td><td>计划年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>隧道代码</td><td>隧道名称</td><td>批复总投资</td></tr>";
		}else if (mode.equals("tz")) {
			list = wqgzServer.exportExcel_jh_tz(jh, lx);
			excelHtml="<tr><td>计划年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>隧道代码</td><td>隧道名称</td><td>批复总投资</td></tr>";
		}
		sheetb.setTableName("病害隧道项目");
		sheetb.setHeader(excelHtml);
		sheetb.setSheetName("隧道");
		tableName="病害隧道项目";//excel 文件的名字
		sheetb.setColnum((short)11);
		sheetb.setList(list);
		sheetb.setFooter(null);
		sheetBeans.add(sheetb);
		String stylefileName="module.xls";
		//导出excel
		ee.initStyle(ee.workbook, stylefileName);
		HttpServletResponse response= getresponse();
		ee.makeExcel(tableName, sheetBeans, response);
	}
	/**
	 * 导入危桥计划Excel
	 */
	public void importBhsd_jh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader.readExcelContent(4,23,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			System.out.println(data);
			//将数据插入到数据库
			boolean b=wqgzServer.importWqgz_jh(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 此方法弃用
	 */
	public void queryBhsdNfs(){
		try {
			JsonUtils.write(wqgzServer.queryWqgzNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID查询危桥信息
	 */
	public void queryBhsdById(){
		try {
			if (jh.getTz_type()!=null&&jh.getTz_type().equals("0")) {
				JsonUtils.write(wqgzServer.queryBhsdtzById(jh.getId()), getresponse().getWriter());
			}else {
				JsonUtils.write(wqgzServer.queryWqgzById(jh.getId()), getresponse().getWriter());
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除病害隧道信息
	 */
	public void dropBhsdById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			System.out.println("ID："+jh.getId()+" 审查ID："+jh.getSckid());
			result.put("edit", new Boolean(wqgzServer.updateLrztBySckid(jh.getSckid())).toString());
			result.put("drop", new Boolean(wqgzServer.dropWqgzById(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改危桥计划信息
	 */
	public void editBhsdById(){
		try {
			JsonUtils.write(wqgzServer.editWqgzById(jh), getresponse().getWriter());
//			wqgzServer.editWqgzSckxx(sc);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改危桥状态
	 */
	public void editBhsdStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(wqgzServer.editWqgzStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 计划库上报
	 */
	public void jHBhsdShangB(){
		try {
			JsonUtils.write(wqgzServer.xgJhkWqgzSbzt(jhIds,jh),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 上传文件
	 * @throws Exception
	 */
	public void uploadBhsdFile() throws Exception{
		FileInputStream fs=null;
		byte[] data;
		try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8");
				uploads =new Plan_upload();
				if((uploadGk!=null)){
					fs=new FileInputStream(this.uploadGk);
					data=new byte[(int) this.uploadGk.length()];
					fs.read(data);
					System.out.println("文件是否为空:"+(uploadGk!=null));
					System.out.println("文件名称："+uploadGkFileName);
					System.out.println((uploadGkFileName==null) +"    "+(uploadGkFileName==null)+"   "+(fileuploadFileName==null));
					uploads.setFilename(uploadGkFileName);
					uploads.setFiledata(data);
					uploads.setFiletype("工可报告");
				}else{
					fs=new FileInputStream(this.uploadSjt);
					data=new byte[(int) this.uploadSjt.length()];
					fs.read(data);
					uploads.setFilename(uploadSjtFileName);
					uploads.setFiledata(data);
					uploads.setFiletype("设计施工图");
				}
				uploads.setParentid(jh.getId());
				if(wqgzServer.insertwqFile(uploads)){
					response.getWriter().print(uploadSjtFileName+"导入成功");
				}else{
					response.getWriter().print(uploadSjtFileName+"导入失败");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			fs.close();
		}
	}
	/**
	 * 下载危桥的文件
	 */
	public void downBhsdFile(){
        try {
        	Plan_bhsd wqgz = wqgzServer.queryWqgzFjById(jh.getId());
        	HttpServletResponse response = getresponse();
        	response.setContentType("application/x-download"); 
        	if("gkbg".equals(jh.getGkbgmc())){
        		OutputStream out = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(wqgz.getGkbgmc().getBytes("GBK"),"ISO-8859-1"));
        		byte[]  buffer= wqgz.getGkbgdata();
                out.write(buffer);
                out.flush();
                out.close();
        	}else{
        		OutputStream out= response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(wqgz.getSjsgtmc().getBytes("GBK"),"ISO-8859-1"));
        		byte[]  buffer= wqgz.getSjsgtdata();
                out.write(buffer);
                out.flush();
                out.close();
        	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	/**
//	 * 导出危桥资金下达Excel
//	 */
//	public void exportBhsdZjxdExcel(){
//		//设置表头
//		ExcelTitleCell [] title=new ExcelTitleCell[9];
//		title[0]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)0), null,50);
//		title[1]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)1), null,15);
//		title[2]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)2), null,15);
//		title[3]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)3), null,15);
//		title[4]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)4), null,15);
//		title[5]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)5), null,15);
//		title[6]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)6), null,15);
//		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,15);
//		title[8]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)8), null,20);
//		//设置列与字段对应
//		Map<String, String> attribute=new HashMap<String, String>();
//		attribute.put("0", "lxxx");//路线信息
//		attribute.put("1", "pfztz");//批复总投资
//		attribute.put("2", "tbdw");//填报单位-即导出单位
//		attribute.put("3", "xdnf");//下达年份
//		attribute.put("4", "xdzj");//下达的总投资
//		attribute.put("5", "btzzj");//下达的部投资
//		attribute.put("6", "stz");//省投资
//		attribute.put("7", "jhxdwh");//计划下达文号
//		attribute.put("8", "xmid");
//		//准备数据
//		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwdm());
//		List<Object> excelData = new ArrayList<Object>();
//		if(lx.getGydwdm().equals("36")){
//			lx.setGydwdm(null);
//		}
//		//此处遍历查询资金下达模块的所有项目
//		lx.setGydwbm(gydwOrxzqhBm(lx.getGydwbm(),"gydwbm"));
//		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
//		for (Plan_bhsd item : wqgzServer.queryWqgzList(jh, lx)) {
//			Plan_zjxd zjxd=new Plan_zjxd();
//			String strLx=(item.getJckwqgz().getLxmc()==null ? "" : item.getJckwqgz().getLxmc()+"-")+
//					(item.getJckwqgz().getQlmc()==null ? "" : item.getJckwqgz().getQlmc()+"-")+
//					item.getJckwqgz().getQlbh()+"("+
//					item.getJckwqgz().getQlzxzh()+")";
//			zjxd.setLxxx(strLx);
//			zjxd.setPfztz(item.getPfztz());
//			zjxd.setXmid(item.getId());
//			zjxd.setTbdw(gydwmc);
//			excelData.add(zjxd);
//		}
//		ExcelEntity excel=new ExcelEntity("危桥改造",title,attribute,excelData);
//		ExcelExportUtil.excelWrite(excel, "危桥改造-资金下达", getresponse());
//	}
	
	/**
	 * 查询危桥自己
	 * @throws IOException
	 * @throws Exception
	 */
	public void queryBhLs() throws IOException, Exception{
		List<Plan_bhsd> ls=wqgzServer.queryWqLs(lx);
		JsonUtils.write(ls, getresponse().getWriter());
	}
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			result = bh.indexOf(",")==-1 ? " lx."+name+" like '%"+bh+"%'": "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	
	public void editBhZj(){
		try{
			String Strresult="false";
			jh.setPfztz(new Double(new Double(jh.getPfztz()).doubleValue()+new Integer(zjzj.getZtz()).doubleValue()).toString());
			jh.setJhsybzje(new Double(new Double(jh.getJhsybzje()).doubleValue()+new Double(zjzj.getBbzje()).doubleValue()).toString());
			jh.setJhsydfzcje(new Double(new Double(jh.getJhsydfzcje()).doubleValue()+new Double(zjzj.getStz()).doubleValue()).toString());
			if(wqgzServer.editZjById(jh) && zjxdServer.insertZjzj(zjzj)){
				Strresult="true";
			}
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", Strresult);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 危桥改造计划库退回
	 */
	public void xgJhkBhsdTH(){
		try {
			JsonUtils.write(wqgzServer.xgJhkWqgzTH(jhIds,jh),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 危桥改造计划库批量审批
	 */
	public void xgJhkBhsdBathSp(){
		try {
			JsonUtils.write(wqgzServer.editWqgzBathStatus(jhIds, jh),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 危桥改造计划库批量审批
	 */
	public void xgJhkBhsdBathSd(){
		try {
			JsonUtils.write(wqgzServer.editWqgzBathSdStatus(jhIds, jh),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void bhsdTz(){
		   try {
			JsonUtils.write(wqgzServer.tzBhsd(jh),getresponse().getWriter());
	     	} catch (Exception e) {
			e.printStackTrace();
		   }	
		}
		
		public void bhsdTzth(){
			   try {
				JsonUtils.write(wqgzServer.tzBhsdTh(jh),getresponse().getWriter());
		     	} catch (Exception e) {
				e.printStackTrace();
			   }	
			}
		
		/**
		 * 查询安保调整列表
		 */
		public void queryBhsdListTz(){
			try {
				if (lx.getGydwbm().indexOf(",")==-1) {
					lx.setGydwbm(" lx.gydwbm like '%"+lx.getGydwbm()+"%'");
				}else {
					lx.setGydwbm(" lx.gydwbm in ("+lx.getGydwbm()+")");
				}
				if (lx.getXzqhdm().indexOf(",")==-1) {
					lx.setXzqhdm(" lx.xzqhdm like '%"+lx.getXzqhdm()+"%'");
				}else {
					lx.setXzqhdm(" lx.xzqhdm in ("+lx.getXzqhdm()+")");
				}
				if (jh.getXtType()!=null && !jh.getXtType().equals("")
						&& jh.getXtType().equals("nc")) {
					jh.setXtType("and substr(lx.lxbm,1,1)  not in('G','S')");
				}else {
					jh.setXtType("and substr(lx.lxbm,1,1) in('G','S')");
				}
				Map<String, Object> jsonMap=new HashMap<String, Object>();
				jsonMap.put("total", wqgzServer.queryBhsdCountTz(jh, lx));
				jsonMap.put("rows", wqgzServer.queryBhsdListTz(page, rows, jh, lx));
				JsonUtils.write(jsonMap, getresponse().getWriter());
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/**
		 * 查询安保总计信息
		 */
		public void querySumBhsdTz(){
			try {
				if (lx.getGydwbm().indexOf(",")==-1) {
					lx.setGydwbm(" lx.gydwbm like '%"+lx.getGydwbm()+"%'");
				}else {
					lx.setGydwbm(" lx.gydwbm in ("+lx.getGydwbm()+")");
				}
				if (lx.getXzqhdm().indexOf(",")==-1) {
					lx.setXzqhdm(" lx.xzqhdm like '%"+lx.getXzqhdm()+"%'");
				}else {
					lx.setXzqhdm(" lx.xzqhdm in ("+lx.getXzqhdm()+")");
				}
				if (jh.getXtType()!=null && !jh.getXtType().equals("")
						&& jh.getXtType().equals("nc")) {
					jh.setXtType("and substr(lx.lxbm,1,1)  not in('G','S')");
				}else {
					jh.setXtType("and substr(lx.lxbm,1,1) in('G','S')");
				}
				JsonUtils.write(wqgzServer.querySumBhsdTz(jh,lx), getresponse().getWriter());
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/**
		 * 根据ID查询原安保信息
		 */
		public void queryBhsdtzById(){
			try {
				JsonUtils.write(wqgzServer.queryBhsdtzById(jh.getId()), getresponse().getWriter());
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	//set get
	public int getPage() {
		return page;
	}
	public Plan_zjzj getZjzj() {
		return zjzj;
	}
	public void setZjzj(Plan_zjzj zjzj) {
		this.zjzj = zjzj;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public Plan_bhsdServer getWqgzServer() {
		return wqgzServer;
	}
	public void setWqgzServer(Plan_bhsdServer wqgzServer) {
		this.wqgzServer = wqgzServer;
	}
	public Plan_bhsd getJh() {
		return jh;
	}
	public void setJh(Plan_bhsd jh) {
		this.jh = jh;
	}
	public Jckbhsd getLx() {
		return lx;
	}
	public void setLx(Jckbhsd lx) {
		this.lx = lx;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public File getUploadGk() {
		return uploadGk;
	}
	public void setUploadGk(File uploadGk) {
		this.uploadGk = uploadGk;
	}
	public String getUploadGkFileName() {
		return uploadGkFileName;
	}
	public void setUploadGkFileName(String uploadGkFileName) {
		this.uploadGkFileName = uploadGkFileName;
	}
	public File getUploadSjt() {
		return uploadSjt;
	}
	public void setUploadSjt(File uploadSjt) {
		this.uploadSjt = uploadSjt;
	}
	public String getUploadSjtFileName() {
		return uploadSjtFileName;
	}
	public void setUploadSjtFileName(String uploadSjtFileName) {
		this.uploadSjtFileName = uploadSjtFileName;
	}
	public Sckbhsd getSc() {
		return sc;
	}
	public void setSc(Sckbhsd sc) {
		this.sc = sc;
	}
	public Plan_upload getUploads() {
		return uploads;
	}
	public void setUploads(Plan_upload uploads) {
		this.uploads = uploads;
	}
	public String getJhIds() {
		return jhIds;
	}
	public void setJhIds(String jhIds) {
		this.jhIds = jhIds;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}

	
}
