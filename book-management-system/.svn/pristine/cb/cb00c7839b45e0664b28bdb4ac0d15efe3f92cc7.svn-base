$(document).ready(function(){
	var leftLable = new Array();
	var rightLable = new Array();
	var leftLableIndex = new Array();
	for(var i = 0;i < $("#left li").length;i++){
		leftLable[i] = $("#left li").eq(i);
	}
	for(var i = 0;i < $("#right div").length;i++){
		rightLable[i] = $("#right div").eq(i);
	}
	
	
	leftLableIndex[0] = $("#con_one_3 a").eq(0);
	leftLableIndex[1] = $("#con_one_3 a").eq(1);
	
	for(var i = 2;i < 8;i++){
		leftLableIndex[i] = $(".content2_book").eq(i-2).find(".pl");
	}
	
	COUNT = leftLable.length;	
	
	
/*	getLeftLableIndex();
	leftLableIndex[0].mouseover(function(){alert("adf")})*/
	
	function change(i){
		for(var j = 0;j < COUNT;j++){
			if(j != i){
						rightLable[j].css("display","none");
						leftLable[j].css("background-color","#fff");
			}
			else{
						rightLable[i].css("display","block");
						leftLable[i].css("background-color","#EFEEFE");
			}
		}
	}
	

	function clickLeftLable(i){
		leftLable[i].click(function(){
			change(i);
		})
	}
	
	
	function clickLeftLableIndex(i){
/*		if(leftLableIndex[i].click())
		{
			alert(i)
			j = i;
			change(j);
		}
		else
			change(j);*/
	}
	var i = $("#indexID").val();
	change(i);
	for(i = 0;i < COUNT;i++){
		clickLeftLable(i);
	}
});