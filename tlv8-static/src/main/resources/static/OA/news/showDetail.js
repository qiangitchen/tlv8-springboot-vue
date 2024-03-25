//数据配置
var datamian;
function initDocumentPage() {
	datamian = new tlv8.Data();
	datamian.setDbkey("spring");
	datamian.setTable("oa_news_release");
	datamian.setFormId("MAIN_DATA_FORM");
	layui.form.on('submit(mainform)', function(data) {
		//console.log(data.field);
		datamian.saveData(data.field);
		return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
	var rowid = tlv8.RequestURLParam.getParam("rowid");
	if(rowid && rowid != ""){
		datamian.setRowId(rowid);
		datamian.refreshData();
		var isbrow = tlv8.RequestURLParam.getParam("isbrow");
		if(!isbrow){
			var param = new tlv8.RequestParam();
			param.set("rowid", rowid);
			tlv8.XMLHttpRequest("loadNewBrowsCount", param, "post", true, function(redata) {
				$("#NEWS_NUMBER111").text(redata.data.data);
			});
		}
	}
	new tlv8.fileComponent(J$("fileCompDiv"), datamian, "FACCESSORIES", null, false, false);
}

//新增数据
function dataInsert(){
	J$("MAIN_DATA_FORM").reset();
	J$("MAIN_DATA_FORM").rowid = "";
	J$("MAIN_DATA_FORM").setAttribute("rowid", "");
	$("#MAIN_DATA_FORM").attr("rowid", "");
}

//数据保存
function dataSave() {
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

function mainDataloaded(event){
	$("#NEWS_TITLE").text(datamian.getValueByName("fnewstitle"));
	$("#NEWS_PEOPLE").text(datamian.getValueByName("fpeople"));
	$("#NEWS_FTIME").text(datamian.getValueByName("ftime"));
	$("#NEWS_RELEASECONNEXT").html(datamian.getValueByName("freleaseconnext"));
	writeReadStateInfo();
}

/*
 * 已阅人员列表
 */
function readorList() {
	var rowid = justep.yn.RequestURLParam.getParam("rowid");
	justep.yn.portal.dailog.openDailog("已阅人员信息",
			"/OA/News/notes-reader-list.html?rowid="
					+ rowid, 500, 400, null, {
				refreshItem : false,
				enginItem : false,
				CanclItem : true
			});
}

/*
 * 回写已阅
 */
function writeReadStateInfo() {
	var param = new tlv8.RequestParam();
	param.set("rowid", datamian.rowid);
	tlv8.XMLHttpRequest("writeNewsReadRecord", param, "post", true, function(res){
		if(res.data.flag=="false"){
			layui.layer.alert(res.data.message);
		}
	});
}