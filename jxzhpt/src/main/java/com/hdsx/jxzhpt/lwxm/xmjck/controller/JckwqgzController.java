package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——危桥改造Action层
 * @author lhp
 *
 */
@Controller
public class JckwqgzController extends BaseActionSupport implements ModelDriven<Jckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckwqgzServerImpl")
	private JckwqgzServer wqgzServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	private String delstr;
	
	public void insertWqgz(){
		boolean b = wqgzServer.insertWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectWqgz(){
		List<Jckwqgz> abgcList = wqgzServer.selectWqgzList();
		try {
			JsonUtils.write(abgcList, getresponse().getWriter());
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
	//自动填充LXMC
	public void wqgzGpsroad(){
		try {
			JsonUtils.write(wqgzServer.selectGpsroad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
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

}
