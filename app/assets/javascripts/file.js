
var uuid = Math.random().toString(36).slice(-8)


var formData = new FormData(); // 创建一个form类型的数据

formData.append('uuid', uuid);
formData.append('train', 1);

var train_id;
$.ajax({
    url: "/upload",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    dataType: "json",
    mimeType: "multipart/form-data",
    success: function(res) {
        console.log(res)
        train_id = res.data
    }
})


function selectOld() {
    console.log("onconconconconconconconconconconc")

    console.log(train_id)

    var files = document.getElementById("fileOld").files;

    text = []
    for (var i = 0; i < files.length; i++) {
        file_size = conver(files[i].size)
        text += '<span class="title">'+files[i].name+'</span>'+'<span class="size">'+file_size+'</span>'+'<br>'
        document.getElementById("listOld").innerHTML = text;


        console.log($("#fileOld")[0].files[i])
        file = $("#fileOld")[0].files[i]

        var formData = new FormData(); // 创建一个form类型的数据

        formData.append('file', file);　　
        formData.append('kind', 1);
        formData.append('train_id', train_id);
        $.ajax({
            url: "/upload",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            dataType: "json",
            mimeType: "multipart/form-data",
            success: function(res) {
                console.log(res)
                console.log(res.id)

                if (res.success === 1) {
                    $.notify("上传文件成功!", "success");

                } else {
                    $.notify("上传文件失败!", "error");
                }
            }
        })


    }
}
function selectNew() {
    console.log("onc1onc1onc1onc1onc1onc1onc1onc1onc1onc1")

    console.log(train_id)



    var files = document.getElementById("fileNew").files;

    text = []
    for (var i = 0; i < files.length; i++) {
        file_size = conver(files[i].size)
        text += '<span class="title">'+files[i].name+'</span>'+'<span class="size">'+file_size+'</span>'+'<br>'
        document.getElementById("listNew").innerHTML = text;


        console.log($("#fileNew")[0].files[i])
        file = $("#fileNew")[0].files[i]

        var formData = new FormData(); // 创建一个form类型的数据

        formData.append('file', file);　　
        formData.append('kind', 2);
        formData.append('train_id', train_id);
        $.ajax({
            url: "/upload",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            dataType: "json",
            mimeType: "multipart/form-data",
            success: function(res) {
                console.log(res)
                console.log(res.id)
                if (res.success === 1) {
                    $.notify("上传文件成功!", "success");

                } else {
                    $.notify("上传文件失败!", "error");
                }
            }
        })


    }
}
function conver(limit){
    var size = "";
    if( limit < 0.1 * 1024 ){
        size = limit.toFixed(2) + "B";
    }else if(limit < 0.1 * 1024 * 1024 ){
        size = (limit / 1024).toFixed(2) + "KB";
    }else if(limit < 0.1 * 1024 * 1024 * 1024){
        size = (limit / (1024 * 1024)).toFixed(2) + "MB";
    }else{
        size = (limit / (1024 * 1024 * 1024)).toFixed(2) + "GB";
    }
    var sizestr = size + "";
    var len = sizestr.indexOf("\.");
    var dec = sizestr.substr(len + 1, 2);
    if(dec == "00"){
        return sizestr.substring(0,len) + sizestr.substr(len + 3,2);
    }
    return sizestr;
}

$(function(){
    $(".picture").click(function(){
        var _this = $(this);//
        imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
    });
    });
    function imgShow(outerdiv, innerdiv, bigimg, _this){
    var src = _this.attr("src");
    $(bigimg).attr("src", src);
    $("<img/>").attr("src", src).load(function(){
        var windowW = $(window).width();
        var windowH = $(window).height();
        var realWidth = this.width;
        var realHeight = this.height;
        var imgWidth, imgHeight;
        var scale = 0.8;
        if(realHeight>windowH*scale) {
        imgHeight = windowH*scale;
        imgWidth = imgHeight/realHeight*realWidth;
        if(imgWidth>windowW*scale) {
            imgWidth = windowW*scale;
        }
        } else if(realWidth>windowW*scale) {
        imgWidth = windowW*scale;
                imgHeight = imgWidth/realWidth*realHeight;
        } else {
        imgWidth = realWidth;
        imgHeight = realHeight;
        }
            $(bigimg).css("width",imgWidth);
        var w = (windowW-imgWidth)/2;
        var h = (windowH-imgHeight)/2;
        $(innerdiv).css({"top":h, "left":w});
        $(outerdiv).fadeIn("fast");
    });
    $(outerdiv).click(function(){
        $(this).fadeOut("fast");
    });
    }
