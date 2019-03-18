package edu.zhku.util;

import edu.zhku.constant.BillStatus;
import edu.zhku.pojo.Operator;

import java.util.List; /**
 * @author chujian
 * @ClassName MessageFactory
 * @Description 功能描述
 * @date 2019/2/21 20:54
 */
public class MessageFactory {

    /**
     *  订单状态：
     *  0：未确认；  初始（不用）
     *  1：确认；    商户操作（通知农户）
     *  2：完成；    农户操作（通知商户）
     *  -1：拒绝；   通知农户
     *  -2：取消     通知商户
     * @param bid  订单id
     * @param status  订单状态
     * @return
     */
    private static final String model = "订单：%s ";

    public static String getContent(String bid, int status) {

        String msg = String.format(model, bid);
        switch (status) {
            case BillStatus.CANCEL:{
                msg += " 被取消了";
            }break;
            case BillStatus.COMPLETE:{
                msg += " 完成了";
            }break;
            case BillStatus.OK:{
                msg += " 已经确认了";
            }break;
            case BillStatus.REJECT:{
                msg += " 被拒绝了";
            }break;
        }

        return msg;

    }

    /**
     * 这里获取：商户安排相应机手负责某一农户的订单，所需要发送的消息
     * @param bid
     * @param os
     * @return   包含机手信息的消息
     */
    public static String getContent(String bid, List<Operator> os) {

        String msg = String.format(model, bid);
        StringBuilder builder = new StringBuilder(" 由以下机手负责\n");
        for (Operator operator : os) {
            builder.append("机手:")
                    .append(operator.getOname())
                    .append("  联系方式:").append(operator.getPhone())
                    .append("\n");
        }
        msg += builder.toString();
        return msg;
    }



    private static final String PREF = "您有新的订单了, 单号: %s";

    /**
     * 通知商户有新的订单
     * @param bid
     * @return
     */
    public static String getContent(String bid) {

        String msg = String.format(PREF, bid);

        return msg;
    }


    //todo 到时还需根据ip改动
    public static final String EVAURL = "127.0.0.1:10086/farmService/item/evaluateView?bid=";
    public static String getEvaluationUrl(String bid) {

        String url = EVAURL + bid;

        return url;

    }
}
    