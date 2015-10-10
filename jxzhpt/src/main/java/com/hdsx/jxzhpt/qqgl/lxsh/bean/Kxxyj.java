package com.hdsx.jxzhpt.qqgl.lxsh.bean;

import java.io.Serializable;
import java.util.Date;

public class Kxxyj implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String xmmc;
	private String xmbm;
	private String jsdw;
	private String xzqh;
	private String lxbm;//路线编码
	private String qdzh;
	private String zdzh;
	private String dq  ;
	private String sd  ;
	private String kgny;
	private String wgny;
	private String jsjsdj;
	private String jsxz;
	private String gkpfwh;
	private String pfsj;
	private String tzgs;
	private String bzdw;
	private String xzqhdm;
	private int shzt;
	private int sbzt;
	private String dq_m;
	private String sd_m;
	private String tbbmbm;
	private int page;
	private int rows;
	private String xmnf;
	private String gldj;
	private String jsdj;
	private String xmlx;
	private int sbthcd;
	private String sbzt1;
	private String lxbh;
	private String gydwdm;
	private String lc;
	private String jdbs;
	private String lsjl;
	private String gpsqdzh;
	private String gpszdzh;
	private String minqdzh;
	private String maxzdzh;
	private String xjlxbm;//新建录像编码
	private String xjqdzh;//新建起点桩号
	private String xjzdzh;//新建止点桩号
	private String xjlc;//新建里程
	private String yilc;//一级公路里程
	private String erlc;//二级公路里程
	private String sanlc;//三级公路里程
	private String silc;//四级公路里程
	private String dwlc;//等外公路里程
	private String wllc;//无路里程
	private String jhyilc;//建设后一级公路里程
	private String jherlc;//建设后二级公路里程
	private String jhsanlc;//建设后三级公路里程
	private String jhsilc;//建设后四级公路里程
	private String jhdwlc;//建设后等外公路里程
	private String jhwllc;//建设后无路里程
	private String yhdk;//银行贷款
	private String dfzc;//地方自筹
	private String lxmc;//路线名称
	private String qdmc;//起点名称
	private String zdmc;//止点名称
	private String jszlc;//建设总里程
	private String xmsl;//路线数量
	public String getXmsl() {
		return xmsl;
	}
	public void setXmsl(String xmsl) {
		this.xmsl = xmsl;
	}
	public String getJszlc() {
		return jszlc;
	}
	public void setJszlc(String jszlc) {
		this.jszlc = jszlc;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc.trim();
	}
	public String getQdmc() {
		return qdmc;
	}
	public void setQdmc(String qdmc) {
		this.qdmc = qdmc.trim();
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc.trim();
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm.trim();
	}
	public String getYhdk() {
		return yhdk;
	}
	public void setYhdk(String yhdk) {
		this.yhdk = yhdk.trim();
	}
	public String getDfzc() {
		return dfzc;
	}
	public void setDfzc(String dfzc) {
		this.dfzc = dfzc.trim();
	}
	public String getXjlc() {
		return xjlc;
	}
	public void setXjlc(String xjlc) {
		this.xjlc = xjlc.trim();
	}
	public String getXjlxbm() {
		return xjlxbm;
	}
	public void setXjlxbm(String xjlxbm) {
		this.xjlxbm = xjlxbm.trim();
	}
	public String getXjqdzh() {
		return xjqdzh;
	}
	public void setXjqdzh(String xjqdzh) {
		this.xjqdzh = xjqdzh.trim();
	}
	public String getXjzdzh() {
		return xjzdzh;
	}
	public void setXjzdzh(String xjzdzh) {
		this.xjzdzh = xjzdzh.trim();
	}
	public String getYilc() {
		return yilc;
	}
	public void setYilc(String yilc) {
		this.yilc = yilc.trim();
	}
	public String getErlc() {
		return erlc;
	}
	public void setErlc(String erlc) {
		this.erlc = erlc.trim();
	}
	public String getSanlc() {
		return sanlc;
	}
	public void setSanlc(String sanlc) {
		this.sanlc = sanlc.trim();
	}
	public String getSilc() {
		return silc;
	}
	public void setSilc(String silc) {
		this.silc = silc.trim();
	}
	public String getDwlc() {
		return dwlc;
	}
	public void setDwlc(String dwlc) {
		this.dwlc = dwlc.trim();
	}
	public String getWllc() {
		return wllc;
	}
	public void setWllc(String wllc) {
		this.wllc = wllc.trim();
	}
	public String getJhyilc() {
		return jhyilc;
	}
	public void setJhyilc(String jhyilc) {
		this.jhyilc = jhyilc.trim();
	}
	public String getJherlc() {
		return jherlc;
	}
	public void setJherlc(String jherlc) {
		this.jherlc = jherlc.trim();
	}
	public String getJhsanlc() {
		return jhsanlc;
	}
	public void setJhsanlc(String jhsanlc) {
		this.jhsanlc = jhsanlc.trim();
	}
	public String getJhsilc() {
		return jhsilc;
	}
	public void setJhsilc(String jhsilc) {
		this.jhsilc = jhsilc.trim();
	}
	public String getJhdwlc() {
		return jhdwlc;
	}
	public void setJhdwlc(String jhdwlc) {
		this.jhdwlc = jhdwlc.trim();
	}
	public String getJhwllc() {
		return jhwllc;
	}
	public void setJhwllc(String jhwllc) {
		this.jhwllc = jhwllc.trim();
	}
	public String getMinqdzh() {
		return minqdzh;
	}
	public void setMinqdzh(String minqdzh) {
		this.minqdzh = minqdzh.trim();
	}
	public String getMaxzdzh() {
		return maxzdzh;
	}
	public void setMaxzdzh(String maxzdzh) {
		this.maxzdzh = maxzdzh.trim();
	}
	public String getGpsqdzh() {
		return gpsqdzh;
	}
	public void setGpsqdzh(String gpsqdzh) {
		this.gpsqdzh = gpsqdzh.trim();
	}
	public String getGpszdzh() {
		return gpszdzh;
	}
	public void setGpszdzh(String gpszdzh) {
		this.gpszdzh = gpszdzh.trim();
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl.trim();
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm.trim();
	}
	public String getLxbh() {
		return lxbh;
	}
	public void setLxbh(String lxbh) {
		this.lxbh = lxbh.trim();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc.trim();
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm.trim();
	}
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw.trim();
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh.trim();
	}
	public String getQdzh() {
		return qdzh;
	}
	public void setQdzh(String qdzh) {
		this.qdzh = qdzh.trim();
	}
	public String getZdzh() {
		return zdzh;
	}
	public void setZdzh(String zdzh) {
		this.zdzh = zdzh.trim();
	}
	public String getDq() {
		return dq;
	}
	public void setDq(String dq) {
		this.dq = dq.trim();
	}
	public String getSd() {
		return sd;
	}
	public void setSd(String sd) {
		this.sd = sd.trim();
	}
	public String getKgny() {
		return kgny;
	}
	public void setKgny(String kgny) {
		this.kgny = kgny;
	}
	public String getWgny() {
		return wgny;
	}
	public void setWgny(String wgny) {
		this.wgny = wgny;
	}
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj.trim();
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz.trim();
	}
	public String getGkpfwh() {
		return gkpfwh;
	}
	public void setGkpfwh(String gkpfwh) {
		this.gkpfwh = gkpfwh.trim();
	}
	public String getPfsj() {
		return pfsj;
	}
	public void setPfsj(String pfsj) {
		this.pfsj = pfsj;
	}
	public String getTzgs() {
		return tzgs;
	}
	public void setTzgs(String tzgs) {
		this.tzgs = tzgs.trim();
	}
	public String getBzdw() {
		return bzdw;
	}
	public void setBzdw(String bzdw) {
		this.bzdw = bzdw.trim();
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm.trim();
	}
	public int getShzt() {
		return shzt;
	}
	public void setShzt(int shzt) {
		this.shzt = shzt;
	}
	public int getSbzt() {
		return sbzt;
	}
	public void setSbzt(int sbzt) {
		this.sbzt = sbzt;
	}
	public String getDq_m() {
		return dq_m;
	}
	public void setDq_m(String dq_m) {
		this.dq_m = dq_m.trim();
	}
	public String getSd_m() {
		return sd_m;
	}
	public void setSd_m(String sd_m) {
		this.sd_m = sd_m.trim();
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm.trim();
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj.trim();
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj.trim();
	}
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public int getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(int sbthcd) {
		this.sbthcd = sbthcd;
	}
	public String getSbzt1() {
		return sbzt1;
	}
	public void setSbzt1(String sbzt1) {
		this.sbzt1 = sbzt1;
	}
	
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc;
	}
	@Override
	public String toString() {
		return "Kxxyj [id=" + id + ", xmmc=" + xmmc + ", xmbm=" + xmbm
				+ ", jsdw=" + jsdw + ", xzqh=" + xzqh + ", qdzh=" + qdzh
				+ ", zdzh=" + zdzh + ", dq=" + dq + ", sd=" + sd + ", kgny="
				+ kgny + ", wgny=" + wgny + ", jsjsdj=" + jsjsdj + ", jsxz="
				+ jsxz + ", gkpfwh=" + gkpfwh + ", pfsj=" + pfsj + ", tzgs="
				+ tzgs + ", bzdw=" + bzdw + ", xzqhdm=" + xzqhdm + ", shzt="
				+ shzt + ", sbzt=" + sbzt + ", dq_m=" + dq_m + ", sd_m=" + sd_m
				+ ", tbbmbm=" + tbbmbm + ", page=" + page + ", rows=" + rows
				+ ", xmnf=" + xmnf + ", gldj=" + gldj + ", jsdj=" + jsdj
				+ ", xmlx=" + xmlx + ", sbthcd=" + sbthcd + ", sbzt1=" + sbzt1
				+ ", lxbh=" + lxbh + ", gydwdm=" + gydwdm + "]";
	}
	
}
