package edu.zhku.util;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author chujian
 * @ClassName MessageUtil
 * @Description 功能描述
 * @date 2019/2/13 16:18
 */
public class SMSUtil {

    public static final String  HOST = "https://dxyzm.market.alicloudapi.com";
    public static final String PATH = "/chuangxin/dxjk";
    public static final String METHOD = "POST";
    public static final String APPCODE = "cf81290370e44443976d2e3c4c5d905d";
    public static final String TEMPLATE = "【无人机农田服务系统】您的验证码是：*，3分钟内有效！";

    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
    private static Map<String, String> headers = new HashMap<>();
    static {
        headers.put("Authorization", "APPCODE " + APPCODE);
    }

    public static void sendMsg(String phone, String code){

        Map<String, String> querys = new HashMap<>();
        String content = TEMPLATE.replace("*", code);
        querys.put("content", content);
        querys.put("mobile", phone);

        Map<String, String> bodys = new HashMap<>();

        System.out.println(content);
        try {

            HttpResponse response = HttpUtils.doPost(HOST, PATH, METHOD, headers, querys, bodys);
            //获取response的body
            System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //计时
    private static Map<String, Timer> timers = new ConcurrentHashMap<>();
    public static void timing(HttpSession session) {

        String sessionId = session.getId();
        Timer timer = timers.get(sessionId);

        if (null != timer) {
            timer.cancel();
            timer.purge();
        }

        timer = new Timer();
        timers.put(sessionId, timer);

        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                session.removeAttribute("realCode");
                System.out.println("删除");

            }
        }, 1*60*1000);

    }

/*    public static void main(String[] args){
        new SMSUtil().sendMsg("13632495507", "2009");
    }*/
}
    