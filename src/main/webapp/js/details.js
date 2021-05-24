$(function() {

$("#ordercode").blur(
		function() {
			$("#ordercode_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#ordercode").after("<span id='ordercode_msg' style='color: red'>订单号不能为空</span>");
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

$("#cityid").blur(
		function() {
			$("#cityid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#cityid").after("<span id='cityid_msg' style='color: red'>城市不能为空</span>");
			}
	});

$("#peihuoid").blur(
		function() {
			$("#peihuoid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#peihuoid").after("<span id='peihuoid_msg' style='color: red'>配货点不能为空</span>");
			}
	});

$("#viewdate").blur(
		function() {
			$("#viewdate_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#viewdate").after("<span id='viewdate_msg' style='color: red'>提货日期不能为空</span>");
			}
	});







$('#sub').click(function(){
var ordercode = $("#ordercode").val();
var jiancaiid = $("#jiancaiid").val();
var num = $("#num").val();
var price = $("#price").val();
var cityid = $("#cityid").val();
var peihuoid = $("#peihuoid").val();
var viewdate = $("#viewdate").val();
$("#ordercode_msg").empty();
$("#jiancaiid_msg").empty();
$("#num_msg").empty();
$("#price_msg").empty();
$("#cityid_msg").empty();
$("#peihuoid_msg").empty();
$("#viewdate_msg").empty();
if (ordercode == "" || ordercode == null) {
	$("#ordercode").after("<span id='ordercode_msg' style='color: red'>订单号不能为空</span>");
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
if (cityid == "" || cityid == null) {
	$("#cityid").after("<span id='cityid_msg' style='color: red'>城市不能为空</span>");
	return false;
}
if (peihuoid == "" || peihuoid == null) {
	$("#peihuoid").after("<span id='peihuoid_msg' style='color: red'>配货点不能为空</span>");
	return false;
}
if (viewdate == "" || viewdate == null) {
	$("#viewdate").after("<span id='viewdate_msg' style='color: red'>提货日期不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#ordercode_msg").empty();
$("#jiancaiid_msg").empty();
$("#num_msg").empty();
$("#price_msg").empty();
$("#cityid_msg").empty();
$("#peihuoid_msg").empty();
$("#viewdate_msg").empty();
});


});
