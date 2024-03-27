/*==数据源===此项为必须定义==*/
var data = new tlv8.Data();
data.setDbkey("spring");//指定使用数据库连接
data.setTable("oa_news_release");//指定grid对应的表
data.setOrderby("ftime desc");
data.setCascade("oa_news_open:fnewsid,oa_news_count:news_releaseid");
		
/*====*/
var currentgrid;
function getData() {
	var d = document.getElementById("main-grid-view");
	var labelid = "No,fnewstitle,fcolumnname,ftype,fstate,freleasedepartment,fpeople,ftime";//设置字段
	var labels = "No.,新闻标题,栏目名称,发布类型,状态,发布部门,发布人,发布时间";//设置标题
	var labelwidth = "40,280,180,120,100,120,100,150";//设置宽度
	var datatype = "ro,html:readTitle,string,string,string,string,string,datetime";//设置字段类型
	var dataAction = {
		"queryAction" : "getGridAction",//查询动作
		"savAction" : "saveAction",//保存动作
		"deleteAction" : "deleteAction"//删除动作
	};
	var maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth,
		dataAction, "100%", "100%", data, 20, "", "", "", datatype,
		"false", "true");
	//设置按钮显示{新增、保存、刷新、删除}
	maingrid.grid.settoolbar(true, false, true, true);
	//设置是否可编辑
	maingrid.grid.seteditModel(false);
	currentgrid = maingrid.grid;
	currentgrid.refreshData();//刷新数据
	document.getElementById(d.id + "_insertItem").onclick = addData;
}

function readTitle(event){
	return '<a href="javascript:editData(\''+event.rowid+'\')">'+event.value+'</a>';
}

function addData(){
	tlv8.portal.openWindow("新闻发布", '/OA/news/newsEdit.html?tabID='+tlv8.portal.currentTabId());
}

function editData(rowid){
	tlv8.portal.openWindow("新闻编辑", '/OA/news/newsEdit.html?sData1='+rowid+'&tabID='+tlv8.portal.currentTabId());
}

/**
@param {object} event 
*/
function gridrowdbclick(event){
	var rowid = currentgrid.getCurrentRowId();
	editData(rowid);
}

function mycallBackFn(data) {
	currentgrid.refreshData();//刷新数据
}