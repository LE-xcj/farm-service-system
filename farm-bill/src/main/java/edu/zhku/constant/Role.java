package edu.zhku.constant;

/**
 * @author chujian
 * @ClassName Role
 * @Description 功能描述
 * @date 2019/2/14 10:54
 */
public enum Role {

    FARMER("farmer"),

    MERCHANT("merchant"),

    ADMIN("admin");

    private String pref;
    Role(String pref) {
        this.pref = pref;
    }

    public String getPref() {
        return pref;
    }
}
