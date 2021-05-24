$(function() {

$("#peihuoname").blur(
		function() {
			$("#peihuoname_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#peihuoname").after("<span id='peihuoname_msg' style='color: red'>配货点名称不能为空</span>");
			}
	});

$("#cityid").blur(
		function() {
			$("#cityid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#cityid").after("<span id='cityid_msg' style='color: red'>城市不能为空</span>");
			}
	});

$("#address").blur(
		function() {
			$("#address_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#address").after("<span id='address_msg' style='color: red'>地址不能为空</span>");
			}
	});

$("#contact").blur(
		function() {
			$("#contact_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#contact").after("<span id='contact_msg' style='color: red'>联系手机不能为空</span>");
			}
	});

$("#memo").blur(
		function() {
			$("#memo_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
			}
	});







$('#sub').click(function(){
var peihuoname = $("#peihuoname").val();
var cityid = $("#cityid").val();
var address = $("#address").val();
var contact = $("#contact").val();
var memo = $("#memo").val();
$("#peihuoname_msg").empty();
$("#cityid_msg").empty();
$("#address_msg").empty();
$("#contact_msg").empty();
$("#memo_msg").empty();
if (peihuoname == "" || peihuoname == null) {
	$("#peihuoname").after("<span id='peihuoname_msg' style='color: red'>配货点名称不能为空</span>");
	return false;
}
if (cityid == "" || cityid == null) {
	$("#cityid").after("<span id='cityid_msg' style='color: red'>城市不能为空</span>");
	return false;
}
if (address == "" || address == null) {
	$("#address").after("<span id='address_msg' style='color: red'>地址不能为空</span>");
	return false;
}
if (contact == "" || contact == null) {
	$("#contact").after("<span id='contact_msg' style='color: red'>联系手机不能为空</span>");
	return false;
}
if (memo == "" || memo == null) {
	$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#peihuoname_msg").empty();
$("#cityid_msg").empty();
$("#address_msg").empty();
$("#contact_msg").empty();
$("#memo_msg").empty();
});


});
