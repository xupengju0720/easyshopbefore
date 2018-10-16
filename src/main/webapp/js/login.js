$(document).ready(function(){
	$('.zhong>.loginForm>ul>li>.verify-tips>h2').hide()
	$('.zhong>.loginForm>ul>li>.verify-tips>span').hide()
//	$('.zhong>.loginForm>ul>li').click(function(){
//		var a=$(this).index()
//		var b=$(this).children('input').val()
//		if(b==''){
//			$(this).eq(a).children('div').children('h2').show()
//		}	
//	})
	$('.tan').hide()
	$('.zhong>.loginForm>.three>.icon-box').click(function(){
		$('.tan').show()
	})
})
