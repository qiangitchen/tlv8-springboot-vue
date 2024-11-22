var maingrid = null;
var currentgrid = null;
// 角色列表
function getData() {
	var data = new tlv8.Data();
	data.setTable("SA_OPROLE");
	data.setDbkey("system");
	data.setOrderby("SSEQUENCE asc");
	data.setCascade("SA_OPPERMISSION:SPERMISSIONROLEID,SA_OPAUTHORIZE:SAUTHORIZEROLEID");
	var d = document.getElementById("main-grid-view");
	var labelid = "No,sName,sCode,SCATALOG,SDESCRIPTION,SSEQUENCE";
	var labels = "序号,名称,编码,类型,描述,排序";
	var labelwidth = "40,200,100,150,120,100";
	var datatype = "ro,string,string,string,string,number";
	var dataAction = {
		"queryAction": "getGridAction",
		"savAction": "saveAction",
		"deleteAction": "deleteAction"
	};
	maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth, dataAction, "100%", "100%", data, 20, "", "", "", datatype, false, true);
	maingrid.grid.settoolbar(true, false, true, true);
	maingrid.grid.seteditModel(false);
	currentgrid = maingrid.grid;
	// initAuthGrid();

	loadFunList();

	currentgrid.refreshData();

	// 重写新增事件
	document.getElementById(d.id + "_insertItem").onclick = function() {
		tlv8.portal.dailog.openDailog("新增角色", "/SA/system/role/dialog/editRole.html", 600, 450,
		function() {
			currentgrid.refreshData(); // 刷新数据
		});
	};

	currentgrid.insertSelfBar("<i class=\"layui-icon layui-icon-edit\" style=\"font-size: 12px; color: blue;\"></i> 编辑", 70, "dbselrow()");
}

/**
 * @param {object}
 *            event
 */
function dbselrow(event) {
	var rowid = currentgrid.getCurrentRowId();
	tlv8.portal.dailog.openDailog("编辑角色", "/SA/system/role/dialog/editRole.html?rowid=" + rowid, 600, 450,
	function() {
		currentgrid.refreshData(); // 刷新数据
	});
}

var isnewDataFilter = "";
function afterInertFn(event) {
	isnewDataFilter = "SID = '" + event.CurrentRowId + "'";
	currentgrid.setStaticFilter(isnewDataFilter);
}

function afterRefreshFn(event) {
	currentgrid.setStaticFilter("");
}

function initWeb() {
	// $("#main-grid-view").height($("body").height() - 35);
	// $("#auth-grid-view").height($("body").height() - 35);
	// tlv8.standardPartition(document.getElementById("MyDiv"));
	getData();
}

// 功能列表
var auTherGid = null;
function initAuthGrid() {
	var aTdata = new tlv8.Data();
	aTdata.setTable("SA_OPPERMISSION");
	aTdata.setDbkey("system");
	var div = document.getElementById("auth-grid-view");
	var labelid = "master_check,No,SACTIVITYFNAME,SPROCESS,SACTIVITY";
	var labels = "master_check,序号,功能名称,process,activity";
	var labelwidth = "20,40,150,280,100";
	var datatype = "null,ro,ro,ro,ro";
	var dataAction = {
		"queryAction": "getGridAction",
		"savAction": "",
		"deleteAction": "deleteAction"
	};
	maingrid = new tlv8.createGrid(div, labelid, labels, labelwidth, dataAction, "100%", "100%", aTdata, 20, "", "main-auther-form", "SPERMISSIONROLEID", datatype, true, true);
	maingrid.grid.settoolbar(true, false, true, true);
	maingrid.grid.seteditModel(false);
	auTherGid = maingrid.grid;
	auTherGid.setExcelexpBar(true); // 导出
	document.getElementById("auth-grid-view_insertItem").onclick = function() {
		allocatingFunc();
	};
}

function readNameLabel(cgrid, rowObj) {
	var rowid = cgrid.CurrentRowId;
	var label = rowObj.cells(3).innerHTML;
	var SACTIVITYFNAME = rowObj.cells(2).innerHTML;
	if (!label || label == "") {
		label = SACTIVITYFNAME;
	}
	rowObj.cells(3).innerHTML = label;
	rowObj.cells(3).title = $(label).text();
}

// 联动刷新
function mainGridselected(g) {
	if (g.CurrentRowId == "systemManage") { // 禁止删除'系统管理‘角色
		g.settoolbar(true, "readonly", true, false);
	}
	document.getElementById("main-auther-form").rowid = g.CurrentRowId;
	// setTimeout(function() {
	// auTherGid.refreshData();
	// }, 500);
	reloadPermission(); // 加载角色对应的权限配置
}

// 分配功能
function allocatingFunc() {
	tlv8.portal.dailog.openDailog("分配功能", "/SA/system/role/dialog/func-tree-select.html", "300", "500", cocationCallback, null);
}

function cocationCallback(data) {
	// alert("ok"+data);//确定回传
	var kSet = data.keySet();
	for (k in kSet) {
		var rData = data.get(kSet[k]);
		var sLabels = rData.label;
		var sprocess = rData.process;
		var sactivity = rData.activity;
		var newID = auTherGid.insertData();
		auTherGid.setValueByName("SACTIVITYFNAME", newID, sLabels);
		auTherGid.setValueByName("SPROCESS", newID, sprocess);
		auTherGid.setValueByName("SACTIVITY", newID, sactivity);
	}
	auTherGid.saveData();
}

// 拖动分隔线事件
function standardPartitionResize(event) {
	$("#main-grid-view_grid_label").fixTable({
		fixColumn: 0,
		// 固定列数
		fixColumnBack: "#ccc",
		// 固定列数
		width: $("#main-grid-view_body_layout").width(),
		// 显示宽度
		height: $("#main-grid-view_body_layout").height()
		// 显示高度
	});
	// $("#auth-grid-view_grid_label").fixTable({
	// fixColumn : 0,// 固定列数
	// fixColumnBack : "#ccc",// 固定列数
	// width : $("#auth-grid-view_body_layout").width(),// 显示宽度
	// height : $("#auth-grid-view_body_layout").height()
	// // 显示高度
	// });
}

function loadFunList() {
	tlv8.XMLHttpRequest("getFunTableListAction", null, "post", false,
	function(rdata) {
		createMenuList(rdata.data);
	});
}

function getRowspan(data) {
	var r = data.children.length + 1;
	for (var n in data.children) {
		r += data.children[n].children.length;
		for (var m in data.children[n].children) {
			r += data.children[n].children[m].children.length;
		}
	}
	return r;
}

var MenusData = new Map();

function checkChild(obj, check) {
	//	$("input[pid='" + $(obj).attr("id") + "']").attr("checked", true);
	$('input[pid="' + $(obj).attr("id") + '"]').prop('checked', check);
}

var menuTrs = [];
function createMenuList(data) {
	var tr = [];
	for (var i = 0; i < data.length; i++) {
		MenusData.put(data[i].id, data[i].pid);
		tr.push("<tr>");
		tr.push("<td rowspan='" + getRowspan(data[i]) + "'>");
		tr.push('<input class="menucheck" id="' + data[i].id + '" lay-filter="' + data[i].id + '" pid="' + data[i].pid + '" process="' + data[i].process + '" activity="' + data[i].activity + '" type="checkbox" title="' + data[i].name + '" lay-skin="primary" disabled> ');
		tr.push("</td>");
		tr.push("</tr>");
		tr.push(createChildMenu(data[i].children));
	}
	menuTrs = tr;
	builderTable();
}

function builderTable() {
	$("#menulist").html(menuTrs.join(""));
	layui.form.render("");
	layui.form.on('checkbox', function(data) {
		// console.log(data.elem); // 得到checkbox原始DOM对象
		// console.log(data.elem.checked); // 开关是否开启，true或者false
		// console.log(data.value); // 开关value值，也可以通过data.elem.value得到
		// console.log(data.othis); // 得到美化后的DOM对象
		editDataAction(data.elem, data.elem.checked); // 记录编辑数据
		checkChiled($(data.elem).attr("id"), data.elem.checked);//级联选择子项
//		var spid = $(data.elem).attr("pid");
//		if (spid && spid != "" && spid != "null") {
//			checkParent(spid, data.elem.checked);
//		}
		layui.form.render("");
	});
}

function createChildMenu(data) {
	var tr = [];
	for (var i = 0; i < data.length; i++) {
		MenusData.put(data[i].id, data[i].pid);
		tr.push("<tr>");
		tr.push("<td rowspan='" + getRowspan(data[i]) + "'>");
		tr.push('<input class="menucheck" id="' + data[i].id + '" lay-filter="' + data[i].id + '" pid="' + data[i].pid + '" process="' + data[i].process + '" activity="' + data[i].activity + '" type="checkbox" title="' + data[i].name + '" lay-skin="primary" disabled> ');
		tr.push("</td>");
		tr.push("</tr>");
		tr.push(createChildMenu(data[i].children));
	}
	return tr.join("");
}

function reloadPermission() {
	builderTable();
	var param = new tlv8.RequestParam();
	param.set("roleid", currentgrid.getCurrentRowId());
	tlv8.XMLHttpRequest("role/loadRolePermission", param, "post", true,
	function(rdata) {
		setCheckPermission(rdata.data);
	});
}

function setCheckPermission(data) {
	for (var i = 0; i < data.length; i++) {
		var fun = data[i];
//		$("input[process='" + fun.SPROCESS + "']").each(function() {
//			if ($(this).attr("activity") == fun.SACTIVITY) {
//				//$(this).attr("checked", true);
//				$(this).prop("checked", true);
//				checkParent($(this).attr("pid"), true);
//			}
//		});
		$("input[id='" + fun.SMENUID + "']").each(function() {
			$(this).prop("checked", true);
			checkParent($(this).attr("pid"), true);
		});
	}
	layui.form.render("");
}

function checkParent(pid, checked) {
	if (checked) {
		//$("input[id='" + pid + "']").attr("checked", true);
		$("input[id='" + pid + "']").prop("checked", true);
	} else {
		//$("input[id='" + pid + "']").attr("checked", false);
		$("input[id='" + pid + "']").prop("checked", false);
	}
	var spid = $("input[id='" + pid + "']").attr("pid");
	if (spid && spid != "" && spid != "null") {
		checkParent(spid, checked);
	}
}

function checkChiled(pid, checked) {
	var ob = $("input[pid='" + pid + "']");
	if (checked) {
		//ob.attr("checked", true);
		ob.prop("checked", true);
	} else {
		//ob.attr("checked", false);
		ob.prop("checked", false);
	}
	ob.each(function() {
		var cobj = this;
		editDataAction(cobj, checked); // 记录编辑数据
		var cd = $("input[pid='" + $(cobj).attr("id") + "']");
		if (cd.length > 0) {
			checkChiled($(cobj).attr("id"), checked);
		}
	});
}

var editPData = new Map(); // 记录编辑的id
function setEdit(obj) {
	$(".menucheck").removeAttr("disabled");
	editPData = new Map();
	$(obj).attr("disabled", true);
	$(obj).addClass("layui-btn-disabled");
	$("#finishbtn").removeAttr("disabled");
	$("#finishbtn").removeClass("layui-btn-disabled");
	$("#cancelbtn").removeAttr("disabled");
	$("#cancelbtn").removeClass("layui-btn-disabled");
	layui.form.render("");
}

// 数据编辑操作
function editDataAction(obj, checked) {
	var process = $(obj).attr("process");
	var activity = $(obj).attr("activity");
	//if (process && process != "" && activity && activity != "") {
	if (checked) {
		editPData.put($(obj).attr("id"), "add");
	} else {
		editPData.put($(obj).attr("id"), "rem");
	}
	//}
}

function setFinish(obj) {
	if (savePermission()) {
		$(".menucheck").attr("disabled", true);
		$(obj).attr("disabled", true);
		$(obj).addClass("layui-btn-disabled");
		$("#cancelbtn").attr("disabled", true);
		$("#cancelbtn").addClass("layui-btn-disabled");
		$("#editbtn").removeAttr("disabled");
		$("#editbtn").removeClass("layui-btn-disabled");
		layui.form.render("");
		editPData = new Map();
	} else {
		layui.layer.alert("数据保存异常~");
	}
}

/**
 * 点击完成保存数据
 */
function savePermission() {
	var param = new tlv8.RequestParam();
	param.set("roleid", currentgrid.getCurrentRowId());
	var perm = {};
	var mkeys = editPData.keySet();
	for (var i = 0; i < mkeys.length; i++) {
		var key = mkeys[i];
		perm[key] = editPData.get(key);
	}
	param.set("perm", JSON.stringify(perm));
	var rdata = tlv8.XMLHttpRequest("role/saveRolePermission", param, "post", false);
	return rdata.flag;
}

/**
 * 取消分配
 */
function cancelSet(obj) {
	if (editPData.isEmpty()) {
		doCancel(obj);
	} else {
		layui.layer.confirm("当前有修改的配置未保存，确认取消吗?",
		function(index) {
			layui.layer.close(index);
			doCancel(obj);
		});
	}
}

function doCancel(obj) {
	editPData = new Map();
	reloadPermission(); // 重新加载权限
	$(obj).attr("disabled", true);
	$(obj).addClass("layui-btn-disabled");
	$("#finishbtn").attr("disabled", true);
	$("#finishbtn").addClass("layui-btn-disabled");
	$("#editbtn").removeAttr("disabled");
	$("#editbtn").removeClass("layui-btn-disabled");
	layui.form.render("");
}