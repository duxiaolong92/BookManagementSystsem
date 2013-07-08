$(document).ready(function(){
	var see_more = new Array();
	var more = new Array();
	var close = new Array();
	var short_introduce = new Array();
	var size = $(".see_more").length;
	for(var i = 0;i < size;i++){
		see_more[i] = $(".see_more").eq(i);
	}
	for(var i = 0;i < size;i++){
		more[i] = $(".more").eq(i);
	}
	for(var i = 0;i < size;i++){
		close[i] = $(".close").eq(i);
	}
	for(var i = 0;i < size;i++){
		short_introduce[i] = $(".short_introduce").eq(i);
	}
	function openComment(i){
		see_more[i].click(function(){
			more[i].css("display","block");
			short_introduce[i].css("display","none");
		close[i].click(function(){
			more[i].css("display","none");
			short_introduce[i].css("display","block");
		});
		});
	}
	for(i = 0;i < size;i ++){
		openComment(i);
	}
/*	function closeComment(i){
		close[i].click(function(){
			more[i].css("display","none");
			short_introduce[i].css("display","block");
		});
		for(i=0;i<size;i++){
			closeComment(i);
		}
		
	}*/
});