$(document).ready(function(){
	$('.ucenter>.left>.ctn>.forum>.head').click(function(){
		var a=$(this).parent().index()
		console.log(a)
		$(this).parent().children('.ctn').slideToggle()
	})
	//
	$('.tu-2').hide()
	$('.t-1').addClass('cur-7')
	$('.t-2').click(function(){
		$('.tu-2').show()
		$('.tu-1').hide()
		$('.t-2').addClass('cur-7')
		$('.t-1').removeClass('cur-7')
	})
	$('.t-1').click(function(){
		$('.tu-1').show()
		$('.tu-2').hide()
		$('.t-1').addClass('cur-7')
		$('.t-2').removeClass('cur-7')
	})
})
