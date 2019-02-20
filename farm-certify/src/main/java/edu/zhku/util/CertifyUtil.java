package edu.zhku.util;

import edu.zhku.constant.Code;
import org.apache.http.HttpEntity;
import org.apache.http.HttpVersion;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.io.IOException;

/**
 * @author chujian
 * @ClassName CertifyUtil
 * @Description 功能描述
 * @date 2019/2/16 10:42
 */
public class CertifyUtil {

    public static final String REQUESTURL = "http://uas.ga.caac.gov.cn/api/uavmanager/open/enterprise/identity/getListByFuzzy";

    public static final String KEY = "?keyword=";

    public static final String PRE =  REQUESTURL + KEY;


    /**
     * 调用查询接口，查询公司的信息
     * @param name  公司名称
     * @return
     */
    private static String query(String name) {

        String url = PRE + name;
        String data = null;

        //发送get请求
        CloseableHttpClient httpClient = HttpClients.createDefault();

        try {
            HttpGet httpGet = new HttpGet(url);

            int timeout = 60;
            RequestConfig defaultRequestConfig = RequestConfig.custom()
                    .setSocketTimeout(timeout * 1000)
                    .setConnectTimeout(timeout * 1000)
                    .setConnectionRequestTimeout(timeout * 1000)
                    .build();

            httpGet.setProtocolVersion(HttpVersion.HTTP_1_0);

            httpGet.setHeader("accept", "application/json, text/plain, */*");
            httpGet.setHeader("connection", "keep-alive");
            httpGet.setHeader("user-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36");
            httpGet.setConfig(defaultRequestConfig);
            //httpGet.setHeader("referer", "http://uas.ga.caac.gov.cn/login");
            httpGet.addHeader(HTTP.CONN_DIRECTIVE, HTTP.CONN_CLOSE);


            System.out.println("begin to execute http get");

            CloseableHttpResponse response = httpClient.execute(httpGet);


            try {
                //获取响应实体
                HttpEntity entity = response.getEntity();
                data = EntityUtils.toString(entity);

                System.out.println("get data");
            } finally {

                HttpEntity httpEntity = response.getEntity();
                EntityUtils.consume(httpEntity);        //按照官方文档的说法：二者都释放了才可以正常的释放链接
                response.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return data;
    }


    /**
     * 判断是否有经营许可
     * @param name  公司名称
     * @return
     */
    public static boolean exsit(String name) {

        //获取无人机经营许可查询的结果
        String data = query(name);

        System.out.println("certifyUtil : exsit function : " + data);

        //转为Json对象
        JSONObject object = new JSONObject(data);

        //获取状态码
        Integer code = (Integer) object.get("code");

        if (Code.SUCCESS == code) {

            JSONObject jsonObject = object.getJSONObject("data");
            Integer count = (Integer) jsonObject.get("count");

            if (count == 1) {
                return true;
            }
        }

        return false;

    }


}
    