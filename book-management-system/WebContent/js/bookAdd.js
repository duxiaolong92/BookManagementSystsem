$(document).ready(function(){
	$("#ISBN").click(function(){
		var ISBN = $("#ISBNvalue").val();
		xmlHttp=new XMLHttpRequest();
		xmlHttp.onreadystatechange=function()
		  {
			if (xmlHttp.readyState==4 && xmlHttp.status==200)
		    {
			   var data = xmlHttp.responseText;	
			   var book = eval("("+data+")");
			   spider(book);
			}
		 };
		xmlHttp.open("post","../BookServlet?actionType=spider",true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send("search="+ISBN+"");
	});
	
	function spider(book){
		var input = new Array();
		for(var i = 0;i < $("#book1").find("input").length;i++){
			input[i] = $("#book1").find("input").eq(i);
	  	}
		input[0].val() == book.book[0].ISBN;
		input[2].val(book.book[0].bookName);
		input[3].val(book.book[0].author);
		input[4].val(book.book[0].price);
		input[5].val(book.book[0].press);
		input[6].val(book.book[0].storageTime);
		input[7].val(book.book[0].bookType);
		input[8].val(book.book[0].readingRoom);
		$("textarea").val(book.book[0].summaryNote);
		input[9].val(book.book[0].bookImage);
		
	}
	
});