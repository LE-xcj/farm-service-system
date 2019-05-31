<!--提示框-->
function showDialog(tip){
    $.DialogByZ.Alert({Title: "提示", Content: tip,BtnL:"确定",FunL:alerts});
}
function alerts(){

    $.DialogByZ.Close();
}

<!--检查手机号-->
function checkMobile(_phone){
    if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(_phone))){
        return false;
    }
    return true;
}