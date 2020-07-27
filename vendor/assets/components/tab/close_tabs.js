function close_curr() {
    //关闭当前标签页
    $("ul>li.active").find(".navTabsCloseBtn").trigger('click')
}
function close_all() {
    //关闭全部标签页
    $(".ui-sortable>li").find(".navTabsCloseBtn").trigger('click')
}
function close_other() {
    //关闭其他标签页
    $(".ui-sortable>li:not(.active)").find(".navTabsCloseBtn").trigger('click')
}