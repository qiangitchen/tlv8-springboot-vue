/*==数据源===此项为必须定义==*/
var data = new tlv8.Data();
data.setDbkey("spring");//指定使用数据库连接
data.setTable("oa_news_column");//指定grid对应的表
		
/*====*/
var disablestateItem;// 禁用状态按钮
var ablestateItem;// 启用状态按钮
var currentgrid;
function getData() {
	var d = document.getElementById("main-grid-view");
	var labelid = "No,fcolumncode,fcolumnname,fcolumndescribes,fcolumnstate";//设置字段
	var labels = "No.,栏目编号,栏目名称,栏目描述,栏目状态";//设置标题
	var labelwidth = "40,120,200,280,100";//设置宽度
	var datatype = "ro,string,string,string,string";//设置字段类型
	var dataAction = {
		"queryAction" : "getGridAction",//查询动作
		"savAction" : "saveAction",//保存动作
		"deleteAction" : "deleteAction"//删除动作
	};
	var maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth,
		dataAction, "100%", "100%", data, 20, "", "", "", datatype,
		"false", "true");
	//设置按钮显示{新增、保存、刷新、删除}
	maingrid.grid.settoolbar(true, false, true, "readonly");
	//设置是否可编辑
	maingrid.grid.seteditModel(false);
	currentgrid = maingrid.grid;
	currentgrid.refreshData();//刷新数据
	document.getElementById(d.id + "_insertItem").onclick = addData;
	disablestateItem = currentgrid.insertSelfBar("禁用", "60px",
			"", "../../../comon/image/statusaction/un_disable.gif", true);
	ablestateItem = currentgrid.insertSelfBar("启用", "60px",
			"", "../../../comon/image/statusaction/un_enable.gif", true);
}

function addData(){
	tlv8.portal.dailog.openDailog("添加-栏目信息", '/OA/news/newsColumnDetail.html', 800, 500, function() {
		currentgrid.refreshData();
	});
}

function griddbclick(event){
	var rowid = currentgrid.getCurrentRowId();
	tlv8.portal.dailog.openDailog('编辑-栏目信息', '/OA/news/newsColumnDetail.html?rowid='+rowid, 800, 500, function() {
		currentgrid.refreshData();
	});
}

// 行选中事件
function selectedItem(event) {
	var rowid = event.CurrentRowId;
	var state = currentgrid.getValueByName("fcolumnstate", rowid);
	if (state == "已关闭") {
		currentgrid.settoolbar("no", false, true, true);
		document.getElementById(disablestateItem+"_img").src = "../../../comon/image/statusaction/un_disable.gif";
		document.getElementById(disablestateItem).onclick = null;
		document.getElementById(ablestateItem+"_img").src = "../../../comon/image/statusaction/enable.gif";
		document.getElementById(ablestateItem).onclick = ablestate;
	} else {
		currentgrid.settoolbar("no", false, true, "readonly");
		document.getElementById(disablestateItem+"_img").src = "../../../comon/image/statusaction/disable.gif";
		document.getElementById(disablestateItem).onclick = disablestate;
		document.getElementById(ablestateItem+"_img").src = "../../../comon/image/statusaction/un_enable.gif";
		document.getElementById(ablestateItem).onclick = null;
	}
}

function disablestate(){
	layui.layer.confirm("确定禁用当前选中的栏目吗?",function(r){if(r){
		layui.layer.closeAll();
		var rowid = currentgrid.getCurrentRowId();
		currentgrid.setValueByName("fcolumnstate", rowid, "已关闭");
		currentgrid.saveData();
	}});
}

function ablestate(){
	layui.layer.confirm("确定启用当前选中的栏目吗?",function(r){if(r){
		layui.layer.closeAll();
		var rowid = currentgrid.getCurrentRowId();
		currentgrid.setValueByName("fcolumnstate", rowid, "已启用");
		currentgrid.saveData();
	}});
}