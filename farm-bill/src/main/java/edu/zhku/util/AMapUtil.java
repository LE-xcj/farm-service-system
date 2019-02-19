package edu.zhku.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author chujian
 * @ClassName HttpUtil
 * @Description 功能描述
 * @date 2019/2/18 12:18
 */
public class AMapUtil {

    private static final String DISTANCEURL = "https://restapi.amap.com/v3/distance?parameters";
    private static final String GEOCODEURL = "https://restapi.amap.com/v3/geocode/geo?parameters";
    private static final String SEPERATOR = "|";

    /**
     * 参数都是地理编码
     * 计算终点与多个起点之间的距离（点与点）
     * @param destination  终点
     * @param origins   多个起点
     * @return   终点与多个起点之间的距离集合，与起点的位置顺序一一对应，肯定有数据返回
     */
    public static List<Integer> distance(String destination, String... origins) {

        String data = null;
        //发送get请求
        CloseableHttpClient httpClient = HttpClients.createDefault();

        try {

            //给请求地址建立一个构建uri的对象
            URIBuilder uriBuilder = new URIBuilder(DISTANCEURL);

            //添加请求参数
            uriBuilder.addParameter("key", "85ee99df334409229eaddaea138f675d");
            //拼接origins参数
            String ors = buildOrigins(origins);
            uriBuilder.addParameter("origins", ors);
            uriBuilder.addParameter("destination", destination);
            uriBuilder.addParameter("type", "0");


            HttpGet httpGet = new HttpGet(uriBuilder.build());
            CloseableHttpResponse response = httpClient.execute(httpGet);
            try {
                //获取响应实体
                HttpEntity entity = response.getEntity();
                data = EntityUtils.toString(entity);

            } finally {
                response.close();
            }
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(httpClient);
        }

        List<Integer> distance = getDistance(data);

        return distance;
    }

    /**
     * 位置编码
     *
     * @param address  用户的地址：例如：广东省广州市仲恺农业工程学院
     *                 建议填写结构化地址信息:省份＋城市＋区县＋城镇＋乡村＋街道＋门牌号码
     * @return   位置的地理编码，（维度，经度）,否则返回null
     */
    public static String geoCode(String address) {

        String data = null;
        //发送get请求
        CloseableHttpClient httpClient = HttpClients.createDefault();

        try {

            //给请求地址建立一个构建uri的对象
            URIBuilder uriBuilder = new URIBuilder(GEOCODEURL);

            //添加请求参数
            uriBuilder.addParameter("key", "85ee99df334409229eaddaea138f675d");
            uriBuilder.addParameter("address", address);
            uriBuilder.addParameter("output", "JSON");


            HttpGet httpGet = new HttpGet(uriBuilder.build());
            CloseableHttpResponse response = httpClient.execute(httpGet);
            try {
                //获取响应实体
                HttpEntity entity = response.getEntity();
                data = EntityUtils.toString(entity);

            } finally {
                response.close();
            }
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(httpClient);
        }

        String location = getLocation(data);
        return location;
    }

    /**
     * 从高德的API返回的数据，提取location属性
     * @param data
     * @return
     */
    private static String getLocation(String data) {

        JSONObject jo = JSON.parseObject(data);

        JSONArray ja = jo.getJSONArray("geocodes");

        String location = null;
        if (ja.size() != 0) {
            JSONObject jsonObject =  ja.getJSONObject(0);
            location = jsonObject.getString("location");
        }

        return location;
    }


    /**
     * 拼接origins参数
     * @param origins
     * @return
     */
    private static String buildOrigins(String[] origins) {

        StringBuilder builder = new StringBuilder(origins[0]);

        int length = origins.length;
        for (int i = 1; i<length; ++i) {
            builder.append(SEPERATOR).append(origins[i]);
        }

        return builder.toString();

    }

    /**
     * 解析高德返API返回的json数据
     * 获取其中的distance数据，使用ceil向上取整
     * @param data
     * @return
     */
    private static List<Integer> getDistance(String data) {

        List<Integer> distance = new ArrayList<>();

        //获取results数组
        JSONObject obj = JSON.parseObject(data);
        JSONArray results = obj.getJSONArray("results");

        //遍历每一个元素
        int length = results.size();
        for (int i =0; i<length; ++ i) {

            //获取json对象汇总distance属性
            JSONObject jsonObject = results.getJSONObject(i);
            String ds = jsonObject.getString("distance");

            //将数字字符串转为double类型，再向上取整
            int temp = (int) Math.ceil(Double.valueOf(ds));
            distance.add(temp);

        }

        return distance;
    }

    private static void close(CloseableHttpClient httpClient) {
        try {
            httpClient.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
    