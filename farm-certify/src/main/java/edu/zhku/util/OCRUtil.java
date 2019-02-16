package edu.zhku.util;

import com.baidu.aip.ocr.AipOcr;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author chujian
 * @ClassName OCRUtil
 * @Description 功能描述
 * @date 2019/2/15 21:52
 */

/**
 * OCR工具类
 * 使用百度提供的OCR
 */
public class OCRUtil {
    //设置APPID/AK/SK
    private static final String APP_ID = "15531961";
    private static final String API_KEY = "XmVs9QwZgz9x9s5lsKGFwLwD";
    private static final String SECRET_KEY = "fN9S9WAsneGXoCbAtIgsQAfdQSaFPXub";
    private static AipOcr client;

    static {
        // 初始化一个AipOcr
        client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

        // 可选：设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);
    }


    /**
     *
     * @param url
     * 	图片完整URL，URL长度不超过1024字节，URL对应的图片base64编码后大小不超过4M，
     * 	最短边至少15px，最长边最大4096px,支持jpg/png/bmp格式，当image字段存在时url字段失效
     *
     *  详情：
     * 	https://cloud.baidu.com/doc/OCR/OCR-Java-SDK.html#.E9.80.9A.E7.94.A8.E6.96.87.E5.AD.97.E8.AF.86.E5.88.AB
     */
    public static String normalCertify(String url) {

        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();

        // CHN_ENG：中英文混合
        options.put("language_type", "CHN_ENG");

        //是否检测图像朝向，默认不检测，即：false。朝向是指输入图像是正常方向、逆时针旋转90/180/270度。
        options.put("detect_direction", "true");

        //是否检测语言，默认不检测。当前支持（中文、英语、日语、韩语）
        options.put("detect_language", "true");

        //是否返回识别结果中每一行的置信度
        options.put("probability", "false");


        // 通用文字识别, 图片参数为远程url图片
        JSONObject res = client.basicGeneralUrl(url, options);

        return res.toString(2);
    }

    /**
     * 高进度识别
     * 百度的接口只支持图片的二进制数组，所以调用之前需要将网络图片转为二进制数组
     * @param url  图片地址
     * @return    图片识别后的数据
     */
    public static String preciseCertify(String url) {

        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("detect_direction", "true");
        options.put("probability", "false");


        // 参数为图片二进制数组
        byte[] file = readImageFile(url);
        JSONObject res = client.basicAccurateGeneral(file, options);

        return res.toString(2);
    }

    /**
     * 将网络上的图片资源转为二进制数组
     * @param urlStr
     * @return
     */
    private static byte[] readImageFile(String urlStr) {

        InputStream is = null;
        ByteArrayOutputStream os = null;
        byte[] buff = new byte[1024];
        int len = 0;
        try {
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();
            is = conn.getInputStream();
            os = new ByteArrayOutputStream();
            while ((len = is.read(buff)) != -1) {
                os.write(buff, 0, len);
            }

            byte[] bytes = os.toByteArray();
            return bytes;
        } catch (IOException e) {
            return null;
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                }
            }
        }
    }

    private static final String REGEX = "企业名称([\\s\\S]*?)公司";
    private static final Pattern PATTERN = Pattern.compile(REGEX);
    private static final int BEGINNING = 4;

    /**
     * 提取公司名称
     * @param data   百度OCR返回的识别结果
     *               因为百度的OCR识别不能保证百分百识别，所以即使一张识别成功过的图片，下一次可能会识别失败。
     *
     * @return      公司的名称，如果OCR识别失败是提取不了，返回null
     */
    public static String getName(String data) {

        Matcher matcher = PATTERN.matcher(data);
        String name = null;

        if (matcher.find()) {
            String temp = matcher.group();

            name = temp.substring(BEGINNING);

            System.out.println(name);
            return name;
        }

        return name;
    }

}
    