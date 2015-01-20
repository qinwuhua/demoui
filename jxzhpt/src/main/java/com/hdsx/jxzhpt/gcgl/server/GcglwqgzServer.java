package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;

public interface GcglwqgzServer {

	Boolean insertWqgzYb(Gcglwqgz gcglwqgz);

	int selectWqgzYbByJhidCount(Gcglwqgz gcglwqgz);

	List<Gcglwqgz> selectWqgzYbByJhid(Gcglwqgz gcglwqgz);

	Boolean updateWqgzYb(Gcglwqgz gcglwqgz);

	Boolean deleteWqgzYb(Gcglwqgz gcglwqgz);

	Boolean shwqgzyb(Gcglwqgz gcglwqgz);

	Boolean insertWqgzCgs(Gcglwqgz gcglwqgz);

	int selectWqgzCgsListCount(Gcglwqgz gcglwqgz);

	List<Gcglwqgz> selectWqgzCgsList(Gcglwqgz gcglwqgz);

	Boolean updateWqgzCgs(Gcglwqgz gcglwqgz);

	Boolean deletewqgzCgs(Gcglwqgz gcglwqgz);

	boolean uploadWqgzFilesgxk(Gcglwqgz gcglwqgz);

	boolean uploadWqgzFilejgtc(Gcglwqgz gcglwqgz);

	boolean uploadWqgzFilejgys(Gcglwqgz gcglwqgz);

	Gcglwqgz downWqgzFile(Gcglwqgz gcglwqgz);

	Boolean insertWqgzwwg(Gcglwqgz gcglwqgz);

	Boolean insertWqgzwg(Gcglwqgz gcglwqgz);

	Boolean insertWqgzkg(Gcglwqgz gcglwqgz);

	int selectWqgzjhListCount(Gcglwqgz gcglwqgz);

	List<Gcglwqgz> selectWqgzjhList(Gcglwqgz gcglwqgz);

	Gcglwqgz selectWqgzjhFile(Gcglwqgz gcglwqgz);

	Boolean deleteWqgzFile(Gcglwqgz gcglwqgz);


}