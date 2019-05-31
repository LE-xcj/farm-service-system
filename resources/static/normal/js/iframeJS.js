<!--ifram自适应-->

function changeFrameHeight(){
    var ifm = document.getElementById("showFrame");
    ifm.width = document.documentElement.clientWidth;
    ifm.height =document.documentElement.clientHeight;

}

window.onresize=function(){
    changeFrameHeight();
}

<!-- 改变iframe的地址，重定向 -->
function redir(url){

    console.info(url);

    $("#showFrame").attr("src", url);
}
