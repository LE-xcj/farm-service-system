package edu.zhku.util;

import java.util.UUID;

/**
 * @author chujian
 * @ClassName KeyFactory
 * @Description 功能描述
 * @date 2019/2/14 10:53
 */
public class KeyFactory {

    public static String generateKey() {
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }

}
    