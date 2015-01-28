package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface SckabgcServer {
		boolean insertSckabgc(Sckabgc abgc);
		List<Sckabgc> selectSckabgc(Sckabgc abgc);
		int selectAbgcCount(Sckabgc abgc);
		boolean deleteSckAbgc(String delstr);
		boolean updateSckabgc(Sckabgc abgc);
		Sckabgc selectSckabgcById(Sckabgc abgc);
		boolean xgSckAbgcSbzt(String delstr,Sckabgc abgc);
		List<Sckabgc> selectSckShabgc(Sckabgc abgc);
		int selectAbgcShCount(Sckabgc abgc);
		boolean xgSckAbgcShzt(String delstr,Sckabgc abgc);
		boolean xgSckAbgcTH(Sckabgc abgc);
		boolean bzAbgc(Sckabgc abgc);
		List<SjbbMessage> exportExcel_abgc_scgl(Sckabgc abgc);
		List<SjbbMessage> exportExcel_abgc_scsh(Sckabgc abgc);
		List<SjbbMessage> insertToSheet(Map map);
		boolean importAbgc_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd);
		boolean lrjhSckabgc(Sckabgc abgc);
		boolean xglrjhSckabgc(Sckabgc abgc);
		String yanZhen(List<Map<String, String>> data, String tbbmbm);
}
