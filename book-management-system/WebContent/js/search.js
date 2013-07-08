$(document).ready(function() {
	var a = new Array();
	var reserve = new Array();
	var pageNow = document.getElementById("pageNow").value;
	var bookListSize = document.getElementById("bookListSize").value;
	$("#search_in_result").focus(function() { // 用户名框获得鼠标焦点
		var txt_value = $(this).val(); // 得到当前文本框的值
		if (txt_value == "重新搜索")
			$(this).val("");
	});

	$("#search_in_result").blur(function() { // 用户名框失去鼠标焦点
		var txt_value = $(this).val(); // 得到当前文本框的值
		if (txt_value == "") {
			$(this).val("重新搜索"); // 如果符合条件，则设置内容
		}				
	});
	
	for ( var i = 0; i < $(".paginator").find("a").length; i++) {
		a[i] = $(".paginator").find("a").eq(i);
	}
	for ( var i = 0; i < $(".reserve").length; i++) {
		reserve[i] = $(".reserve").eq(i);
	}
	//改变分页 页码的颜色
	function change(i){
			a[i].css("background","#83BF73");
			a[i].css("color","#fff");
	}
	
	if(bookListSize > 15){
		pageNow++;
		change(pageNow);		
	}
	
	function res(i){
		reserve[i].click(function(){
			xmlHttp=new XMLHttpRequest();
			var bookID = $(".bookID").eq(i).val();
			var readerID = $(".readerID").eq(i).val();
			if(readerID == 0){
				alert("请先登录");
				return false;
			}
			xmlHttp.onreadystatechange=function()
			  {
				if (xmlHttp.readyState==4 && xmlHttp.status==200)
			    {
				  var data = xmlHttp.responseText;
				  if(data == "预约成功"){
					  reserve[i].css("display","none"); 
					  $(".status").eq(i).html("图书状态:已预约");
				  }else{
					  alert(data);
				  }
				  return true;
			    }
			 };
			xmlHttp.open("post","/book-management-system/BookServlet?actionType=reserve",true);
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlHttp.send("bookID="+bookID+"&readerID="+readerID+"");
		});
	}
	for(var i=0;i<reserve.length;i++){
		res(i);
	}
});