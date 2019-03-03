package edu.zhku.vo;

import edu.zhku.pojo.Merchant;

/**
 * @author chujian
 * @ClassName MerchantVo
 * @Description 功能描述
 * @date 2019/3/3 15:20
 */
public class MerchantVo extends Merchant{

    private String originPsw;

    private String originPhone;

    public String getOriginPsw() {
        return originPsw;
    }

    public void setOriginPsw(String originPsw) {
        this.originPsw = originPsw;
    }

    public String getOriginPhone() {
        return originPhone;
    }

    public void setOriginPhone(String originPhone) {
        this.originPhone = originPhone;
    }
}
    