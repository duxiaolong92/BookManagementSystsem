$(function(){
	var tel=$("#tel");
	    email=$("#email");
	    resetFormChecked=true;
	    
	    tel.focus(function() {
			$(".post_error1").html("");

		});
	    tel.blur(function() {
			if (tel.val() === "") {
				$(".post_error1").html("请输入您的电话");
				resetFormChecked= false;
			} else {
				$(".post_error1").html("");
			}
		});

	   email.focus(function() {
			$(".post_error2").html("");
		});
	   email.blur(function() {
			if (email.val() === "") {
				$(".post_error2").html("请输入您的邮箱");
				resetFormChecked = false;
			} else {
				$(".post_error2").html("");
			}
		});

		$("#resetForm").submit(function() {
			resetFormChecked = true;
			tel.blur();
			email.blur();
			return resetFormChecked;
		});
});