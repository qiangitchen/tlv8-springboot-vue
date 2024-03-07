/*
 * file from "UI\system\service\doc\office\config.js"
 */

/*officeViewerDialog.w使用的临时配置文件，将来要在数据库中实现
 _seal_doc_node_sid 为签章图片在知识中心所在目录的sid*/
var _seal_doc_node_sid = "";
/* _seal_doc_node_sid 是否在附件的word编辑框中显示“插入签章”动作 */
var _seal_default_show = false;
/* _word_revision_init 编辑时是否显示文档的修订记录 */
var _word_all_history = true;
/* _office_isPrint 打开office文档时，打印按钮是否可用 */
var _office_isPrint = false;
/* _read_file_type读取文件，默认打开的格式 */
var _read_file_type = ".doc,.docx,.xls,.xlsx,.ppt,.pptx,.mpp,.vsd,.txt,.text,.jsp,.java,.html ,.htm,.xml,.css,.rtf,.wml,.jpg,.jpeg,.jpe,.png,.gif,.tiff,.tif,.svg,.svgz,.svg,.pdf,.wrl,.smil,.js,.vbs,.rdf";
/* 是否显示菜单 */
var _show_menubar = true;
/* cab文件的动态版本 */
var _ocx_version = "5,2,1,2000";

/*
 * file from "UI\system\service\doc\common\base64.js"
 */

/**
 * 
 * Base64 encode / decode http://www.webtoolkit.info/
 * 
 */

var Base64 = {

	// private property
	_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

	// public method for encoding
	encode : function(input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;

		input = Base64._utf8_encode(input);

		while (i < input.length) {

			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);

			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;

			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}

			output = output + this._keyStr.charAt(enc1)
					+ this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3)
					+ this._keyStr.charAt(enc4);

		}

		return output;
	},

	// public method for decoding
	decode : function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;

		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

		while (i < input.length) {

			enc1 = this._keyStr.indexOf(input.charAt(i++));
			enc2 = this._keyStr.indexOf(input.charAt(i++));
			enc3 = this._keyStr.indexOf(input.charAt(i++));
			enc4 = this._keyStr.indexOf(input.charAt(i++));

			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;

			output = output + String.fromCharCode(chr1);

			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}

		}

		output = Base64._utf8_decode(output);

		return output;

	},

	// private method for UTF-8 encoding
	_utf8_encode : function(string) {
		string = string.replace(/\r\n/g, "\n");
		var utftext = "";

		for (var n = 0; n < string.length; n++) {

			var c = string.charCodeAt(n);

			if (c < 128) {
				utftext += String.fromCharCode(c);
			} else if ((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			} else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}

		}

		return utftext;
	},

	// private method for UTF-8 decoding
	_utf8_decode : function(utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;

		while (i < utftext.length) {

			c = utftext.charCodeAt(i);

			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			} else if ((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i + 1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			} else {
				c2 = utftext.charCodeAt(i + 1);
				c3 = utftext.charCodeAt(i + 2);
				string += String.fromCharCode(((c & 15) << 12)
						| ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}

		}

		return string;
	}

};

/*
 * file from "UI\system\service\doc\office\officeViewer.js"
 */
tlv8.Doc = {
	/*
	 * 附件权限枚举值 列表(list) : l ; 读取(read) : r ; 下载(download) : d ; 下载上传 (download
	 * upload) : du ; 下载上传修改(download upload update) : duu ; 下载上传修改删除(download
	 * upload update delete) : duud
	 */
	accessEnum : {
		l : 1,
		r : 3,
		d : 7,
		du : 263,
		duu : 775,
		duud : 1799
	},
	isHttps : function() {
		return window.location.protocol == "https:";
	},
	getdocServerAction : function(docPath, urlPattern, isFormAction) {
		if (!isFormAction)
			isFormAction = false;
		var sendParam = new tlv8.RequestParam();
		sendParam.set("isHttps", this.isHttps());
		sendParam.set('docPath', docPath);
		sendParam.set('urlPattern', urlPattern);
		sendParam.set('isFormAction', isFormAction);
		var res = null;
		var r = tlv8.XMLHttpRequest("queryHostAction", sendParam, "POST", false, null).data;
		if(typeof r == "string"){
			r = window.eval("("+r+")");
		}
		if (r.flag == "false") {
			alert("tlv8.Doc.getdocServerAction失败,请确认文档服务配置是否正确！"
					+ r.message);
			throw new Error("tlv8.Doc.getdocServerAction失败,请确认文档服务配置是否正确！"
					+ r.message);
		} else {
			res = r.data;
		}
		var docUrl = res || "#";
		if (docUrl == '#') {
			alert('您没有相应操作的权限');
			throw new Error('您没有相应操作的权限');
		}
		return docUrl + "&" + this.getBSessionIDParam();
	},
	getBSessionIDParam : function() {
		try {
			return "bsessionid=" + new Date().getTime();
		} catch (e) {
			return "";
		}
	},
	getCookie : function(cookieName) {
		var data = this.getShareData();
		if (!data)
			return "";
		return data["__docShareData__" + cookieName];
	},
	getShareData : function() {
		var currentWindow = window;
		var parentWindow = currentWindow.parent;
		while (parentWindow && currentWindow != parentWindow) {
			currentWindow = parentWindow;
			parentWindow = window.parent;
		}
		if (!parentWindow)
			return this.__docShareData;
		if (parentWindow.__docShareData)
			return parentWindow.__docShareData;
		parentWindow.__docShareData = {};
		return parentWindow.__docShareData;
	},
	setCookie : function(cookieName, value) {
		var data = this.getShareData();
		if (!data)
			return;
		data["__docShareData__" + cookieName] = value;
	},
	getAuthList : function(person, personId) {
		if (typeof person == "undefined") {
			person = tlv8.Context.getCurrentPersonFID();
		}
		if (typeof personId == "undefined") {
			personId = tlv8.Context.getCurrentPersonCode();
		}
		var deptPath = tlv8.Context.getCurrentPersonFID();
		var personId = tlv8.Context.getCurrentPersonCode();

		var sendParam = new tlv8.RequestParam();
		sendParam.set('deptPath', deptPath);
		sendParam.set('personId', personId);
		response = tlv8.XMLHttpRequest("queryPermissionAction", sendParam,
				"POST", false, null);
		if (response.data.flag == "true") {
			return response.data.data;
		} else {
			alert("tlv8.Doc.getAuthList失败！");
		}
	},
	queryNameSpaces : function() {
		var param = this.createParam("queryNameSpace", [], []);
		var sendParam = new tlv8.RequestParam();
		sendParam.set('param', param);

		var resQN = tlv8.XMLHttpRequest("dispatchOptAction", sendParam,
				"POST", false, null);
		if (resQN.data.flag == "false") {
			alert("tlv8.Doc.queryNameSpaces失败！");
		}
		var nameSpaces = resQN.data.data;
		if (typeof (nameSpaces) == "string") {
			nameSpaces = eval("(" + nameSpaces + ")");
		}
		var oNameSpaces = {};
		for (var i = 0; i < nameSpaces.length; i++) {
			var nameSpace = nameSpaces[i];
			var rootID = nameSpace.DOCNODE;
			var url = nameSpace.SURL;
			oNameSpaces[rootID] = {
				url : url
			};
		}
		return oNameSpaces;
	},
	getDocServerByDocPath : function(fullPath) {
		if (!fullPath) {
			alert("tlv8.Doc.getDocServerByDocPath Error : 文档信息全路径不正确");
			return;
		}
		fullPath = fullPath.substring(1);
		var rootID = fullPath.indexOf("/") == -1 ? fullPath : fullPath
				.substring(0, fullPath.indexOf("/"));
		var sNameSpaces = this.getCookie("docNameSpaces");
		if (sNameSpaces) {
			var oNameSpaces = JSON.parse(sNameSpaces);
		} else {
			var oNameSpaces = this.queryNameSpaces();
		}
		return oNameSpaces[rootID];
	},
	queryDefine : function(process, activity, keyId) {
		var linkAll;
		if (this.attmentLinkDefines) {
			linkAll = this.attmentLinkDefines;
		} else {
			var param = new tlv8.RequestParam();
			param.set('linkProcess', process);
			param.set('linkActivity', activity);
			var response = tlv8.XMLHttpRequest("queryLinkDefineMap",
					param, "POST", false, null);
			if (response.data.flag == "false") {
				alert("tlv8.Doc.queryDefine失败！");
			}
			linkAll = response.data.data;
			this.attmentLinkDefines = linkAll;
		}
		var define = linkAll;
		if (keyId && !!linkAll.keys[keyId]) {
			define = linkAll.keys[keyId];
		}
		return define;
	},
	/**
	 * @description: 查询当前应显示的目录
	 * @param: billID - 业务ID
	 * @param: process - 过程名
	 * @param: activity - 活动名
	 * @param: rootPath - 文档关联定义根目录
	 * @param: subPath - 文档关联定义子目录
	 * @return: loader - 结构是tree的目录信息
	 */

	queryLinkedDir : function(billID, process, activity, rootPath, subPath) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set("rootPath", rootPath);
		sendParam.set("subPath", subPath);
		sendParam.set("billID", billID);
		sendParam.set("process", process);
		sendParam.set("activity", activity);
		sendParam.set("isTree", true);
		var response = tlv8.XMLHttpRequest("queryLinkDirAction",
				sendParam, "POST", false, null);
		if (response.data.flag == "true") {
			return response.data.data;
		} else {
			alert("tlv8.Doc.queryLinkedDir失败！");
		}
	},

	/**
	 * @description: 查询当前应显示的文件
	 * @param: billID - 业务ID
	 * @param: process - 过程名
	 * @param: activity - 活动名
	 * @param: pattern - 返回结果列表的字段名数组
	 * @param: orderBy - 排序字段名
	 * @return: loader - 结构是list的文件信息
	 */

	queryLinkedDoc : function(billID, rootPath, subPath) {
		var param = this.createParam("queryLinkedDoc", [ "bill-id", "rootPath",
				"subPath" ], [ billID, rootPath, subPath ]);
		var sendParam = new tlv8.RequestParam();
		sendParam.set('param', param);
		var response = tlv8.XMLHttpRequest("dispatchOptAction", sendParam,
				"POST", false, null);
		if (response.data.flag == "true") {
			return response.data.data;
		} else {
			alert("tlv8.Doc.queryLinkedDoc失败！");
		}
	},
	/**
	 * @description: 获取文档信息
	 * @param: docID - 文档ID
	 * @param: docPath - 文档docPath
	 * @param: pattern - 返回结果列表的字段名数组
	 * @param: orderBy - 排序字段名
	 * @return: loader - 结构是list的文件信息
	 */
	queryDoc : function(docID, docPath, pattern, orderBy, custom, single) {
		if (typeof docID == "undefined") {
			docID = "";
		}
		if (typeof docPath == "undefined") {
			docPath = "";
		}
		if (typeof pattern == "undefined") {
			pattern = "";
		}
		if (typeof orderBy == "undefined") {
			orderby = "";
		}
		if (typeof custom == "undefined") {
			custom = "";
		}
		if (pattern != "") {
			pattern = pattern.join(",");
		}

		var sendParam = new tlv8.RequestParam();
		sendParam.set('docID', docID);
		sendParam.set('docPath', docPath);
		sendParam.set('pattern', pattern);
		sendParam.set('orderBy', orderBy);
		sendParam.set('custom', custom);

		var response = tlv8.XMLHttpRequest("queryDocAction", sendParam,
				"POST", false, null);
		if (response.data.flag == "false") {
			throw new Error("tlv8.Doc.queryDoc失败！");
		}
		var rows = eval("(" + response.data.data + ")");
		/* 返回单行数据 */
		if (single == "single") {
			if (rows.length != 1) {
				alert("tlv8.Doc.queryDoc失败！");
			}
			return rows[0];
		}
		/* 返回多行数据 */
		return rows;
	},
	trim : function(value) {
		return value || "";
	},
	addCreateVersionLog : function(changeLog, attachmentValue, billID) {
		var item = {};
		item.billID = billID;
		item.attachmentValue = attachmentValue;
		changeLog.createVersionLogs.push(item);
	},
	addChangeLog : function(changeLog, operate, values, filePorps, billID) {
		var item = {};
		item.operation_type = operate;
		/* 当前环境信息 */
		item.process = cpath+"/system/file";
		item.activity = "doc-center";
		item.person = tlv8.Context.getCurrentPersonFID();
		item.person_name = tlv8.Context.getCurrentPersonName();
		item.dept_name = tlv8.Context.getCurrentDeptName() ? tlv8.Context
				.getCurrentDeptName()
				: "";
		item.bill_id = this.trim(billID);

		/* 文档属性 */
		item.doc_id = this.trim(values[0]);
		item.version = this.trim(values[1] + "");
		item.file_id = this.trim(values[2]);
		item.doc_version_id = this.trim(values[3]);
		item.doc_name = this.trim(values[4]);
		item.kind = this.trim(values[5]);
		item.size = this.trim(values[6]);
		item.parent_id = this.trim(values[7]);
		item.doc_path = this.trim(values[8]);
		item.doc_display_path = this.trim(values[9]);
		item.description = this.trim(values[10]);
		item.classification = this.trim(values[11]);
		item.keywords = this.trim(values[12]);
		item.finish_time = this.trim(values[13]);
		item.serial_number = this.trim(values[14]);
		/* 文档服务器文件属性 */
		if (typeof filePorps != "undefined") {
			item.doc_type = this.trim(filePorps[0]);
			item.cache_name = this.trim(filePorps[1]);
			item.revision_cache_name = this.trim(filePorps[2]);
			item.comment_file_content = this.trim(filePorps[3]);
		} else {
			item.doc_type = "";
			item.cache_name = "";
			item.revision_cache_name = "";
			item.comment_file_content = "";
		}

		/* 存储时需要的辅助信息 */
		if (("new" == operate) || ("link" == operate) || ("newDir" == operate)) {
			item.link_id = new UUID().toString();
		} else
			item.link_id = "";
		item.access_record_id = new UUID().toString();

		changeLog.items.push(item);
	},
	updateChangeLog : function(changeLog, docId, fileId, docVersionId) {
		var items = changeLog.items;
		for (var i = 0; i < items.length; i++) {
			var item = items[i];
			if (item.doc_id == docId) {
				item.file_id = fileId;
				item.doc_version_id = docVersionId;
				return;
			}
		}
	},
	removeChangeLog : function(changeLog, docID) {
		var items = changeLog.items;
		for ( var item in items) {
			var item = items[item];
			if (item.doc_id == docID) {
				changeLog.items.pop(item);
			}
		}
	},
	modifyChangeLog : function(item, values, filePorps) {
		item.version = values[0];
		item.file_id = values[1];
		item.doc_version_id = values[2] == null ? "" : values[2];
		item.doc_name = values[3];
		item.kind = values[4];

		item.size = values[5];
		item.parent_id = values[6];
		item.doc_path = values[7];
		item.doc_display_path = values[8];
		item.description = values[9] == null ? "" : values[9];

		item.classification = values[10] == null ? "" : values[10];
		item.keywords = values[11] == null ? "" : values[11];
		item.finish_time = values[12] == null ? "" : values[12];
		item.serial_number = values[13] == null ? "" : values[13];
		if (item.operation_type == "editInfo" && values[14]) {
			item.operation_type = values[14];
		}
		/* 文档服务器文件属性 */
		if (typeof filePorps != "undefined") {
			item.doc_type = filePorps[0];
			item.cache_name = filePorps[1];
			item.revision_cache_name = filePorps[2];
			item.comment_file_content = filePorps[3];
		} else {
			item.doc_type = "";
			item.cache_name = "";
			item.revision_cache_name = "";
			item.comment_file_content = "";
		}
	},
	evalChangeLog : function(changeLog, docId) {
		var items = changeLog.items;
		for ( var item in items) {
			if (items[item].doc_id == docId)
				return items[item];
		}
		return null;
	},
	addAccessRecord : function(changeLog) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('param', JSON.stringify(changeLog));
		response = tlv8.XMLHttpRequest("addAccessRecordAction", sendParam,
				"POST", false, null);
		if (response.data.flag == "false") {
			alert("tlv8.Doc.addAccessRecord失败！");
		}
	},
	createElement : function(changeLog, name, value) {
		var element = changeLog.createElement(name);
		if (value != null && value !== "") {
			justep.XML.setNodeText(element, '.', value);
		}
		return element;
	},
	createVersion : function(sDocID, isSaveDocLink) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('sdocID', sDocID);
		sendParam.set("isSaveDocLink", isSaveDocLink ? isSaveDocLink : false);
		sendParam.set("isHttps", this.isHttps());
		var response = tlv8.XMLHttpRequest("createVersionAction",
				sendParam, "POST", false, null);
		if (response.data.flag == "true") {
			var createSucess = response.data.data;
			return createSucess;
		} else {
			alert("tlv8.Doc.createVersion失败！");
		}
	},
	deleteVersion : function(docPath, fileID, LogID, docVersion) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('sDocPath', docPath);
		sendParam.set('sFileID', fileID);
		sendParam.set('sLogID', LogID);
		sendParam.set('sDocVersion', docVersion);
		sendParam.set("isHttps", this.isHttps());
		var response = tlv8.XMLHttpRequest("deleteVersionAction",
				sendParam, "POST", false, null);
		if (response.data.flag == "false") {
			alert("tlv8.Doc.deleteVersion失败！");
		}
	},
	createVersionFromJsonStr : function(billID, jsonStr) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('billID', billID);
		sendParam.set('jsonStr', jsonStr);
		sendParam.set("isHttps", this.isHttps());
		sendParam.set("process", "");
		sendParam.set("activity", "");
		var response = tlv8.XMLHttpRequest(
				"createVersionFromJsonStrAction", sendParam, "POST", false,
				null);
		if (response.data.flag == "true") {
			return true;
		} else {
			alert("tlv8.Doc.createVersionFromJsonStr失败！");
		}
	},
	lockDoc : function(sDocID) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('isLockDoc', true);
		sendParam.set('sdocID', sDocID);
		var response = tlv8.XMLHttpRequest("changeDocStateAction",
				sendParam, "POST", false, null);
		if (response.data.flag == "true") {
			var affactRow = response.data.data;
			if (affactRow && affactRow == '0') {
				alert('文件已经被别人锁定,您不能再锁定');
				return false;
			}
			return true;
		} else {
			alert("tlv8.Doc.lockDoc失败！");
		}
	},
	unLockDoc : function(sDocID) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('isLockDoc', false);
		sendParam.set('sDocID', sDocID);
		var response = tlv8.XMLHttpRequest("changeDocStateAction",
				sendParam, "POST", false, null);
		if (response.data.flag == "true") {
			var affactRow = response.data.data;
			if (affactRow && affactRow == '0') {
				alert('文档锁定人不是您或者着文档没有锁定，您不能解锁');
				return false;
			}
			return true;
		} else {
			alert("tlv8.Doc.unLockDoc失败！");
		}
	},
	/**
	 * @description: 下载文档
	 * @param: docID - 文档ID
	 * @param: host - 文档服务器地址ID
	 */
	downloadDoc : function(docPath, docID) {
		var row = this.queryDoc(docID, undefined, [ "sFileID" ], undefined,
				undefined, "single");
		var fileID = row.SFILEID;
		this.downloadDocByFileID(docPath, fileID);
	},

	downloadDocByFileID : function(docPath, fileID, versionID, partType) {
		window.open(this.getURLByFileID(docPath, fileID, versionID, partType),
				'_top');
	},
	addDownloadHistory : function (docPath,fileID){
		var param = new tlv8.RequestParam();
		param.set("docPath", docPath);
		param.set("fileID", fileID);
		tlv8.XMLHttpRequest("addDocDownloadLogAction", param, "post", true, null, true);
	},
	getURL : function(docPath, docID) {
		var row = this.queryDoc(docID, undefined, [ "sFileID" ], undefined,
				undefined, "single");
		var fileID = row.SFILEID;
		return this.getURLByFileID(docPath, fileID);
	},
	getURLByFileID : function(docPath, fileID, versionID, partType) {
		var versionID = versionID ? versionID : "last";
		var partType = partType ? partType : "content";
		var durl = this.getdocServerAction(docPath,
				"/repository/file/download/" + fileID + "/" + versionID + "/"
						+ partType);
		if (durl.indexOf("?") > 0) {
			durl = durl.substring(0, durl.indexOf("?")) + "?key="
					+ new Date().getTime();
		}
		return durl;
	},
	browseFileComment : function(docPath, fileID, docVersionID) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set("isHttps", this.isHttps());
		sendParam.set('docPath', docPath);
		sendParam.set('fileID', fileID);
		sendParam.set('docVersionID', docVersionID);

		try {
			var res = tlv8.XMLHttpRequest("queryCommentFileContent",
					sendParam, "POST", false, null);
		} catch (e) {
			alert("tlv8.Doc.browseFileComment失败,查询修订内容失败！");
		}

		if (res.data.flag == "false") {
			alert("tlv8.Doc.browseFileComment失败,查询修订内容失败！");
		}
		var v = res.data.data;
		return v;
	},
	browseDocByID : function(fileID, docName) {
		this.browseDocByFileID("/root", docName, fileID, "last", "content");
	},

	browseDoc : function(docPath, docID) {
		var row = this.queryDoc(docID, undefined, [ "sDocName,sFileID" ],
				undefined, undefined, "single");
		var docName = row.SDOCNAME;
		var fileID = row.SFILEID;
		this.browseDocByFileID(docPath, docName, fileID);
	},
	browseDocByFileID : function(docPath, docName, fileID, versionID, partType) {
		var versionID = versionID ? versionID : "last";
		var partType = partType ? partType : "content";
		if (!fileID) {
			alert('文档不能浏览，数据未提交！');
			return;
		}
		if ('.doc.docx.xls.xlsx.ppt.pptx.mpp.vsd.dps.wps.et.'.indexOf(String(/\.[^\.]+$/.exec(docName)) + '.') >= 0) {
			window.open(cpath+"/doc_ocx/officeediter?fileID="
							+ fileID + "&fileName=" + J_u_encode(docName) + "&option=view");
		}else if(".pdf.".indexOf(String(/\.[^\.]+$/.exec(docName))+ '.') >= 0){
			window.open(cpath+"/comon/pdfViewer/vform.html?fileid="+fileID+"&filename="+docName);
		}else{
			if (".png.jpg.gif.bmp.".indexOf(String(/\.[^\.]+$/.exec(docName)) + '.') < 0) {
				alert("文件不支持在线查看，请下载查看！");
				this.downloadDocByFileID(docPath?docPath:"/root", fileID);
			}else{
				var url = this.getdocServerAction(docPath, "/repository/file/view/"
						+ fileID + "/" + versionID + "/" + partType);
				window.open(url);
			}
		}
	},
	/**
	 * @description: 构造请求参数
	 * @param: operation - 操作类型
	 * @param: nodes - 节点名数组与值对应
	 * @param: values - 节点值数组与名对应
	 * @return: param - 参数字符串
	 * 
	 */
	createParam : function(operate, nodes, values) {
		var items = [];
		items.push("<data>");
		items.push("<operate>");
		items.push(operate);
		items.push("</operate>");
		for (i = 0; i < nodes.length; i++) {
			items.push("<");
			items.push(nodes[i]);
			items.push(">");
			items.push(values[i]);
			items.push("</");
			items.push(nodes[i]);
			items.push(">");
		}
		items.push("</data>");
		return items.join("");
	},
	/**
	 * @description: 构造请求参数
	 * @param: pattern - 条件模板节点名数组
	 * @return: param - 条件模板
	 * 
	 */
	createQueryPattern : function(pattern) {
		var items = [];
		for (i = 0; i < pattern.length; i++) {
			items.push("<");
			items.push(pattern[i]);
			items.push("/>");
		}
		return items.join("");
	},
	transB2KB : function(v) {
		if (v.value == '') {
			return;
		}
		var tempValue = v.value;
		var resultValue = "";
		var tempValueStr = new String(tempValue);
		if ((tempValueStr.indexOf('E') != -1)
				|| (tempValueStr.indexOf('e') != -1)) {
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
			return parseInt(tempValue / 1000) + 1;
		}
	},
	formatSize : function(size) {
		var format = "";
		if (size == 0) {
			format = "0.0 KB";
		} else {
			if (size < 1048576) {
				format = (Math.ceil(size / 1024 * 10) / 10).toFixed(1) + " KB";
			} else {
				format = (Math.ceil(size / 1048576 * 10) / 10).toFixed(1)
						+ " MB";
			}
		}
		return format;
	},
	getDocFullPath : function(docID, docPath) {
		if (docPath == "/") {
			return docPath.concat(docID);
		} else {
			return docPath.concat("/").concat(docID);
		}
	},
	getDocFullDisplayPath : function(docName, docDisplayPath) {
		if (docDisplayPath == "/") {
			return docDisplayPath.concat(docName);
		} else {
			return docDisplayPath.concat("/").concat(docName);
		}
	},
	/**
	 * @description: 获取文档操作记录
	 * @param: docID - 文档ID
	 * @param: opaerationTypes - 是否包含此操作
	 * @return: resopnse - 操作记录dom
	 * 
	 */
	getAccessRecord : function(docID, hasDownload, hasNew, hasEdit) {
		if (typeof hasDownload == "undefined") {
			hasDownload = true;
		}
		if (typeof hasNew == "undefined") {
			hasNew = true;
		}
		if (typeof hasEdit == "undefined") {
			hasEdit = true;
		}
		var param = this
				.createParam("queryAccessRecord", [ "doc-id", "has-new",
						"has-download", "has-edit" ], [ docID,
						hasNew.toString(), hasDownload.toString(),
						hasEdit.toString() ]);
		var sendParam = new tlv8.RequestParam();
		sendParam.set('param', param);
		response = tlv8.XMLHttpRequest("dispatchOptAction", sendParam, "post", false);
		console.log(response);
		if (response.flag == "true") {
			var reder = eval("(" + response.data + ")");
			return reder;
		} else {
			alert("getAccessRecord Error :查询操作记录失败！");
		}
	},

	openOfficeDialog : function(docExtDivID, docExtObjID, OVP,
			afterOfficeViewerDialogSelect, caller) {
		tlv8.Doc.afterOfficeViewerDialogSelect = afterOfficeViewerDialogSelect;
		tlv8.Doc.caller = caller;
		if (!document.getElementById(docExtObjID)) {
			var docExtDiv = document.getElementById(docExtDivID);
			docExtDiv.outerHTML = '<object id="'
					+ docExtObjID
					+ '" classid="clsid:4771E057-4202-4F93-8F73-4C6654A9573D" style="width:100%"'
					+ 'codebase="'+cpath+'/comon/doc_ocx/office/office.cab#version='
					+ _ocx_version
					+ '"'
					+ ' style="display:none;" >'
					+ '</object><SCRIPT LANGUAGE=javascript FOR='
					+ docExtObjID
					+ ' EVENT=OnExcuteJS(id,param)> tlv8.Doc.execOfficeAction(id,param);</SCRIPT>';
		}
		var docOcx = document.getElementById(docExtObjID);
		OVP.filename = escape(OVP.filename);
		docOcx.OpenWebForm("/comon/doc_ocx/office/officeViewerDialog.html",
				unescape(OV.JSON.stringify(OVP)));
	},
	docInfoDialog : null,
	openDocInfoDialog : function(data, afterEnsureFun, caller) {
		tlv8.portal.dailog.openDailog("文件属性",
				"/comon/doc_ocx/dialog/docInfoDialog.html", 544, 500, function(
						event) {
					try {
						afterEnsureFun.call(caller, event);
					} catch (e) {
					}
				}, false, null, data);
	},
	dirInfoDialog : null,
	openDirInfoDialog : function(data, afterEnsureFun, caller) {
		tlv8.portal.dailog.openDailog("文件夹属性",
				"/comon/doc_ocx/dialog/dirInfoDialog.html", 440, 525, function(
						event) {
					try {
						afterEnsureFun.call(caller, event);
					} catch (e) {
					}
				}, false, null, data);
	},
	historyDialog : null,
	openDocHistoryDialog : function(docID, fileID, docPath, access, isPrint) {
		if (!docID && fileID) {
			var r = tlv8.sqlQueryAction("system",
					"select SID,SDOCPATH from sa_docnode where (sid='" + fileID
							+ "' or sfileid='" + fileID + "')");
			if (r.getCount() > 0) {
				docID = r.getValueByName("SID");
				docPath = r.getValueByName("SDOCPATH");
			} else {
				alert("docInfoDialog.js:参数错误!");
			}
		}
		this.historyDialog = {};
		this.historyDialog.data = {
			docID : docID,
			fileID : fileID,
			docPath : docPath,
			access : access,
			isPrint : isPrint
		};
		tlv8.portal.dailog.openDailog("历史版本",
				"/comon/doc_ocx/dialog/docHistoryDialog.html", 652, 485, null,
				false, null, this.historyDialog.data);
	},
	downloadHistoryDialog : null,
	openDocDownloadHistoryDialog : function(docID) {
		this.downloadHistoryDialog = {};
		this.downloadHistoryDialog.data = {
			docID : docID
		};
		tlv8.portal.dailog.openDailog("下载记录",
				"/comon/doc_ocx/dialog/docDownloadHistoryDialog.html", 644,
				445, null, false, null, this.downloadHistoryDialog.data);
	},
	templateDialog : null,
	openDocTemplateDialog : function(data, afterSelectFun, caller) {
		if (!this.templateDialog) {
			this.templateDialog = new justep.WindowDialog("templateDialog",
					"/system/service/doc/dialog/docTemplateDialog.w", "选择模板",
					true, null, 500, 400, 0, 0, false);
		}
		if (this.templateDialog.onSendId)
			this.templateDialog.detachEvent(this.templateDialog.onSendId);
		if (this.templateDialog.onReciveId)
			this.templateDialog.detachEvent(this.templateDialog.onReciveId);
		this.templateDialog.onSendId = this.templateDialog.attachEvent(
				"onSend", function(event) {
					return this.data;
				}, this.templateDialog);
		this.templateDialog.onReciveId = this.templateDialog.attachEvent(
				"onReceive", function(event) {
					afterSelectFun.call(caller, event);
				}, this.templateDialog);
		this.templateDialog.data = data;
		this.templateDialog.open();
	},
	queryDocCache : function(docID) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('docID', docID);

		var response = tlv8.XMLHttpRequest("queryDocCacheAction",
				sendParam, "POST", false, null);
		if(typeof response=='string'){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			alert("tlv8.Doc.queryDocCache失败！");
		}

		var fileinfo = response.data;
		return fileinfo;
	},
	queryDocByFileId : function(docPath, fileid, filename, version) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('isHttps', this.isHttps());
		sendParam.set('host', "/root" || docPath);
		sendParam.set('fileId', fileid);
		sendParam.set('docVersion', !version ? "last" : version);

		var response = tlv8.XMLHttpRequest("queryDocInfoByIdAction",
				sendParam, "POST", false, null);
		if(typeof response=='string'){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			alert("tlv8.Doc.queryDocInfoById失败！");
		}
		var fileinfo = response.data;
		if (typeof fileinfo == 'string') {
			fileinfo = eval('(' + fileinfo + ')');
		}
		if (fileinfo.queryFlag == "false") {
			alert('提示：'
					+ (!filename ? '此文件不存在，可能文档服务配置存在问题，请联系系统管理员！' : '“'
							+ filename + '”文件不存在，可能文档服务配置存在问题，请联系系统管理员！'));
		}
		return fileinfo;
	},
	syncCustomFileds : function(docID) {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('sdocID', docID);
		sendParam.set('isHttps', this.isHttps());

		var response = tlv8.XMLHttpRequest("syncCustomFiledsAction",
				sendParam, "POST", false, null);
		if(typeof response=='string'){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			throw new Error("tlv8.Doc.syncCustomFileds失败！");
		}

	},
	commitDocCache : function(docID, changeLog) {
		var node = tlv8.Doc.evalChangeLog(changeLog, docID);

		var sendParam = new tlv8.RequestParam();
		sendParam.set('changeLog', JSON.stringify(node));

		var response = tlv8.XMLHttpRequest("commitDocCacheAction",
				sendParam, "POST", false, null);
		if(typeof response=='string'){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			throw new Error("commitError: 数据保存失败！");
		}
	},
	saveDoc : function(changeLog, isSaveDocLink) {
		changeLog.operate = "saveDoc";

		var sendParam = new tlv8.RequestParam();
		sendParam.set('changeLog', JSON.stringify(changeLog));
		sendParam.set("isSaveDocLink", isSaveDocLink ? isSaveDocLink : false);

		var response = tlv8.XMLHttpRequest("saveAttachAction", sendParam,
				"POST", false, null);
		if(typeof response =="string"){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			alert("saveDocError: 数据保存失败！");
		}
		return response.data;
	},
	deleteDocAction : function(changeLog) {
		changeLog.isHttps = this.isHttps();
		changeLog.operate = "deleteDocAction";
		var sendParam = new tlv8.RequestParam();
		sendParam.set('changeLog', JSON.stringify(changeLog));
		var response = tlv8.XMLHttpRequest("deleteDocAction", sendParam,
				"POST", false, null);
		if(typeof response =="string"){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			alert("commitError: 数据提交失败！");
		}
	},
	getDocAuthList : function() {
		var sendParam = new tlv8.RequestParam();
		sendParam.set('deptPath', tlv8.Context.getCurrentPersonFID());
		sendParam.set('personId', tlv8.Context.getCurrentPersonCode());

		var response = tlv8.XMLHttpRequest("queryPermissionAction",
				sendParam, "POST", false, null);
		if(typeof response =="string"){
			response = window.eval("("+response+")");
		}
		if (response.flag == "false") {
			alert("getDocAuthListError: 获取文档权限列表失败！");
		}
		var reder = response.data;
		if(typeof reder =="string"){
			reder = eval("(" + reder + ")");
		}
		return reder;
	}
};