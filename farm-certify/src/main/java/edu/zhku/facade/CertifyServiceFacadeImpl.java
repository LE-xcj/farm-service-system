package edu.zhku.facade;

import edu.zhku.constant.Status;
import edu.zhku.pojo.Certification;
import edu.zhku.service.CertifyService;
import edu.zhku.service.CertifyServiceFacade;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author chujian
 * @ClassName CertifyServiceFacadeImpl
 * @Description 功能描述
 * @date 2019/2/16 17:55
 */
public class CertifyServiceFacadeImpl implements CertifyServiceFacade{

    @Autowired
    private CertifyService certifyService;

    @Override
    public int insertRecord(String mid, String url) {
        Certification record = new Certification();
        record.setMid(mid);
        record.setUrl(url);
        int num = 0;
        try {
            num = certifyService.insertRecord(record);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public String getUrl(String mid) {

        Certification condition = new Certification();
        condition.setMid(mid);
        condition.setStatus(Status.CERTIFYSUCCESS);

        String url = null;
        try {
            Certification result = certifyService.select(condition);

            if (result != null) {
                url = result.getUrl();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return url;
    }

    @Override
    public void certify(String mid) {

        try {
            certifyService.certify(mid);
        } catch (Exception e) {
            System.out.println("fail to invoke certify function");
            e.printStackTrace();
        }
    }

}
    