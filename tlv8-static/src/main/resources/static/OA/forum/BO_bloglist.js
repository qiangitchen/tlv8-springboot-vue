var currentgrid = "";
var data = new tlv8.Data();
data.setDbkey("oa");
data.setTable("bo_blog");
function initPgaeGrid() {
	var d = document.getElementById("maingridview");
	var labelid = "No,NAME,DESCRIPTION,COMMENT_AUDIT,CHAIRMAN,SETTING,BLOGCATEGORY";
	var labels = "No.,名称,简介描述,是否审核,版主,设置,分类";
	var labelwidth = "40,120,120,120,120,100,100";
	var datatype = "ro,html:reader,ro,ro,ro,ro,ro";// 设置字段类型
	var dataAction = {
		"queryAction" : "getGridAction",
		"savAction" : "saveAction",
		"deleteAction" : "deleteAction"
	};
	// 创建grid
	var gridmain = new tlv8.createGrid(d, labelid, labels,
			labelwidth, dataAction, "100%", "100%", data, 20, "", "", "",
			datatype, "false", "true");
	// 设置toobar显示{新增、保存、刷新、删除}
	gridmain.grid.settoolbar(true, false, true, true);
	// 设置是否可编辑
	currentgrid = gridmain.grid;
	currentgrid.setExcelimpBar(true);// 导入
	currentgrid.setExcelexpBar(true);// 导出
	currentgrid.refreshData();
	$("#" + d.id + "_insertItem").get(0).onclick = function() {
		tlv8.portal.dailog.openDailog("新增讨论区",
				"/OA/forum/BO_blogadd.html", 800, 480, callBackFn, false);
	};
}

function callBackFn() {
	currentgrid.refreshData();
}
function editOrgData(event) {
	tlv8.portal.dailog.openDailog("编辑讨论区",
			"/OA/forum/BO_blogadd.html?gridrowid="
					+ event.CurrentRowId, 800, 480, callBackFn, false);

}
function reader(event) {
	var html = "<a href='javascript:void(0);' onclick='griddbclick(this)'>"
			+ event.value + "</a>";
	return html;
}
function griddbclick(obj) {
	setTimeout('QueryDetailAction()', 5);
}
function QueryDetailAction() {
	var rowid = currentgrid.CurrentRowId;
	tlv8.portal.dailog.openDailog("编辑讨论区",
			"/OA/forum/BO_blogadd.html?gridrowid=" + rowid, 800,
			480, callBackFn, false);
}
