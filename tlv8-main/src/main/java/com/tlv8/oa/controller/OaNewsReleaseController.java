package com.tlv8.oa.controller;

import com.tlv8.oa.pojo.OaNewsCount;
import com.tlv8.oa.pojo.OaNewsRelease;
import com.tlv8.oa.service.OaNewsCountService;
import com.tlv8.oa.service.OaNewsReleaseService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;
import com.alibaba.fastjson.JSONArray;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OaNewsReleaseController {
	@Autowired
	OaNewsReleaseService oaNewsReleaseService;
	@Autowired
	OaNewsCountService oaNewsCountService;

	/**
	 * 加载可以查看的新闻信息
	 * 
	 * @return
	 */
	@RequestMapping("/loadNewsAction")
	public Object loadNewsAction() {
		Data data = new Data();
		try {
			String userid = ContextUtils.getContext().getCurrentPersonID();
			SQL sql = new SQL();
			sql.SELECT_DISTINCT("n.FID, FNEWSTITLE FTITLE, FPEOPLE, FTIME FPEOPLEDATE");
			sql.FROM("oa_news_release n");
			sql.LEFT_OUTER_JOIN("oa_news_open o on o.fnewsid = n.fid");
			sql.WHERE("n.FSTATE='已发布'");
			sql.WHERE("(n.ftype = '集体发布' or (n.ftype = '限制发布' and o.fopenid = ?) )");
			List<Object> param = new ArrayList<Object>();
			param.add(userid);
			List<Map<String, String>> list = DBUtils.selectStringList("oa", sql.toString(), param, true);
			data.setData(JSONArray.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 加载新闻浏览次数
	 * 
	 * @param rowid
	 * @return
	 */
	@RequestMapping("/loadNewBrowsCount")
	public Object loadNewBrowsCount(String rowid) {
		Data data = new Data();
		try {
			SQL sql = new SQL();
			sql.SELECT("count(*) CON");
			sql.FROM("oa_news_count");
			sql.WHERE("news_releaseid=?");
			List<Object> param = new ArrayList<Object>();
			param.add(rowid);
			List<Map<String, String>> list = DBUtils.selectStringList("oa", sql.toString(), param, true);
			if (list.size() > 0) {
				data.setData(list.get(0).get("CON"));
			} else {
				data.setData("0");
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 写新闻浏览记录
	 * 
	 * @param rowid
	 * @return
	 */
	@RequestMapping("/writeNewsReadRecord")
	public Object writeNewsReadRecord(String rowid) {
		Data data = new Data();
		try {
			OaNewsRelease news = oaNewsReleaseService.selectByPrimaryKey(rowid);
			if (news != null) {
				ContextBean context = ContextUtils.getContext();
				OaNewsCount oaNewsCount = new OaNewsCount();
				oaNewsCount.setFid(IDUtils.getGUID());
				oaNewsCount.setNewsReleaseid(rowid);
				oaNewsCount.setYetpersonid(context.getCurrentPersonID());
				oaNewsCount.setYetperson(context.getCurrentPersonName());
				oaNewsCount.setYetdate(new Date());
				oaNewsCountService.insert(oaNewsCount);
				data.setFlag("true");
			} else {
				data.setFlag("false");
				data.setMessage("指定的新闻ID无效~");
			}
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("数据保存错误!");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

}
