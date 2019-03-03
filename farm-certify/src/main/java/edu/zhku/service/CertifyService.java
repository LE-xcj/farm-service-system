package edu.zhku.service;

import edu.zhku.pojo.Certification;

/**
 * @author chujian
 * @ClassName CertifyService
 * @Description 功能描述
 * @date 2019/2/16 15:38
 */
public interface CertifyService {

    int insertRecord(Certification certification) throws Exception;

    Certification select(Certification condtion) throws Exception;

    void certify(String mid) throws Exception;

}
    