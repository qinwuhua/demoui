package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_abgcServer {
	/**
	 * 查询列表
	 * @param page
	 * @param rows
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_abgc> queryAbgcList(int page,int rows,Plan_abgc jh,Jckabgc lx);
	
	/**
	 * 查询数量
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryAbgcCount(Plan_abgc jh,Jckabgc lx);
	/**
	 * 年份列表
	 * @return
	 */
	List<TreeNode> queryAbgcNfs();
	/**
	 * 根据ID查询对应详细信息
	 * @param id
	 * @return
	 */
	Plan_abgc queryAbgcById(String id);
	/**
	 * 根据ID删除安保工程
	 * @param id
	 */
	boolean dropAbgcById(String id);
}