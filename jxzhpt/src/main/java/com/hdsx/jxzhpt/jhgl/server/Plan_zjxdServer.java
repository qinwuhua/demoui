package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;

public interface Plan_zjxdServer {
	/**
	 * 根据项目ID查找资金下发的列表
	 * @param id
	 * @return
	 */
	List<Plan_zjxd> queryZjxdByXmId(String id);
	/**
	 * 资金下达信息数量
	 * @param id 项目ID
	 * @return
	 */
	int queryZjxdCount(String id);
	/**
	 * 添加资金下达信息
	 * @param zjxd
	 */
	boolean addZjxd(Plan_zjxd zjxd);
	/**
	 * 根据ID删除资金下发信息
	 * @param id
	 * @return
	 */
	boolean dropZjxd(String id);
	/**
	 * 修改资金下发信息
	 * @param zjxd
	 * @return
	 */
	boolean editZjxd(Plan_zjxd zjxd);
	/**
	 * 根据ID查找对应下达信息
	 * @param id
	 * @return
	 */
	Plan_zjxd queryZjxdById(String id);
}