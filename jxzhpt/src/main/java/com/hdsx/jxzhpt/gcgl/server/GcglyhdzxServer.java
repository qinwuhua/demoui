package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglyhdzxServer {

	Boolean insertYhdzxYb(Gcglyhdzx gcglyhdzx);

	int selectYhdzxYbByJhidCount(Gcglyhdzx gcglyhdzx);

	List<Gcglyhdzx> selectYhdzxYbByJhid(Gcglyhdzx gcglyhdzx);

	Boolean updateYhdzxYb(Gcglyhdzx gcglyhdzx);

	Boolean deleteYhdzxYb(Gcglyhdzx gcglyhdzx);

	Boolean shYhdzxYb(Gcglyhdzx gcglyhdzx);

	Boolean insertYhdzxCgs(Gcglyhdzx gcglyhdzx);

	int selectYhdzxCgsListCount(Gcglyhdzx gcglyhdzx);

	List<Gcglabgc> selectYhdzxCgsList(Gcglyhdzx gcglyhdzx);

	Boolean updateYhdzxCgs(Gcglyhdzx gcglyhdzx);

	Boolean deleteYhdzxCgs(Gcglyhdzx gcglyhdzx);

	Gcglyhdzx downWqgzFile(Gcglyhdzx gcglyhdzx);

	boolean uploadWqgzFilesgxk(Gcglyhdzx gcglyhdzx);

	boolean uploadWqgzFilejgtc(Gcglyhdzx gcglyhdzx);

	boolean uploadWqgzFilejgys(Gcglyhdzx gcglyhdzx);

	Boolean insertWqgzkg(Gcglyhdzx gcglyhdzx);

	Boolean insertWqgzwg(Gcglyhdzx gcglyhdzx);

	Boolean insertWqgzwwg(Gcglyhdzx gcglyhdzx);

	int selectWqgzjhListCount(Gcglyhdzx gcglyhdzx);

	List<Gcglyhdzx> selectWqgzjhList(Gcglyhdzx gcglyhdzx);

	Gcglyhdzx selectWqgzjhFile(Gcglyhdzx gcglyhdzx);

	
}
