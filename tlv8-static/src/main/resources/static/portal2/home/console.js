//待办事项
function loadTopTip() {
	$.ajax({
		type : "post",
		async : true,
		dataType : "json",
		url : "/getWaitTaskCount",// 待办任务
		success : function(result, textStatus) {
			$("#taskCount").text(result.data);
			delete result;
		},
		error : function() {
			// 请求出错处理
		}
	});
	$.ajax({
		type : "post",
		async : true,
		dataType : "json",
		url : "/getPortalNotesCount",//通知
		success : function(result, textStatus) {
			var news = result.data;
			$("#notesCount").text(news.data);
			delete news;
			delete result;
		},
		error : function() {
			// 请求出错处理
		}
	});
	$.ajax({
		type : "post",
		async : true,
		dataType : "json",
		url : "/loadNewsAction",//新闻
		success : function(result, textStatus) {
			var news = result.data;
			if (typeof news.data == "string") {
				news.data = window.eval("(" + news.data + ")");
			}
			$("#newsCount").text(news.data.length);
			delete news;
			delete result;
		},
		error : function() {
			// 请求出错处理
		}
	});
	$.ajax({
		type : "post",
		async : true,
		dataType : "json",
		url : "/getPortalBofoAction",//发帖
		success : function(result, textStatus) {
			var news = result.data;
			if (typeof news.data == "string") {
				news.data = window.eval("(" + news.data + ")");
			}
			$("#topicCount").text(news.data.length);
			delete news;
			delete result;
		},
		error : function() {
			// 请求出错处理
		}
	});
	setTimeout(loadTopTip, 60 * 1000);
}
loadTopTip();

//实时监控
function refreshMonitorInfo(){
	  $.ajax({
			type : "post",
			async : true,
			dataType : "json",
			url : "/monitor/CPUPerc",
			success : function(data, textStatus) {
				try {
					data = data.data;
		  			 if(typeof data == "string"){
		  			 	data = window.eval("("+data+")");
		  			 }
					var usedpex = parseFloat(data.usedpex)||0;
					if(usedpex<30){
						$("#cpuprs").attr("class","layui-progress-bar");
					}else if(usedpex<80){
						$("#cpuprs").attr("class","layui-progress-bar layui-bg-blue");
					}else{
						$("#cpuprs").attr("class","layui-progress-bar layui-bg-red");
					}
					layui.element.progress("progress-cpuprs",usedpex+"%");
				} catch (e) {
				}
				delete data;
			}
		});
	  $.ajax({
			type : "post",
			async : true,
			dataType : "json",
			url : "/monitor/MemoryInfo",
			success : function(data, textStatus) {
				try {
					data = data.data;
		  			if(typeof data == "string"){
		  			 	data = window.eval("("+data+")");
		  			}
					var usedpex = parseFloat(data.usedpex)||0;
					if(usedpex<50){
						$("#memprs").attr("class","layui-progress-bar");
					}else if(usedpex<80){
						$("#memprs").attr("class","layui-progress-bar layui-bg-blue");
					}else{
						$("#memprs").attr("class","layui-progress-bar layui-bg-red");
					}
					layui.element.progress("progress-memprs",usedpex+"%");
				} catch (e) {
				}
				delete data;
			}
		});
	  setTimeout(refreshMonitorInfo,1000);
}
refreshMonitorInfo();