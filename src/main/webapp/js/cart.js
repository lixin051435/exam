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
				$("#num").after("<span id='num_msg' style='color: red'>数量不能为空</span>");
			}
	});

$("#price").blur(
		function() {
			$("#price_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#price").after("<span id='price_msg' style='color: red'>单价不能为空</span>");
			}
	});







$('#sub').click(function(){
var usersid = $("#usersid").val();
var jiancaiid = $("#jiancaiid").val();
var num = $("#num").val();
var price = $("#price").val();
$("#usersid_msg").empty();
$("#jiancaiid_msg").empty();
$("#num_msg").empty();
$("#price_msg").empty();
if (usersid == "" || usersid == null) {
	$("#usersid").after("<span id='usersid_msg' style='color: red'>用户不能为空</span>");
	return false;
}
if (jiancaiid == "" || jiancaiid == null) {
	$("#jiancaiid").after("<span id='jiancaiid_msg' style='color: red'>建材不能为空</span>");
	return false;
}
if (num == "" || num == null) {
	$("#num").after("<span id='num_msg' style='color: red'>数量不能为空</span>");
	return false;
}
if (price == "" || price == null) {
	$("#price").after("<span id='price_msg' style='color: red'>单价不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#usersid_msg").empty();
$("#jiancaiid_msg").empty();
$("#num_msg").empty();
$("#price_msg").empty();
});


});
