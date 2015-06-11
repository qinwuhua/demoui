package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;

public interface GcglgcgzsjServer {

	Boolean insertgcgzsjYb(Gcglgcgzsj gcglgcgzsj);

	int selectgcgzsjYbByJhidCount(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> selectgcgzsjYbByJhid(Gcglgcgzsj gcglgcgzsj);

	Boolean updategcgzsjYb(Gcglgcgzsj gcglgcgzsj);

	Boolean deletegcgzsjYb(Gcglgcgzsj gcglgcgzsj);

	Boolean shgcgzsjyb(Gcglgcgzsj gcglgcgzsj);

	Boolean insertGcgzsjCgs(Gcglgcgzsj gcglgcgzsj);

	int selectGcgzsjCgsListCount(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> selectGcgzsjCgsList(Gcglgcgzsj gcglgcgzsj);

	Boolean updateGcgzsjCgs(Gcglgcgzsj gcglgcgzsj);

	Boolean deleteGcgzsjCgs(Gcglgcgzsj gcglgcgzsj);

	Gcglgcgzsj downWqgzFile(Gcglgcgzsj gcglgcgzsj);

	boolean uploadWqgzFilesgxk(Gcglgcgzsj gcglgcgzsj);

	boolean uploadWqgzFilejgtc(Gcglgcgzsj gcglgcgzsj);

	boolean uploadWqgzFilejgys(Gcglgcgzsj gcglgcgzsj);

	Boolean insertWqgzkg(Gcglgcgzsj gcglgcgzsj);

	Boolean insertWqgzwg(Gcglgcgzsj gcglgcgzsj);

	Boolean insertWqgzwwg(Gcglgcgzsj gcglgcgzsj);

	int selectWqgzjhListCount(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> selectWqgzjhList(Gcglgcgzsj gcglgcgzsj);

	Gcglgcgzsj selectWqgzjhFile(Gcglgcgzsj gcglgcgzsj);

	int selectgcgzsjYbByJhidCount1(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> selectgcgzsjYbByJhid1(Gcglgcgzsj gcglgcgzsj);

	Boolean sbWqgzYb(Gcglgcgzsj gcglgcgzsj);

	List<Gcglgcgzsj> exportAbyb1(Gcglgcgzsj gcglgcgzsj);

	Gcglgcgzsj queryCGSByYf(Gcglgcgzsj gcglgcgzsj);

	List<Map<String,Object>> queryGcgjList(Gcglgcgzsj gcglgcgzsj);

	int queryGcgjListCount(Gcglgcgzsj gcglgcgzsj);

	List<Map<String,Object>> selectWqgzjhList2(Gcglgcgzsj gcglgcgzsj);

	int selectWqgzjhListcount1(Gcglgcgzsj gcglgcgzsj);
	
}
