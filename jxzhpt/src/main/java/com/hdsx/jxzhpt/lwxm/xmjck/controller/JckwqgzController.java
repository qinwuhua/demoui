package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——危桥改造Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckwqgzController extends BaseActionSupport implements ModelDriven<Jckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckwqgzServerImpl")
	private JckwqgzServer wqgzServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	private String delstr;
	private String fileuploadFileName;
	private File fileupload;
	//excel数据导入
	public void importWqgz(){
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
				dataMapArray = ExcelReader.readExcelContent(3,20,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			//去除excel中的空白行数据
			List<Map> data=ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=wqgzServer.importWqgz(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){}
	}
	public void exportExcel_wqgz(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>桥梁评定等级</td><td>修建/改建年度</td><td>项目年份</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)11);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckwqgz> ee = new ExportExcel_new<Jckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void exportExcel_wqgz_sh(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_sh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>桥梁评定等级</td><td>修建/改建年度</td><td>项目年份</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)11);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void insertWqgz(){
		boolean b = wqgzServer.insertWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectWqgz(){
		List<Jckwqgz> wqgzList = wqgzServer.selectWqgzList(jckwqgz);
		int count = wqgzServer.selectWqgzCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui = new EasyUIPage<Jckwqgz>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzById(){
		try {
			JsonUtils.write(wqgzServer.selectWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateWqgzById(){
		try {
			JsonUtils.write(wqgzServer.updateWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteWqgzById(){
		try {
			JsonUtils.write(wqgzServer.deleteWqgzById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzShzt(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzShzt(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzSbzt(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzSbzt(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void wqgzGpsroad(){
		try {
			JsonUtils.write(wqgzServer.selectGpsroad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void JckWqgzRoad(){
		try {
			JsonUtils.write(wqgzServer.JckWqgzRoad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectJckShwqgz(){
		List<Jckwqgz> wqgzList = wqgzServer.selectJckShwqgz(jckwqgz);
		int count = wqgzServer.selectWqgzShCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui = new EasyUIPage<Jckwqgz>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzTH(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzTH(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void onceWqgz(){
		boolean b = wqgzServer.onceWqgz(jckwqgz);
		System.out.println("**************************************"+b);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	} 
	
	
	public Jckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Jckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Jckwqgz getModel() {
		return jckwqgz;
	}
	public JckwqgzServer getWqgzServer() {
		return wqgzServer;
	}
	public void setWqgzServer(JckwqgzServer wqgzServer) {
		this.wqgzServer = wqgzServer;
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

}