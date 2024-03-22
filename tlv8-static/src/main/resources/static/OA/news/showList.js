/*==数据源===此项为必须定义==*/
var data = new tlv8.Data();
data.setDbkey("spring");//指定使用数据库连接
data.setTable("oa_news_release");//指定grid对应的表
data.setOrderby("ftime desc");
		
/*====*/
var currentgrid;
function getData() {
	var d = document.getElementById("main-grid-view");
	var labelid = "No,fnewstitle,freleasedepartment,fpeople,ftime,fcount";//设置字段
	var labels = "No.,新闻标题,发布部门,发布人,发布时间,浏览次数";//设置标题
	var labelwidth = "40,480,180,100,150,100";//设置宽度
	var datatype = "ro,html:readTitle,string,string,datetime,number";//设置字段类型
	var dataAction = {
		"queryAction" : "getShowNewsGridAction",//查询动作
		"savAction" : "saveAction",//保存动作
		"deleteAction" : "deleteAction"//删除动作
	};
	var maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth,
		dataAction, "100%", "100%", data, 20, "", "", "", datatype,
		"false", "true");
	//设置按钮显示{新增、保存、刷新、删除}
	maingrid.grid.settoolbar(false, false, true, false);
	//设置是否可编辑
	maingrid.grid.seteditModel(false);
	currentgrid = maingrid.grid;
	currentgrid.refreshData();//刷新数据
}

function readTitle(event){
	return '<a href="javascript:showNewsDetail(\''+event.rowid+'\')">'+event.value+'</a>';
}

/**
@param {object} event 
*/
function cgridDbClicked(event){
	var rowid = currentgrid.getCurrentRowId();
	showNewsDetail(rowid);
	
}

function showNewsDetail(rowid){
	tlv8.portal.openWindow("新闻浏览", "/OA/news/showDetail.html?rowid="+rowid);
}