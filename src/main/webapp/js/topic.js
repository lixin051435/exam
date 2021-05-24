$(function() {

$("#usersid").blur(
		function() {
			$("#usersid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#usersid").after("<span id='usersid_msg' style='color: red'>用户不能为空</span>");
			}
	});

$("#jiancaiid").blur(
		function() {
			$("#jiancaiid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#jiancaiid").after("<span id='jiancaiid_msg' style='color: red'>建材不能为空</span>");
			}
	});

$("#num").blur(
		function() {
			$("#num_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#num").after("<span id='num_msg' style='color: red'>评分不能为空</span>");
			}
	});

$("#contents").blur(
		function() {
			$("#contents_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#contents").after("<span id='contents_msg' style='color: red'>内容不能为空</span>");
			}
	});

$("#addtime").blur(
		function() {
			$("#addtime_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#addtime").after("<span id='addtime_msg' style='color: red'>发布日期不能为空</span>");
			}
	});







$('#sub').click(function(){
var usersid = $("#usersid").val();
var jiancaiid = $("#jiancaiid").val();
var num = $("#num").val();
var contents = $("#contents").val();
var addtime = $("#addtime").val();
$("#usersid_msg").empty();
$("#jiancaiid_msg").empty();
$("#num_msg").empty();
$("#contents_msg").empty();
$("#addtime_msg").empty();
if (usersid == "" || usersid == null) {
	$("#usersid").after("<span id='usersid_msg' style='color: red'>用户不能为空</span>");
	return false;
}
if (jiancaiid == "" || jiancaiid == null) {
	$("#jiancaiid").after("<span id='jiancaiid_msg' style='color: red'>建材不能为空</span>");
	return false;
}
if (num == "" || num == null) {
	$("#num").after("<span id='num_msg' style='color: red'>评分不能为空</span>");
	return false;
}
if (contents == "" || contents == null) {
	$("#contents").after("<span id='contents_msg' style='color: red'>内容不能为空</span>");
	return false;
}
if (addtime == "" || addtime == null) {
	$("#addtime").after("<span id='addtime_msg' style='color: red'>发布日期不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#usersid_msg").empty();
$("#jiancaiid_msg").empty();
$("#num_msg").empty();
$("#contents_msg").empty();
$("#addtime_msg").empty();
});


});
