/*==数据源===此项为必须定义==*/
var data = new tlv8.Data();
data.setDbkey("spring");//指定使用数据库连接
data.setTable("oa_news_count");//指定grid对应的表
data.setOrderby("yetdate desc");
/*====*/
var currentgrid;
function getData() {
	var d = document.getElementById("main-grid-view");
	var labelid = "No,yetperson,yetdate";//设置字段
	var labels = "No.,浏览人,浏览时间";//设置标题
	var labelwidth = "60,120,160";//设置宽度
	var datatype = "ro,string,datetime";//设置字段类型
	var dataAction = {
		"queryAction" : "getGridAction",//查询动作
		"savAction" : "saveAction",//保存动作
		"deleteAction" : "deleteAction"//删除动作
	};
	var rowid = tlv8.RequestURLParam.getParam("rowid");
	var swhere = "news_releaseid='"+rowid+"'";
	var maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth,
		dataAction, "100%", "100%", data, 20, swhere, "", "", datatype,
		"false", "true");
	//设置按钮显示{新增、保存、刷新、删除}
	maingrid.grid.settoolbar(false, false, true, false);
	//设置是否可编辑
	maingrid.grid.seteditModel(false);
	currentgrid = maingrid.grid;
	currentgrid.refreshData();//刷新数据
}