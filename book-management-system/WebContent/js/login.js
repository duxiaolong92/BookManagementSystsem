$(document).ready(	
		function() {	
			loginChecked= true;	
			// 对用户名框进行操作
			function  checkForms(t) {//判断非法字符
				var pat=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i"); 
				if(pat.test(t) == true){
					return false;	
				}
				return true;
			}
			
			$("#user_name").focus(function() { // 用户名框获得鼠标焦点
				var txt_value = $(this).val(); // 得到当前文本框的值
				if (txt_value == "用户名/邮箱")
					$(this).val("");
			});

			$("#user_name").blur(function() { // 用户名框失去鼠标焦点
				var txt_value = $(this).val(); // 得到当前文本框的值
				if (txt_value == "") {
					$(this).val("用户名/邮箱"); // 如果符合条件，则设置内容
				}
				if(checkForms(txt_value) == false){//判断非法字符
					$(".post_error1").html("用户名不能含有非法字符");
					loginChecked = false;
				}
							
			});
			
			$("#password").blur(function() { // 用户名框失去鼠标焦点
				var txt_value = $(this).val(); // 得到当前文本框的值
				if(checkForms(txt_value) == false){
					$(".post_error2").html("密码不能含有非法字符");
					loginChecked = false;
				}		
			})
			
			$("#login").submit(function() {
				loginChecked = true;
				$("#user_name").blur();
				$("#password").blur();
				return loginChecked;
			});

		});

