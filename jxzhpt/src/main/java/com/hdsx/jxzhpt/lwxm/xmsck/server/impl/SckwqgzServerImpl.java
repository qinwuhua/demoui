package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckwqgzServer;
@Service
public class SckwqgzServerImpl extends BaseOperate implements SckwqgzServer {
	private Map<String, Object> hm;
	public SckwqgzServerImpl() {
		super("sckwqgz", "jdbc");
	}

	@Override
	public boolean insertSckwqgz(Sckwqgz wqgz) {
		if(insert("insertSckwqgz", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Sckwqgz> selectSckwqgz(Sckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("shzt", wqgz.getShzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		hm.put("page", wqgz.getPage());
		hm.put("rows", wqgz.getRows());
		return queryList("selectSckwqgz",hm);
	}

	@Override
	public int selectWqgzCount(Sckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("shzt", wqgz.getShzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		return queryOne("selectWqgzCount",hm);
	}

	@Override
	public boolean deleteSckWqgz(String delstr) {
		if(delete("deleteSckWqgz", delstr)>0)return true;
		else return false;
	}

	@Override
	public boolean updateSckWqgz(Sckwqgz wqgz) {
		if(update("updateSckwqgz", wqgz)>0)return true;
		else return false;
	}

	@Override
	public Sckwqgz selectSckwqgzById(Sckwqgz wqgz) {
		return queryOne("selectSckwqgzById", wqgz);
	}

	@Override
	public boolean xgSckWqgzSbzt(String delstr) {
		if(update("xgSckWqgzSbzt", delstr)>0)return true;
		else return false;
	}

}
