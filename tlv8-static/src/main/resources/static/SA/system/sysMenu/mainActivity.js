/*=========创建树==========*/
var param = {
	cell : {
		databaseName:"system",//数据库
		tableName : "sa_opmenutree",//对应的表名
		id : "sid",//设置构建树的id
		name : "label",//树显示的名称
		parent : "pid",//表示树的层级
		other:"process,activity",//树中所带字段信息
		rootFilter : "(pid is null or pid='')", //跟节点条件
		orderby : "sorts asc" //排序字段
	}
};
var setting = {
	view: {
		selectedMulti: false,		//设置是否允许同时选中多个节点。默认值: true
		autoCancelSelected: false,
		dblClickExpand: true //双击展开
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	async : {
		enable : true, //异步加载
		url : "TreeSelectAction",//加载数据的Action,可以自定义
		autoParam: ["id=currenid"]
	},
	isquickPosition :{
		enable : false, //是否有快速查询框
		url:"QuickTreeAction",
		quickCells : "label",//用于快速查询的字段
		path : ""//查询路径字段
	},
	callback : {
		onClick : treeselected
	}
};

var currenttreeNode = null;
// 选中树
function treeselected(event, treeId, node, clickFlag) {
	currenttreeNode = node;
	J$("main_data_form").rowid = node.id;
	$("#main_data_form").attr("rowid", node.id);
	currentgrid.refreshData();
}

var MainJtree = new Jtree();
/*---------*/
var maingrid = null,currentgrid;
var maindata = new tlv8.Data();
maindata.setDbkey("system");
maindata.setTable("sa_opmenutree");
maindata.setOrderby("sorts asc");
function getDatagrid() {
	MainJtree.init("JtreeView",setting,param);
	var d = document.getElementById("main-grid-view");
	var labelid = "code,i18n,label,icon,layuiicon,url,process,activity,display,icon32,icon64,sorts";
	var labels = "编号,多语言编号,名称,图标,样式图标,路径,流程id,环节id,展示,小图标,大图标,排序";
	var labelwidth = "120,120,200,160,160,300,100,100,100,100,100,100";
	var datatype = "string,string,string,string,string,string,string,string,select:seldisplay,string,string,string";
	var dataAction = {
		"queryAction" : "getGridAction",
		"savAction" : "saveAction",
		"deleteAction" : "deleteAction"
	};
	maingrid = new tlv8.createGrid(d, labelid, labels, labelwidth,
			dataAction, "100%", "100%", maindata, 20,
			"", "main_data_form", "pid", datatype);
	// 设置按钮显示{新增、保存、刷新、删除}
	maingrid.grid.settoolbar(true, true, true, true);
	// 设置是否可编辑
	maingrid.grid.seteditModel(true);
	currentgrid = maingrid.grid;
	currentgrid.refreshData();
}

function afupdate(event) {
	MainJtree.refreshJtree("JtreeView", function(node) {
		if (currenttreeNode) {
			MainJtree.selectNode(MainJtree.getNodeByTId(currenttreeNode.id),
					true);
			MainJtree.expandNode(MainJtree.getNodeByTId(currenttreeNode.id),
					true);
		}
	});
}