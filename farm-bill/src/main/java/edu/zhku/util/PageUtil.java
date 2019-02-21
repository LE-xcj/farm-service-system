package edu.zhku.util;

/**
 * @author chujian
 * @ClassName PageUtil
 * @Description 功能描述
 * @date 2019/2/21 12:38
 */
public class PageUtil {

    public static int count(int total, int size) {

        int totalPage = total / size;

        if (total % size != 0) {
            ++totalPage;
        }

        return totalPage;
    }

}
    