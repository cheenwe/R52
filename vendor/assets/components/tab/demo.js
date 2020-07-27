$(function(){
	//计算内容区域高度
	var calcHeight = function(){
		$('#mainFrameTabs').css("height","calc(100% - 20px)");
	};
	//菜单点击
	$('a',$('#menuSideBar')).on('click', function(e) {
		e.stopPropagation();
		var li = $(this).closest('li');
		var menuId = $(li).attr('mid');
		var url = $(li).attr('funurl');
		var title = $(this).text();
		$('#mainFrameTabs').bTabsAdd(menuId,title,url);
	});
	 
	//初始化
	$('#mainFrameTabs').bTabs({
		resize : calcHeight
	});
});