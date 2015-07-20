package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;


public interface TjfxServer {

	Map<String, Object> queryByNfAndXzqhdm(String nf,String xzqhdm);

	List<Map<String, Object>> queryXzqhQsfx(String xzqhdm, String nf, String end);

	List<Map<String, Object>> queryXmlxtjqsfx(String xzqhdm, String nf, String end);

	Map<String, Object> queryGckXzqhtj(String xzqhdm, String nf);

	List<Map<String, Object>> queryGckXmlxtj(String nf, String xzqhdm);

	List<Map<String,Object>> queryGckXmlxTjtLstz(String nf, String xzqhdm);

	Map<String, Object> queryTzebl(String nf, String xzqhdm);

	Map<String, Object> queryGckLcWcbl(String nf, String dm);

	Map<String, Object> queryGckCgsWcbl(String nf, String dm);

	Map<String, Object> queryGckTzWcbl(String nf, String dm);

	Map<String, Object> queryGckJhgcltj(String nf, String xzqhdm);

	Map<String, Object> queryJcktj(String nf, String xzqh);
}