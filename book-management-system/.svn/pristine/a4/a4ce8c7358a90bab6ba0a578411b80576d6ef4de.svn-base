$(document).ready(function(){
	$("#two1").click(function(){
		$("#two1").addClass("hover");
		$("#two3").removeClass("hover");
		$("#illegal_info1").css("display","block");
		$("#illegal_info3").css("display","none");
	});
	$("#two3").click(function(){
		$("#two1").removeClass("hover");
		$("#two3").addClass("hover");
		$("#illegal_info1").css("display","none");
		$("#illegal_info3").css("display","block");
	});
	$("#input_readerID").focus(function() { // 用户名框获得鼠标焦点
		var txt_value = $(this).val(); // 得到当前文本框的值
		if (txt_value == "请输入所借图书编号")
			$(this).val("");
	});

	$("#input_readerID").blur(function() { // 用户名框失去鼠标焦点
		var txt_value = $(this).val(); // 得到当前文本框的值
		if (txt_value == "") {
			$(this).val("请输入所借图书编号"); // 如果符合条件，则设置内容
		}				
	});
	
	function borrowBookAjax(){
		$("#bookID").click(function(){
			alert("ad");
		})
	}
	
});
	   

























