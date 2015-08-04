package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class DbyhServerImpl extends BaseOperate implements DbyhServer {

	public DbyhServerImpl() {
		super("dbyh", "jdbc");
	}

	@Override
	public List<Map<String, Object>> selectList1() {
		// TODO Auto-generated method stub
		return queryList("selectList1");
	}

	@Override
	public List<Map<String, Object>> selectList2(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList2",zdxx);
	}
	@Override
	public List<Excel_list> export_ybb(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("export_ybb",zdxx);
	}
	@Override
	public List<Zdxx> selectList3(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList3",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectList4(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList4",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectList5(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectList5",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectxhbList1(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectxhbList1",zdxx);
	}
	@Override
	public List<Excel_list> export_xhb(Zdxx zdxx) {
		return queryList("export_xhb",zdxx);
	}
	
	@Override
	public List<Map<String, Object>> selectxhbList4(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectxhbList4",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectxhbList5(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectxhbList5",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectfxbList1(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectfxbList1",zdxx);
	}
	@Override
	public List<Excel_list> export_fxb(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("export_fxb",zdxx);
	}

	@Override
	public List<Map<String, Object>> selectPdbList(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectPdbList",zdxx);
	}
	@Override
	public List<Excel_list> export_pdb(Zdxx zdxx) {
		return queryList("export_pdb",zdxx);
	}
	
	@Override
	public List<Map<String, Object>> selectYlbList(Zdxx zdxx) {
		return queryList("selectYlbList",zdxx);
	}
	@Override
	public List<Excel_list> export_ylb(Zdxx zdxx) {
		return queryList("export_ylb",zdxx);
	}

	@Override
	public boolean insertYBBData(List<Map> data) {
		// TODO Auto-generated method stub
		//insert("insertYBBData", data.get(0));
		return insertBatch("insertYBBData", data)==data.size();
	}

	@Override
	public List<Map<String,Object>> selectybbbyYf(String substring) {
		// TODO Auto-generated method stub
		return queryList("selectybbbyYf",substring);
	}

	@Override
	public boolean delete_ybb(String string) {
		if(delete("delete_ybb",string)>0){
			return true;
		}else return false;
	}

	@Override
	public List<Map<String, Object>> selectxhbbyYf(String substring) {
		// TODO Auto-generated method stub
		return queryList("selectxhbbyYf",substring);
	}

	@Override
	public boolean insertXHBData(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertXHBData", data)==data.size();
	}

	@Override
	public boolean delete_xhb(String string) {
		if(delete("delete_xhb",string)>0){
			return true;
		}else return false;
	}

	@Override
	public List<Map<String, Object>> selectfxbbyYf(String substring) {
		// TODO Auto-generated method stub
		return queryList("selectfxbbyYf",substring);
	}

	@Override
	public boolean insertFXBData(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertFXBData", data)==data.size();
	}

	@Override
	public boolean delete_fxb(String string) {
		if(delete("delete_fxb",string)>0){
			return true;
		}else return false;
	}

	@Override
	public List<Map<String, Object>> selectpdbbyYf(String substring) {
		// TODO Auto-generated method stub
		return queryList("selectpdbbyYf",substring);
	}

	@Override
	public boolean insertPDBData(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertPDBData", data)==data.size();
	}

	@Override
	public boolean delete_pdb(String string) {
		if(delete("delete_pdb",string)>0){
			return true;
		}else return false;
	}

	@Override
	public List<Map<String, Object>> selectylbbyYf(String substring) {
		// TODO Auto-generated method stub
		return queryList("selectylbbyYf",substring);
	}

	@Override
	public boolean insertYLBData(List<Map> data) {
		// TODO Auto-generated method stub
		return insertBatch("insertYLBData", data)==data.size();
	}

	@Override
	public boolean delete_ylb(String string) {
		if(delete("delete_ylb",string)>0){
			return true;
		}else return false;
	}
	
}
