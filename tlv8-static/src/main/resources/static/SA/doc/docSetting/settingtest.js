$(function() {
	var url = tlv8.RequestURLParam.getParam("taget");
	if (url) {
		url = J_u_decode(url);
		$("#testframe").attr("src", url);
	}
});

function changestate() {
	$("#testframe").show();
	$("#showstate").hide();
}