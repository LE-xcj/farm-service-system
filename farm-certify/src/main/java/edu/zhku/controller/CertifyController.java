package edu.zhku.controller;

import edu.zhku.pojo.Certification;
import edu.zhku.service.CertifyService;
import edu.zhku.util.CertifyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chujian
 * @ClassName CertifyController
 * @Description 功能描述
 * @date 2019/2/20 17:31
 */
@RestController
@RequestMapping("/certify")
public class CertifyController {

    @RequestMapping("/testInsert")
    public String testInsert(String mid, String url) throws Exception {
        Certification record = new Certification();
        record.setUrl(url);
        record.setMid(mid);
        int i = certifyService.insertRecord(record);
        return "hello " + i;
    }

    @Autowired
    private CertifyService certifyService;

    @RequestMapping("/certify")
    public String certify(String mid) throws Exception {
        certifyService.certify(mid);
        return "ok";
    }

    @RequestMapping("/testHttp")
    public boolean testHttp(String name) {
        boolean exsit = CertifyUtil.exsit(name);
        return exsit;
    }

}
    