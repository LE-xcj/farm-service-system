package edu.zhku.util;

import edu.zhku.constant.Role;

import java.util.Random;
import java.util.UUID;

/**
 * @author chujian
 * @ClassName KeyFactory
 * @Description 功能描述
 * @date 2019/2/14 10:53
 */
public class KeyFactory {

    public static String generateRoleKey(Role role) {
        String uuid = role.getPref() + UUID.randomUUID().toString();
        return uuid;
    }

    public static String generateVCode() {
        double random = Math.random() * 9000 + 1000;
        String code = "" + (int)Math.floor(random);
        return code;

    }

/*    public static void main(String[] args){
        for (int i =0; i<10; ++i) {
            System.out.println(generateVCode());
        }
    }*/

}
    