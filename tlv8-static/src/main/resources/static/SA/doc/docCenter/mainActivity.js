var uploader = null;
var docAuthList = null;
var currentRootAccess = null;
var docAuthListArr = null;

var data = new tlv8.Data();
data.setTable("SA_DOCNODE");
data.setDbkey("system");
data.setOrderby("SCREATETIME desc");

var maingrid = null, currentgrid = null, doc_upload_item, doc_dowload_item;
var editer_item, docHistory_item, docDownloadRecord_item, browseDoc_item;

/* 创建树 */
var param = {
	cell : {
		id : "SID",// 设置构建树的id
		name : "SDOCNAME",// 树显示的名称
		parent : "SPARENTID",// 表示树的层级
		other : "SKIND,SDOCPATH,SDOCDISPLAYPATH,SCREATORNAME,SNAMESPACE,SCREATORFID",// "SFID,SFNAME,SORGKINDID",
		tableName : "SA_DOCNODE",// 对应的表名
		databaseName : "system",// 数据库
		rootFilter : "SPARENTID is null",// 跟节点条件
		filter : "SKIND = 'dir'"
	},
	action : "TreeSelectAction"
};
// 设置树的属性
var setting = {
	view : {
		selectedMulti : false, // 设置是否允许同时选中多个节点。默认值: true
		autoCancelSelected : false,
		dblClickExpand : true
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	async : {
		enable : true,
		url : "TreeSelectAction",
		autoParam : [ "id=currenid" ],
		type : "post"
	},
	isquickPosition : {
		enable : false, // 是否有快速查询框
		url : "QuickTreeAction",
		path : "SDOCPATH"
	},
	callback : {
		onClick : treeselected
	}

};
function getData() {
	var d = J$("main-grid-view");
	var labelid = "No,SDOCNAME,SSIZE,SFILEID,SDOCPATH,SDOCDISPLAYPATH,SCREATORNAME,SCREATORDEPTNAME,SCREATETIME"
			+ ",SCACHENAME,SDOCLIVEVERSIONID,SNAMESPACE,SDOCSERIALNUMBER,SKEYWORDS,SCLASSIFICATION,SDESCRIPTION,SKIND,SCREATORFID,SFLAG";
	var labels = "NO.,名称,文件大小(KB),文件ID,SDOCPATH,文件路径,创建人,创建部门,创建时间"
			+ ",SCACHENAME,SDOCLIVEVERSIONID,SNAMESPACE,SDOCSERIALNUMBER,SKEYWORDS,SCLASSIFICATION,SDESCRIPTION,SKIND,SCREATORFID,SFLAG";
	var labelwidth = "40,200,110,100,0,200,100,100,120"
			+ ",0,0,0,0,0,0,0,0,0,0";
	var datatype = "ro,string,string,string,string,CLOB,string,string,datetime"
			+ ",ro,ro,ro,ro,ro,ro,ro,ro,ro,ro";// 设置字段类型
	var dataAction = {
		"queryAction" : "getGridAction",
		"savAction" : "saveAction",
		"deleteAction" : "docCenterDeleteFileAction"
	};
	var where = " SKIND != 'dir' and sID != 'root' and (SFILEID is not null or SFILEID !='') and SDOCNAME !='Message' ";
	maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth, dataAction,
			"100%", "100%", data, 20, where, "main_org_trr", "SPARENTID",
			datatype, false, true);
	// 设置按钮显示{新增、保存、刷新、删除}
	maingrid.grid.settoolbar(false, false, true, "readonly");
	// 设置是否可编辑
	maingrid.grid.seteditModel(false);
	currentgrid = maingrid.grid;
	J$("main-grid-view_insertItem").onclick = function() {
		// newOrgData();
	};
	doc_upload_item = currentgrid.insertSelfBar("上传文件", "70px", "",
			"../../../comon/image/toolbar/doc/newfile.gif");
	editer_item = currentgrid.insertSelfBar("编辑文件", "40px", "",
			"../../../comon/image/doc/edit_file_g.gif");
	doc_dowload_item = currentgrid.insertSelfBar("下载文件", "50px", "",
			"../../../comon/image/toolbar/doc/download_g.gif");
	browseDoc_item = currentgrid.insertSelfBar("查看文件", "30px", "",
			"../../../comon/image/doc/browse_g.gif");
	docDownloadRecord_item = currentgrid.insertSelfBar("下载记录", "30px", "",
			"../../../comon/image/doc/download_record_g.gif");
	docHistory_item = currentgrid.insertSelfBar("历史版本", "30px", "",
			"../../../comon/image/doc/modify_record_g.gif");
}

function createUploadElement() {
	if (!uploader) {
		uploader = layui.upload.render({
			elem : '#' + doc_upload_item,
			url : cpath + '/utils/layuiFileUploadAction',
			accept : 'file',
			multiple : true,
			dataType : 'json',
			data : {
				docPath : currenttreeSDOCPATHName
			},
			before: function (obj) {
                layui.layer.load();
            },
			done : function(res) {
				layui.layer.closeAll('loading');
				if (res.code != '-1') {
					currentgrid.refreshData();
				} else {
					alert(res.msg);
				}
			},
			error : function() {
				layui.layer.closeAll('loading');
				alert("上传失败！");
			}
		});
	} else {
		uploader.config.data = {
			docPath : currenttreeSDOCPATHName
		};
	}
}

function refreshFile() {
	currentgrid.refreshData();
}

function doc_dowload() {
	var rowid = currentgrid.CurrentRowId;
	var SFILEID = currentgrid.getValueByName("SFILEID", rowid);
	var docPath = currentgrid.getValueByName("SDOCPATH", rowid);
	if (!SFILEID || SFILEID == "")
		return;
	tlv8.Doc.downloadDocByFileID(docPath, SFILEID);
}

function newFolderData() {
	tlv8.portal.dailog.openDailog('新建目录', "dialog/create-folder.html?sparent="
			+ currenttreeID + "&name=" + currenttreeName + "&pdocpath="
			+ currenttreeSDOCPATH + "&pdocpathname=" + currenttreeSDOCPATHName,
			350, 300, dailogcallback, null);
}
function editOrgData() {
	tlv8.portal.dailog.openDailog('编辑目录', "dialog/create-folder.html?rowid="
			+ currenttreeID + "&name=" + currenttreeName + "&pdocpath="
			+ currenttreeSDOCPATH + "&pdocpathname=" + currenttreeSDOCPATHName,
			350, 300, seaTreeItem, null);
}
function editPermision() {
	tlv8.portal.dailog.openDailog('分配权限', "dialog/doc-permision.html?rowid="
			+ currenttreeID + "&DOCPATH=" + currenttreeSDOCPATH, 750, 500,
			null, null);
}
var backData;
function dailogcallback(data) {
	// alert("回调");
	backData = data;
	setTimeout('seaTreeItem()', 500);
}

function seaTreeItem(data) {
	data = data ? data : backData;
	maingrid.grid.refreshData("1=2");
	Jtree.refreshJtree("maintree");
}

function afGridrefresh(r) {
	//console.log(r);
}

var currenttreeNode = null;
var currenttreeID = null;
var currenttreeName = null;
var currenttreeSDOCPATH = null;
var currenttreeSDOCPATHName = null;
// 选中树
function treeselected(event, treeId, node, clickFlag) {
	var treeID = node.id;
	currenttreeNode = node;
	J$("main_org_trr").rowid = treeID;
	maingrid.grid.refreshData();
	currenttreeID = treeID;
	currenttreeName = node.name;
	currenttreeSDOCPATH = node.SDOCPATH;
	currenttreeSDOCPATHName = node.SDOCDISPLAYPATH;
	var r_data = getFileAuth(currenttreeSDOCPATH);
	if (treeID == "defaultDocNameSpace"
			|| tlv8.Context.getCurrentPersonID() == "PSN01") {
		J$("new_folder_item").src = "../../../comon/image/doc/newfolder.gif";
		J$("new_folder_item").onclick = newFolderData;// 新建目录
	} else {
		if ((!r_data || r_data < 16384)
				&& node.SCREATORFID != tlv8.Context.getCurrentPersonID()) {
			J$("new_folder_item").src = "../../../comon/image/doc/newfolder_g.gif";
			J$("new_folder_item").onclick = null;
		} else {
			J$("new_folder_item").src = "../../../comon/image/doc/newfolder.gif";
			J$("new_folder_item").onclick = newFolderData;// 新建目录
		}
	}
	if (treeID != "defaultDocNameSpace"
			&& currenttreeName != "Message"
			&& (node.SCREATORFID == tlv8.Context.getCurrentPersonID() || tlv8.Context
					.getCurrentPersonID() == "PSN01")) {
		J$("folder_pro_item").src = "../../../comon/image/doc/folder_pro.gif";
		J$("folder_pro_item").onclick = editOrgData;// 修改目录

		J$("folder_perm_item").src = "../../../comon/image/doc/folder_perm.gif";
		J$("folder_perm_item").onclick = editPermision;// 修改权限

		J$("deletefile_item").src = "../../../comon/image/doc/deletefile.gif";
		J$("deletefile_item").onclick = function() {
			data.setTable("SA_DOCNODE");
			data.setDbkey("system");
			data.setFormId("main_org_trr");
			data.setRowId(currenttreeID);
			data.deleteData();
			Jtree.refreshJtree("maintree");
		};// 删除目录
	} else if ((treeID == "defaultDocNameSpace" || currenttreeName == "Message")
			&& tlv8.Context.getCurrentPersonID() == "PSN01") {
		J$("folder_pro_item").src = "../../../comon/image/doc/folder_pro_g.gif";
		J$("folder_pro_item").onclick = null;// 修改目录

		J$("folder_perm_item").src = "../../../comon/image/doc/folder_perm.gif";
		J$("folder_perm_item").onclick = editPermision;// 修改权限

		J$("deletefile_item").src = "../../../comon/image/doc/deletefile_g.gif";
		J$("deletefile_item").onclick = null;
	} else {
		J$("folder_pro_item").src = "../../../comon/image/doc/folder_pro_g.gif";
		J$("folder_pro_item").onclick = null;

		if (!r_data || r_data < 16384) {
			J$("folder_perm_item").src = "../../../comon/image/doc/folder_perm_g.gif";
			J$("folder_perm_item").onclick = null;
		} else {
			J$("folder_perm_item").src = "../../../comon/image/doc/folder_perm.gif";
			J$("folder_perm_item").onclick = editPermision;// 修改权限
		}

		J$("deletefile_item").src = "../../../comon/image/doc/deletefile_g.gif";
		J$("deletefile_item").onclick = null;
	}
	if ((tlv8.Context.getCurrentPersonID() != "PSN01")
			&& (!r_data || r_data < 257)
			&& (node.SCREATORFID != tlv8.Context.getCurrentPersonID())) {
		can_upload_m(false);// 上传文件按钮 (无权限)
	} else {
		can_upload_m(true);// 上传文件按钮 (有权限)
	}
	can_browseDoc_m(true);
	setTimeout(can_downloadload_d, 300);
	if (!docAuthList) {
		getDocAuthList();
	}
}

/*
 * 下载按钮控制
 */
function can_downloadload_d() {
	var rowid_t = currentgrid.CurrentRowId;
	var SFILEID_t = currentgrid.getValueByName("SFILEID", rowid_t);
	if (!SFILEID_t || SFILEID_t == "")
		can_downloadload_m(false);
}
/*
 * 编辑按钮控制 @param {Object} flag
 */
function can_editer_m(flag) {
	if (flag) {
		J$(editer_item + "_img").src = "../../../comon/image/doc/edit_file.gif";
		J$(editer_item).onclick = function() {
			officeHandler("OpenOffice");
		};
	} else {
		J$(editer_item + "_img").src = "../../../comon/image/doc/edit_file_g.gif";
		J$(editer_item).onclick = null;
	}
}

/*
 * 下载记录 @param {Object} flag
 */
function can_docDownloadRecord_m(flag) {
	if (flag) {
		J$(docDownloadRecord_item + "_img").src = "../../../comon/image/doc/download_record.gif";
		J$(docDownloadRecord_item).onclick = function() {
			var docID = currentgrid.getCurrentRowId();
			tlv8.Doc.openDocDownloadHistoryDialog(docID);
		};
	} else {
		J$(docDownloadRecord_item + "_img").src = "../../../comon/image/doc/download_record_g.gif";
		J$(docDownloadRecord_item).onclick = null;
	}
}
/*
 * 版本历史 @param {Object} flag
 */
function can_docHistory_m(flag) {
	if (flag) {
		J$(docHistory_item + "_img").src = "../../../comon/image/doc/modify_record.gif";
		J$(docHistory_item).onclick = function() {
			var docID = currentgrid.getCurrentRowId();
			var fileID = currentgrid.getValueByName("SFILEID", docID);
			var docPath = currentgrid.getValueByName("SDOCPATH", docID);
			var access = getAccessBysDocPath(docPath, currentRootAccess);
			tlv8.Doc.openDocHistoryDialog(docID, fileID, docPath, access,
					NotifyPrintEvent());
		};
	} else {
		J$(docHistory_item + "_img").src = "../../../comon/image/doc/modify_record_g.gif";
		J$(docHistory_item).onclick = null;
	}
}

/*
 * 上传按钮控制 @param {Object} flag
 */
function can_upload_m(flag) {
	if (flag) {
		J$(doc_upload_item).src = "../../../comon/image/toolbar/doc/newfile.gif";
		createUploadElement();
	} else {
		J$(doc_upload_item).src = "../../../comon/image/toolbar/doc/newfile_g.gif";
	}
}

/*
 * 下载按钮控制 @param {Object} flag
 */
function can_downloadload_m(flag) {
	if (flag) {
		J$(doc_dowload_item + "_img").src = "../../../comon/image/toolbar/doc/download.gif";
		J$(doc_dowload_item).onclick = doc_dowload;
	} else {
		J$(doc_dowload_item + "_img").src = "../../../comon/image/toolbar/doc/download_g.gif";
		J$(doc_dowload_item).onclick = null;
	}
}

/*
 * 查看文件 @param {Object} flag @return {TypeName}
 */
function can_browseDoc_m(flag) {
	if (flag) {
		J$(browseDoc_item + "_img").src = "../../../comon/image/doc/browse.gif";
		J$(browseDoc_item).onclick = function() {
			var rowId = currentgrid.getCurrentRowId();
			var docPath = currentgrid.getValueByName("SDOCPATH", rowId);
			var access = getAccessBysDocPath(docPath, currentRootAccess);
			if (!((access % 4) >= 2)) {
				// return;
			}

			var filename = currentgrid.getValueByName("SDOCNAME", rowId);
			var fileID = currentgrid.getValueByName("SFILEID", rowId);
			tlv8.Doc.browseDocByFileID(docPath, filename, fileID, "last",
					"content", 'OpenOffice', NotifyPrintEvent());
		};
	} else {
		J$(browseDoc_item + "_img").src = "../../../comon/image/doc/browse_g.gif.gif";
		J$(browseDoc_item).onclick = null;
	}
}

// 选中文件
function select_file(event) {
	var docpath = event.getValueByName("SDOCPATH", event.getCurrentRowId());
	var fileID = event.getValueByName("SFILEID", event.getCurrentRowId());
	var SCREATORFID = event.getValueByName("SCREATORFID", event
			.getCurrentRowId());
	var r_data = getFileAuth(docpath.replace(fileID, ""));

	if (r_data < 7 && SCREATORFID != tlv8.Context.getCurrentPersonFID()) {
		can_downloadload_m(false);
		can_docDownloadRecord_m(false);
		can_docHistory_m(false);
		can_editer_m(false);
		maingrid.grid.settoolbar(false, false, true, "readonly");
	} else {
		// 控制权限
		can_downloadload_m(true);
		can_docDownloadRecord_m(true);
		can_docHistory_m(true);
		if (r_data > 1543 || SCREATORFID == tlv8.Context.getCurrentPersonFID()) {
			maingrid.grid.settoolbar(false, false, true, true);
			can_editer_m(true);
		} else {
			maingrid.grid.settoolbar(false, false, true, "readonly");
			can_editer_m(false);
		}
	}
}

/*
 * grid行双击事件 @param {Object} event
 */
function griddbclickFN(event) {
	var docID = event.getCurrentRowId();
	var afterEnsureFun = function(event) {
		tlv8.Doc.syncCustomFileds(currentgrid.getCurrentRowId());
	};
	tlv8.Doc.openDocInfoDialog(docID, afterEnsureFun);
}

// 获取权限标识
function getFileAuth(DOCPATH) {

}

function transB2KB(aa) {
	if (aa == '') {
		return;
	}
	var tempValue = aa;
	var resultValue = "";
	var tempValueStr = new String(tempValue);
	if ((tempValueStr.indexOf('E') != -1) || (tempValueStr.indexOf('e') != -1)) {
		var regExp = new RegExp('^((\\d+.?\\d+)[Ee]{1}(\\d+))$', 'ig');
		var result = regExp.exec(tempValue);
		var power = "";
		if (result != null) {
			resultValue = result[2];
			power = result[3];
			result = regExp.exec(tempValueStr);
		}
		if (resultValue != "") {
			if (power != "") {
				var powVer = Math.pow(10, power);
				resultValue = resultValue * powVer / 1000;
			}
		}
		return parseInt(resultValue) + 1;
	} else {
		if (tempValue == 0)
			return parseInt(tempValue) + '';
		return parseInt(tempValue / 1000) + 1;
	}
}

function NotifyPrintEvent() {
	var result = _office_isPrint;
	return result;
}

function officeHandler(type) {
	var rowid = currentgrid.getCurrentRowId();
	var docFullPath = currentgrid.getValueByName("SDOCPATH", rowid);
	var filename = currentgrid.getValueByName("SDOCNAME", rowid);
	var fileid = currentgrid.getValueByName("SFILEID", rowid);
	tlv8.trangereditfile(fileid, filename, docFullPath);
}

function getAccessBysDocPath(docFullPath, defaultAccess) {
	var docAccess = null;
	for ( var item in docAuthListArr) {
		var itemAceess = defaultAccess;
		$.each(docAuthListArr[item], function(n, value) {
			if (value.sDocPath == docFullPath) {
				itemAceess = value.sAccess;
				return false;
			}
		});
		if (!docAccess)
			docAccess = itemAceess;
		if (itemAceess > docAccess)
			docAccess = itemAceess;
	}
	return (docAccess != null && docAccess) > defaultAccess ? docAccess
			: defaultAccess;
}

function getDocAuthList() {
	docAuthList = [];
}