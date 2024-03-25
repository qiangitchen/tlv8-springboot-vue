//工具条
var toolbarItem;
function init_toolbar() {
	var bardiv = $("#stander-bar")[0];
	var toobar = new tlv8.toolbar(bardiv, false, "readonly", false,
			true);
	toolbarItem = toobar.items;
}
var ok = false;
//数据配置
var datamian;
function initDocumentPage() {
	datamian = new tlv8.Data();
	datamian.setDbkey("spring");
	datamian.setTable("oa_news_column");
	datamian.setFormId("MAIN_DATA_FORM");
	init_toolbar();
	layui.form.on('submit(mainform)', function(data) {
		//console.log(data.field);
		var rowid = datamian.saveData(data.field);
		if(rowid && ok){
			tlv8.portal.dailog.dailogEngin();
		}
		return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
	var rowid = tlv8.RequestURLParam.getParam("rowid");
	if(rowid && rowid != ""){
		J$("MAIN_DATA_FORM").rowid = rowid;
		J$("MAIN_DATA_FORM").setAttribute("rowid", rowid);
		datamian.setRowId(rowid);
		dataRefresh();
	}
}

//数据保存
function dataSave() {
	ok = false;
	$("#mainfsub").click();
}

//数据刷新
function dataRefresh(){
	datamian.refreshData();
}

//数据删除
function dataDeleted(){
	if(datamian.deleteData()){
		dataRefresh();
	}
}

//对话框确认事件
function dailogEngin(){
   ok = true;
   $("#mainfsub").click();
   return false;
}