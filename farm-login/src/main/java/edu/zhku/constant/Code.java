package edu.zhku.constant;

import java.lang.annotation.Target;

/**
 * @author chujian
 * @ClassName Code
 * @Description 功能描述
 * @date 2019/2/14 9:51
 */
public enum Code {

    //不存在
    PHONENOTEXIST(-1, "该手机号没有注册！"),
    MISMATCH(0, "手机号和密码不匹配！"),
    PHONEEXIST(502, "该手机号已经注册了！"),
    WRONGVERIFYCODE(503, "验证码错误！"),
    ATTRIBUTECANNOTNULL(500, "信息不能为空！"),
    FAIL(501, "操作失败"),
    SUCCESS(1, "操作成功！");

    private String tip;
    private int code;

    Code(int code, String tip){
        this.tip = tip;
        this.code = code;
    }

    public String getTip() {
        return tip;
    }


    public int getCode() {
        return code;
    }

}
