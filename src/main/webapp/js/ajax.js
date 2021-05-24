$(function() {
	$('#cityid').change(
			function() {
				var cityid = $("#cityid").val();
				var loc = $("input[name='basepath']").val();
				var url = loc + "ajax/getPeihuo.action?cityid=" + cityid;
				$.ajax({
					type : "get",
					url : url,
					dataType : "json",
					success : function(json) {
						var peihuoid = json.peihuoid.replace("[", "").replace("]", "").split(",");
						var peihuoname = json.peihuoname.replace("[", "").replace("]", "").split(",");
						var myOptions = '<option value="">---请选择配货点---</option>';
						for (var i = 0; i < peihuoid.length; i++) {
							myOptions += '<option value="' + peihuoid[i] + '">' + peihuoname[i] + '</option>';
						}
						$("#peihuoid").empty();
						$("#peihuoid").html(myOptions);
					},
					error : function() {
						alert("ajax请求发生错误3");
					}
				});
			});
});

$(function() {
	$('#sub').click(function(){
		var cityid = $("#cityid").val();
		$("#cityid_msg").empty();
		if (cityid == "" || cityid == null) {
			$("#cityid").after("<span id='cityid_msg' style='color: red'>请选择城市</span>");
			return false;
		}
		var peihuoid = $("#peihuoid").val();
		$("#peihuoid_msg").empty();
		if (peihuoid == "" || peihuoid == null) {
			$("#peihuoid").after("<span id='peihuoid_msg' style='color: red'>请选择配货点</span>");
			return false;
		}
		var peihuoid = $("#viewdate").val();
		$("#viewdate_msg").empty();
		if (viewdate == "" || viewdate == null) {
			$("#viewdate").after("<span id='viewdate_msg' style='color: red'>请选择提货日期</span>");
			return false;
		}
	});
});


