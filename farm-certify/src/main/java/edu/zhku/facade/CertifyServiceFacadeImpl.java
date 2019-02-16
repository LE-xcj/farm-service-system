package edu.zhku.facade;

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
    public void certify(String mid) {

        try {
            certifyService.certify(mid);
        } catch (Exception e) {
            System.out.println("fail to invoke certify function");
            e.printStackTrace();
        }
    }

}
    