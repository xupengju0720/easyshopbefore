$(document).ready(function(){
	//放大镜相册特效
	$(function(){
	    /* 鼠标移动小图，小图对应大图显示在大图上，并替换放大镜中的图*/
	    $("#specList ul li img").livequery("mouseover",function(){ 
	        var imgSrc = $(this).attr("src");
	        var i = imgSrc.lastIndexOf(".");
	        var unit = imgSrc.substring(i);
	        imgSrc = imgSrc.substring(0,i);
	        var imgSrc_small = $(this).attr("src_D");
	        var imgSrc_big = $(this).attr("src_H");
	        $("#bigImg").attr({"src": imgSrc_small ,"jqimg": imgSrc_big });
	        $(this).css({"border":"2px solid #3399cc","padding":"1px"});
	    });
	    
	    $("#specList ul li img").livequery("mouseout",function(){ 
	        $(this).css({"border":"1px solid #ddd","padding":"2px"});
	    });
	    
	    //使用jqzoom
	    $(".jqzoom").jqueryzoom({
	        xzoom: 300, //放大图的宽度(默认是 200)
	        yzoom: 300, //放大图的高度(默认是 200)
	        offset: 10, //离原图的距离(默认是 10)
	        position: "right", //放大图的定位(默认是 "right")
	        preload:1   
	    });
	    
	    /*如果小图过多，则出现滚动条在一行展示*/
	    var btnNext = $('#specRight');
	    var btnPrev = $('#specLeft')
	    var ul = btnPrev.next().find('ul');
	
	    var len = ul.find('li').length;
	    var i = 0 ;
	    if (len > 5) {
	        $("#specRight").addClass("specRightF").removeClass("specRightT");
	        ul.css("width", 54 * len)
	        btnNext.click(function(e) {
	            if(i>=len-5){
	                
	                return;
	            }
	            i++;
	            if(i == len-5){
	                $("#specRight").addClass("specRightT").removeClass("specRightF");
	            }
	            $("#specLeft").addClass("specLeftF").removeClass("specLeftT");
	            moveS(i);
	        })
	        btnPrev.click(function(e) {
	            if(i<=0){
	                return;
	            }
	            i--;
	            if(i==0){
	                $("#specLeft").addClass("specLeftT").removeClass("specLeftF");
	            }
	            $("#specRight").addClass("specRightF").removeClass("specRightT");
	            moveS(i);
	        })
	    }
	    function moveS(i) {
	        ul.animate({left:-67 * i}, 500)
	    }
	    function picAuto(){
	      if ($(".listImg li").size()<=5) {
	        $("#specLeft,#specRight").hide();
	      }
	    }
	    picAuto();
	})
	//加减
	$('.info-stage>.right>.buy>.buy-num>.btn-1').click(function(){
		var b=$('.info-stage>.right>.buy>.buy-num>.inptx').val()
		var a=parseInt(b);
		$('.info-stage>.right>.buy>.buy-num>.inptx').val(a=a-1);
		if(b==1){
			$('.info-stage>.right>.buy>.buy-num>.inptx').val(1);
		}
	})
	$('.info-stage>.right>.buy>.buy-num>.btn-2').click(function(){
		var b=$('.info-stage>.right>.buy>.buy-num>.inptx').val()
		var a=parseInt(b);
		$('.info-stage>.right>.buy>.buy-num>.inptx').val(a=a+1);
		if(b==999){
			$('.info-stage>.right>.buy>.buy-num>.inptx').val(999);
		}
	})
})
