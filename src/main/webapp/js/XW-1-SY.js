$(document).ready(function(){
	$('.FuShi .tu em').mouseenter(function(){
		$(this).css({
			'width':'400px',
			'transition':'width 1.5s'
		}).siblings().css({
			'width':'200px',
			'transition':'width 1.5s'})
	})
	//热门活动
	$('.Ban-and-guanggao>.Ban>.xia>.remen>a').mouseenter(function(){
		$(this).css({
			'width':'334px',
			'transition':'width 0.8s'
		}).siblings().css({
			'width':'192px',
			'transition':'width 0.8s'})
	})
	//商城公告
	$('.Ban-and-guanggao>.guanggao>.gonggao1>.top>i').eq(0).show().siblings('i').hide()
	$('.Ban-and-guanggao>.guanggao>.gonggao1>.top>span').eq(0).show().siblings('span').hide()
	$('.Ban-and-guanggao>.guanggao>.gonggao1>.top>i>em').mouseenter(function(){
		var a=$(this).index()
		$('.Ban-and-guanggao>.guanggao>.gonggao1>.top>i').eq(a).show().siblings('i').hide()
		$('.Ban-and-guanggao>.guanggao>.gonggao1>.top>span').eq(a).show().siblings('span').hide()
	})
	//美妆区
	$('.MeiZhuang>.tu>.a2>i>img').first().show().siblings('img').hide();
	$('.MeiZhuang>.tu>.a2>i>b>em:first-child').addClass('current-1')
	$('.MeiZhuang>.tu>.a2>i>b>em').click(function(){
		var a=$(this).index();
		$('.MeiZhuang>.tu>.a2>i>img').eq(a).show().siblings('img').hide()
		$(this).addClass('current-1').siblings().removeClass('current-1')
	})
	$('.MeiZhuang>.tu>.a2>b>a').mouseenter(function(){
		$(this).children('img').stop();
		$(this).children('img').animate({marginLeft:'-8px'},300)
	})
	$('.MeiZhuang>.tu>.a2>b>a').mouseleave(function(){
		$(this).children('img').stop();
		$(this).children('img').animate({marginLeft:'0px'},300)
	})
	$('.MeiZhuang>.tu>b>a').mouseenter(function(){
		$(this).children('img').stop();
		$(this).children('img').animate({marginLeft:'-9px'},300)
	})
	$('.MeiZhuang>.tu>b>a').mouseleave(function(){
		$(this).children('img').stop();
		$(this).children('img').animate({marginLeft:'0px'},300)
	})
	//营养区
	$('.YingYang>.tu>.a2>i>img').first().show().siblings('img').hide();
	$('.YingYang>.tu>.a2>i>b>em:first-child').addClass('current-2')
	$('.YingYang>.tu>.a2>i>b>em').click(function(){
		var a=$(this).index();
		$('.YingYang>.tu>.a2>i>img').eq(a).show().siblings('img').hide()
		$(this).addClass('current-2').siblings().removeClass('current-2')
	})
	$('.YingYang>.tu>b>a').mouseenter(function(){
		$(this).children('img').stop();
		$(this).children('img').animate({marginLeft:'-9px'},300)
	})
	$('.YingYang>.tu>b>a').mouseleave(function(){
		$(this).children('img').stop();
		$(this).children('img').animate({marginLeft:'0px'},300)
	})
	//Banner
	$('.Ban-and-guanggao>.Ban>.shang>.you>.shang-b>img').first().show().siblings('img').hide();
	$('.Ban-and-guanggao>.Ban>.shang>.you>.shang-b>b>em:first-child').addClass('current-3')
	$('.Ban-and-guanggao>.Ban>.shang>.you>.shang-b>b>em').click(function(){
		var a=$(this).index();
		$('.Ban-and-guanggao>.Ban>.shang>.you>.shang-b>img').eq(a).show().siblings('img').hide()
		$(this).addClass('current-3').siblings().removeClass('current-3')
	})
})