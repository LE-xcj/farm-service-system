package edu.zhku.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import edu.zhku.vo.CodeVo;

/**
 * @author chujian
 * @ClassName CRODUtil
 * @Description 功能描述
 * @date 2019/2/25 17:58
 */
public class CRODUtil {

    public static final String CALLBACK = "callback(%s)";

    public static String getJsonp(Object object) {
        String js = JSON.toJSONString(object, SerializerFeature.WriteMapNullValue);
        String data = String.format(CALLBACK, js);

        return data;
    }


    public static String getJsonp(int flag) {
        CodeVo vo = new CodeVo();

        vo.setCode(flag);
        String data = getJsonp(vo);

        return data;
    }

}
    