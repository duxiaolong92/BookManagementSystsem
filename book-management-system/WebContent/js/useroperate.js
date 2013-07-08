var REG_EMAIL = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/i;

$(function(){
var  ID=$("#readerID"),
     name=$("#readerName"),
     Email= $("#Email"),
     password=$("#readerPassword"),
     passwordConfirm=$("#readerPasswordConfirm"),
     tel=$("#tel");
     registerChecked = true;;


ID.focus(function(){
	ID.css("background-color","#e3f0ff");
	$("#info1").css("display","block");
	$(".post_error1").html("");
});
ID.blur(function(){	
	ID.css("background-color","#ffffff");	
	$("#info1").css("display","none");	
	if(ID.val() === '') {
	$(".post_error1").html("请输入用户ID");
	    registerChecked = false;
	}  
	else{
	    $(".post_error1").html("");}
});

name.focus(function(){
	name.css("background-color","#e3f0ff");
	$("#info2").css("display","block");
	$(".post_error2").html("");
});
name.blur(function(){
	name.css("background-color","#ffffff");
	$("#info2").css("display","none");	
	if(name.val() === '') {
	$(".post_error2").html("请输入姓名");
	    registerChecked = false;
	}  
	else{
		$(".post_error").html("");}
});
Email.focus(function(){
	Email.css("background-color","#e3f0ff");
	$("#info3").css("display","block");
	$(".post_error3").html("");
});

Email.blur(function(){
	Email.css("background-color","#ffffff");	
	$("#info3").css("display","none");	
if(Email.val() === '') {
    $(".post_error3").html("请输入邮箱");
    registerChecked = false;
} else if (!REG_EMAIL.test(Email.val())) {
    $(".post_error3").html("E-mail格式不正确");
    registerChecked = false;
} 
else{self.parent().find(".post_error").html("");}
});

password.focus(function(){
	password.css("background-color","#e3f0ff");
	$("#info4").css("display","block");
	$(".post_error4").html("");
	
});
password.blur(function(){
	password.css("background-color","#ffffff");
	$("#info4").css("display","none");
	if(password.val() === ""){
	    $(".post_error4").html("请输入您的密码");
	    registerChecked = false;
	}else{$(".post_error4").html("");}
});
	

passwordConfirm.focus(function(){
	passwordConfirm.css("background-color","#e3f0ff");
	$("#info5").css("display","block");
	$(".post_error5").html("");
});
passwordConfirm.blur(function(){
	passwordConfirm.css("background-color","#ffffff");
	$("#info5").css("display","none");
if(passwordConfirm.val() === ""){
    $(".post_error5").html("请再次输入密码");
    registerChecked = false;
}else if(passwordConfirm.val() !== password.val() ){
    $(".post_error5").html("两次密码不一致");
    registerChecked = false;
}else{
    $(".post_error5").html("");
}
});

tel.focus(function(){
	tel.css("background-color","#e3f0ff");
	$(".posyt_error").html("");;
});

tel.blur(function(){
	tel.css("background-color","#ffffff");
});

$("#register").submit(function(){
registerChecked = true;
ID.blur();
Email.blur();
password.blur();
passwordConfirm.blur();
tel.blur();
return registerChecked;
});

});
/*function checkEmail(email,callBack){
    if(typeof(callBack) !== "function"){
        callBack = function(){};
    }
    $.ajax({
        "type":"GET",
        "url":SERVER_PATH,
        "dataType":"jsonp",
        "data":{"do":"checkemail","email":email},
        "success":function(json){
            if(json.success === 0){
                callBack(false);
            }else if(json.success === 1){
                callBack(true);
            }
        },
        "error":function(){
            // alert("服务不可用!");
        }
    });
}*/
