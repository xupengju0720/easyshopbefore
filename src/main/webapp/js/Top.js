$(document).ready(function(){
	$('.nav-zhong .search .shang>b').hide()
	$('.nav-zhong .search .shang .zuo').mouseenter(function(){
		$('.nav-zhong .search .shang>b').show()
	})
	$('.nav-zhong .search').mouseleave(function(){
		$('.nav-zhong .search .shang>b').hide()
	})
	//右侧
	$('.you-top>a .im2').hide()
	$('.you-top>a:last-child').hide()
	$('.you-top>a').mouseenter(function(){
		$(this).children('.im2').show().siblings('.im1').hide()
	})
	$('.you-top>a').mouseleave(function(){
		$(this).children('.im1').show().siblings('.im2').hide()
	})
	$(document).scroll(function(){
		var wheight=$(window).height()
		var offset=$(window).scrollTop();
		if(offset>wheight/2){
			$('.you-top>a:last-child').show();
		}else{
			$('.you-top>a:last-child').hide();
		}
	})
})
