var cllTabID;
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
		callBackFn();
		return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
	var rowid = tlv8.RequestURLParam.getParam("sData1"); // 获取url参数
	if (rowid != null && rowid != "") {
		datamian.setRowId(rowid);
		datamian.refreshData();
	} else {
		initData();
		creatTextEditor();
	}
	new tlv8.picComponent(J$("picDemo"), datamian, "sminipic", true, true);
	new tlv8.fileComponent(document.getElementById("fileCompDiv"), datamian, "faccessories");
	cllTabID = tlv8.RequestURLParam.getParam("tabID");
}

var kindEditor1;
function creatTextEditor() {
	kindEditor1 = KindEditor.create('textarea[name="freleaseconnext"]', {
		cssPath: cpath + '/comon/kindeditor/plugins/code/prettify.css',
		uploadJson: cpath + '/kindeditor/kindEditorUpload',
		fileManagerJson: cpath + '/kindeditor/file_manager_json',
		allowFileManager: false,
		afterCreate: function() {
			var self = this;
			KindEditor.ctrl(document, 13, function() {
				self.sync();
			});
			KindEditor.ctrl(self.edit.doc, 13, function() {
				self.sync();
			});
		}
	});
	prettyPrint();
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
	$("#freleaseconnext").val(kindEditor1.html());
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

function initData(){
	$("#freleasedepartment").val(tlv8.Context.getCurrentDeptName());
	$("#fpeople").val(tlv8.Context.getCurrentPersonName());
	$("#ftime").val(tlv8.System.Date.sysDateTime());
	$("#fstate").val("编辑中");
}

// 刷新后触发
function afterDatarefresh() {
	creatTextEditor();
}

// 预览
function selectColumn(){
	tlv8.portal.dailog.openDailog("选择新闻栏目", "/OA/news/dialog/SelectNewColumnDialog.html", 640, 450, function(re) {
		$("#fcolumnname").val(re.fcolumnname);
	});
}

function viewSurvey(){
	var rowid = datamian.saveData();
	if(rowid){
		tlv8.portal.openWindow("新闻浏览", "/OA/news/showDetail.html?rowid="+rowid+"&isbrow=true");
	}
}

// 新闻发布
function publishServey() {
	$("#freleaseconnext").val(kindEditor1.html());
	var rowid = datamian.saveData();
	if(rowid){
		$("#fstate").val("已发布");
		dataSave();
	}
}

function callBackFn(){
	tlv8.portal.callBack(cllTabID,"mycallBackFn","ok");
}