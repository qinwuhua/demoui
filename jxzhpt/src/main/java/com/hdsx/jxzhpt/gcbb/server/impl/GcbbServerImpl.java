package com.hdsx.jxzhpt.gcbb.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.bean.GcgjJd;
import com.hdsx.jxzhpt.gcbb.server.GcbbServer;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class GcbbServerImpl extends BaseOperate implements GcbbServer{
	public GcbbServerImpl() {
		super("gcbb", "jdbc");
	}

	@Override
	public List<GcgjJd> selGcgjJdbb(Xmbb xmbb) {
		return queryList("selGcgjJdbb",xmbb);
	}

	@Override
	public List<GcgjJd> selShuihJdbb(Xmbb xmbb) {
		return queryList("selShuihJdbb",xmbb);
	}
}
