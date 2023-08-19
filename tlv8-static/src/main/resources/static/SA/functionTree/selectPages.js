function initDocumentPage() {
	$('#tt').tree({
		url : cpath + "/system/fun/loaadPages",
		loadFilter : function(data) {
			console.log(data);
			if (data.d) {
				return data.d;
			} else {
				return data;
			}
		},
		onLoadSuccess : function(node, data) {
			$('#tt').tree("collapseAll");
		}
	});
}

function dailogEngin() {
	var name = $("#title").val();
	if (!name || name == "") {
		layui.layer.alert("功能名称不能为空~");
		return false;
	}
	var node = $('#tt').tree("getSelected");
	if (node && node.path) {
		node.process = node.path.substring(0, node.path.lastIndexOf("/"))
				+ "/process";
		node.activity = node.path.substring(node.path.lastIndexOf("/") + 1);
		node.activity = node.activity.substring(0, node.activity.indexOf("."));
		node.name = name;
		return node;
	}
	return false;
}