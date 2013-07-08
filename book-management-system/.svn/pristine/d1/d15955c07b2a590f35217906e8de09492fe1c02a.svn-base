function checkAll(){
	var arr=document.getElementsByTagName("input");
	for(var i=0;i<arr.length;i++){
		        var abc=arr[i];
		        if(abc.type=="checkbox"){
		        	if(abc.checked==false){
			           abc.checked=true;
		            }
		        	else if(abc.checked==true){
		        		abc.checked=false;
	                }
	             }
	}
}

function selectCheckedBook(){
	var str=new Array();
	var arr=document.getElementsByName("isbns");
	for(var i=0;i<arr.length;i++){
		var obj=arr[i];
		if((obj.type=="checkbox")&&(obj.checked==true)){
				str=str+obj.value+",";
			}
		}
	alert("É¾³ýµÚ"+str+"ÐÐ?");
	document.location.href="/book-management-system/BookServlet?actionType=delCheckedInform&ID="+str;
}
