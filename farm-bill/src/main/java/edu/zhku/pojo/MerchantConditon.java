package edu.zhku.pojo;

/**
 * @author chujian
 * @ClassName MerchantConditon
 * @Description 功能描述
 * @date 2019/2/18 20:13
 */
public class MerchantConditon implements Comparable<MerchantConditon>{
    private String mid;
    private int distance;

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }


    @Override
    public int compareTo(MerchantConditon o) {

        if (this.distance > o.getDistance()) {
            return 1;
        } else if (this.distance < o.getDistance()){
            return -1;
        }

        return 0;
    }
}
    