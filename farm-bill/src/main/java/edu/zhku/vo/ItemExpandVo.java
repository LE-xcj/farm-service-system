package edu.zhku.vo;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.MerchantConditon;

/**
 * @author chujian
 * @ClassName ItemExpandVo
 * @Description 功能描述
 * @date 2019/3/8 10:09
 */
public class ItemExpandVo extends Item implements Comparable<ItemExpandVo>{

    private MerchantConditon merchantConditon;

    public MerchantConditon getMerchantConditon() {
        return merchantConditon;
    }

    public void setMerchantConditon(MerchantConditon merchantConditon) {
        this.merchantConditon = merchantConditon;
    }

    @Override
    public int compareTo(ItemExpandVo o) {

        int distance = this.merchantConditon.getDistance();
        int odisatance = o.getMerchantConditon().getDistance();

        //如果价格相等那么就比较距离的远近
        if ((float)this.getPrice() == o.getPrice()) {
            if (distance > odisatance) {
                return 1;
            } else if (distance < odisatance){
                return -1;
            }
        }

        return 0;
    }
}
    