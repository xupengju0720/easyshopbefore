$(document).ready(function(){
	//Banner
	$('.banner>.ban>img').first().show().siblings('img').hide();
	$('.banner>.ban>b>em:first-child').addClass('current-3')
	$('.banner>.ban>b>em').click(function(){
		var a=$(this).index();
		$('.banner>.ban>img').eq(a).show().siblings('img').hide()
		$(this).addClass('current-3').siblings().removeClass('current-3')
	})
	//banner右
	$('.nav>.nav-dao>.box>a>div').hide()
	$('.nav>.nav-dao>.box>a').mouseenter(function(){
		var a=$(this).index()
		$(this).siblings().children('div').show()
		$(this).children('div').hide()
	})
	$('.nav>.nav-dao>.box>a').mouseleave(function(){
		$('.nav>.nav-dao>.box>a>div').hide()
	})
	//HOT 右
	function xunhuan(){
		$('.hot>.hot-shang>.hs-y>.shang>.include>img').last().animate({opacity:'0'},1000,function(){$(this).css('opacity','1')})
		$('.hot>.hot-shang>.hs-y>.shang>.include').prepend($('.hot>.hot-shang>.hs-y>.shang>.include>img').last())
	}
	setInterval(xunhuan,1500)
	//SKINCARE 护肤
	$('.skin>.fenlei>a').eq(0).addClass('cur-1')
	$('.skin>.content>li').eq(0).show().siblings().hide()
	$('.skin>.fenlei>a').mouseenter(function(){
		var a=$(this).index()
		console.log(a)
		$('.skin>.fenlei>a').eq(a).addClass('cur-1').siblings().removeClass('cur-1')
		$('.skin>.content>li').eq(a).show().siblings().hide()
	})
	//小蜗们说
	//彩妆
	$('.makeup>.m>dt>.list>li').first().show().siblings('li').hide();
	$('.makeup>.m>dt>.page>em:first-child').addClass('cur-4')
	$('.makeup>.m>dt>.page>em').click(function(){
		var a=$(this).index();
		$('.makeup>.m>dt>.list>li').eq(a).show().siblings('li').hide()
		$(this).addClass('cur-4').siblings().removeClass('cur-4')
	})
	//
//	$('.nav>.nav-dao>.zuo').slideUp()
	$('.nav>.nav-dao>.nav1').mouseenter(function(){
		$('.nav>.nav-dao>.zuo').slideDown()
	})
	$('.nav').mouseleave(function(){
		$('.nav>.nav-dao>.zuo').slideUp()
	})
})
