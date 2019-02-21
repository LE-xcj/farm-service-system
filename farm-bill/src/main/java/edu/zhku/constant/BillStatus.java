package edu.zhku.constant;

/**
 * @author chujian
 * @ClassName BillStatus
 * @Description 功能描述
 * @date 2019/2/21 21:20
 */
public class BillStatus {

    //订单初始状态：未确认
    public static final int UNOK = 0;

    //确认
    public static final int OK = 1;
    //拒绝
    public static final int REJECT = -1;


    //完成
    public static final int COMPLETE = 2;
    //取消
    public static final int CANCEL = -2;
}
    