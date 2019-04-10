package edu.zhku.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @author chujian
 * @ClassName FileUtil
 * @Description 功能描述
 * @date 2019/2/28 9:55
 */
public class FileUtil {

    //到生产环境要变
    //private static final String PATH = "D:/BaiduYunDownload/picture/";
    private static final String PATH = "/zhku/resources/picture/";

    private static final String URL =  "http://106.14.139.8/picture/";

    public static String saveImg(MultipartFile file, String pre) throws IOException {

        //获取后缀
        String originName = file.getOriginalFilename();
        String suffix = originName.substring(originName.lastIndexOf("."), originName.length());

        //新的文件名
        String fileName = KeyFactory.generateKey();

        //全路径
        String path = PATH + pre + fileName + suffix;

        //保存
        File img = new File(path);
        file.transferTo(img);

        //拼接url，文件的url
        String url = URL + pre + fileName + suffix;

        return url;
    }
}
    