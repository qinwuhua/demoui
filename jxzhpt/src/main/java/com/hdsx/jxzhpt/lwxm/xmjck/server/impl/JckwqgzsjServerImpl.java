package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
@Service
public class JckwqgzsjServerImpl extends BaseOperate implements JckwqgzsjServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public JckwqgzsjServerImpl() {
		super("jckwqgzsj", "jdbc");
	}

	@Override
	public boolean deleteqlzpbyxmbm(Jckwqgzsj jckwqgzsj) {
		if(delete("deleteqlzpbyxmbm",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public boolean insertWqgz(Jckwqgzsj jckwqgzsj) {
		if(insert("insertWqgz",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public List<Jckwqgzsj> selectWqgzList(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzList",jckwqgzsj);
	}

	@Override
	public int selectWqgzCount(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzCount", jckwqgzsj);
	}

	@Override
	public boolean deleteWqgzsjById(Jckwqgzsj jckwqgzsj) {
			String[] strs = jckwqgzsj.getId().split(",");
			list = new ArrayList<String>();
			for (int i = 0; i < strs.length; i++) {
				Jckwqgzsj jckwqgzsj1=new Jckwqgzsj();
				jckwqgzsj1.setId(strs[i]);
				delete("deleteqlzpbyxmbm",jckwqgzsj1);
				list.add(strs[i]);
			}
			if(deleteBatch("deleteWqgzsjById", list)>0) return true;
			else return false;
		
	}

	@Override
	public boolean getwqgzZP(Jckwqgzsj jckwqgzsj) {
		List<Plan_upload> pl1=queryList("getwqgzZP1", jckwqgzsj);
		List<Plan_upload> pl2=queryList("getwqgzZP2", jckwqgzsj);
		if(pl1.size()>0&&pl2.size()>0){
			return true;
		}else
		return false;
	}

	@Override
	public boolean xgJckWqgzSbzt(Jckwqgzsj jckwqgzsj) {
		String[] strs = jckwqgzsj.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", jckwqgzsj.getSbbm());
			hm.put("sbthcd", jckwqgzsj.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgJckwqgzSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public boolean shtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("shtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean shbtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("shbtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public List<Jckwqgzsj> selectJckShwqgz(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectJckShwqgz",jckwqgzsj);
	}

	@Override
	public int selectWqgzShCount(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzShCount", jckwqgzsj);
	}

	@Override
	public boolean sjshtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("sjshtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean sjshbtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("sjshbtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean updateWqgz(Jckwqgzsj jckwqgzsj) {
		if(update("updateWqgz", jckwqgzsj)>0)
			return true;
		return false;
	}

	@Override
	public List<Jckwqgzsj> selectSckwqgz(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectSckwqgz", jckwqgzsj);
	}

	@Override
	public int selectSckwqgzCount(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectSckwqgzCount", jckwqgzsj);
	}

	@Override
	public List<Jckwqgzsj> JckWqgzRoad(Jckwqgzsj jckwqgzsj) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("qlbh", jckwqgzsj.getQlbh());
		hm.put("gydwbm", jckwqgzsj.getGydwbm());
		return queryList("JckWqgzRoad", hm);
	}

	@Override
	public boolean insertSckwqgz(Jckwqgzsj jckwqgzsj) {
		if(insert("insertSckwqgz",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public boolean deleteSckWqgz(Jckwqgzsj jckwqgzsj) {
		String[] strs = jckwqgzsj.getId().split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			Jckwqgzsj jckwqgzsj1=new Jckwqgzsj();
			jckwqgzsj1.setId(strs[i]);
			delete("deleteqlzpbyxmbm",jckwqgzsj1);
			list.add(strs[i]);
		}
		if(deleteBatch("deleteSckWqgz", list)>0) return true;
		else return false;
	}
	
	@Override
	public boolean xgSckWqgzSbzt(Jckwqgzsj jckwqgzsj) {
		String[] strs = jckwqgzsj.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", jckwqgzsj.getSck_sbbm());
			hm.put("sbthcd", jckwqgzsj.getSck_sbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgSckWqgzSbzt", lm)>0) return true;
		else return false;
	}
	
	@Override
	public boolean shtyWqgzsckById(Jckwqgzsj jckwqgzsj) {
		if(update("shtyWqgzsckById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean shbtyWqgzsckById(Jckwqgzsj jckwqgzsj) {
		if(update("shbtyWqgzsckById", jckwqgzsj)>0) return true;
		else return false;
	}
	
	@Override
	public boolean updateSckwqgz(Jckwqgzsj jckwqgzsj) {
		if(insert("updateSckwqgz",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public List<Jckwqgzsj> selectSckShwqgz(Jckwqgzsj jckwqgzsj) {
		return queryList("selectSckShwqgz",jckwqgzsj);
	}

	@Override
	public int selectSckShwqgzCount(Jckwqgzsj jckwqgzsj) {
		return queryOne("selectSckShwqgzCount", jckwqgzsj);
	}
	
	@Override
	public boolean sjshtyWqgzsjwqgz(Jckwqgzsj jckwqgzsj) {
		if(update("sjshtyWqgzsjwqgz", jckwqgzsj)>0) {
			if(jckwqgzsj.getScbmbm().substring(jckwqgzsj.getScbmbm().length()-2) .equals("0") ){
				jckwqgzsj.setBz("0");
			}else {
				jckwqgzsj.setBz("2");
			}
			Jckwqgzsj jck=queryOne("cxtiaojian", jckwqgzsj);
			if("省直管试点县".equals(jck.getTsdq())){
				Wqbzbz wq1=queryOne("selectshibz", jck);
				if(wq1==null){
					System.out.println("未查出市级补助，请在审核时检查代码");
				}else{
					BigDecimal b1=new BigDecimal(jck.getScqlqc()).multiply(new BigDecimal(jck.getScqlqk()));
					BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje())).divide(new BigDecimal("10000"));
					jckwqgzsj.setShibz(b2+"");
				}
			}
			Wqbzbz wq1=queryOne("selectshengbz", jck);
			if(wq1==null){
				System.out.println("未查出市级补助，请在审核时检查代码");
			}else{
				if(wq1.getZdkd()!=null||wq1.getZdkd()!=""||!"".equals(wq1.getZdkd())){
					if(Double.parseDouble(wq1.getZdkd())<Double.parseDouble(jck.getScqlqk())){
						jckwqgzsj.setScqlqk(wq1.getZdkd());
					}else{
						jckwqgzsj.setScqlqk(jck.getScqlqk());
					}
				}
				else{
					jckwqgzsj.setScqlqk(jck.getScqlqk());
				}
			}
			jckwqgzsj.setScqlqc(jck.getScqlqc());
			BigDecimal b1=new BigDecimal(jckwqgzsj.getScqlqc()).multiply(new BigDecimal(jckwqgzsj.getScqlqk()));
			BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje())).divide(new BigDecimal("10000"));
			if(jckwqgzsj.getShibz()==null){
				jckwqgzsj.setShibz("0");
			}
			jckwqgzsj.setShengbz(b2.add(new BigDecimal(jckwqgzsj.getShibz()))+"");	
			jckwqgzsj.setShibz("0");
			jckwqgzsj.setSfylrbwqk(jck.getSfylrbwqk());
			jckwqgzsj.setBzls(jck.getBzls());
			if(insert("lrjhSckwqgz", jckwqgzsj)>0)
				System.out.println("nonono");
			return true;
			}
		else return false;
	}

	@Override
	public boolean sjshbtyWqgzsjwqgz(Jckwqgzsj jckwqgzsj) {
		if(update("sjshbtyWqgzsjwqgz", jckwqgzsj)>0){ 
			return true;
		}
		else return false;
	}
}