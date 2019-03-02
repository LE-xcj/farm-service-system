package edu.zhku.service;

/**
 * @author chujian
 * @ClassName CertifyServiceFacade
 * @Description 功能描述
 * @date 2019/2/16 17:54
 */
public interface CertifyServiceFacade {


    int insertRecord(String mid, String url);

    void certify(String mid);

}
