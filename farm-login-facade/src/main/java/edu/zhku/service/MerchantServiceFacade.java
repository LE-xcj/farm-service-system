package edu.zhku.service;

/**
 * @author chujian
 * @ClassName MerchantServiceFacade
 * @Description 功能描述
 * @date 2019/2/16 21:19
 */
public interface MerchantServiceFacade {

    /**
     * 更新merchant
     * @param merchant  json字符串
     * @return     影响的记录
     */
    int updateMerchantSelectedById(String merchant);


    String queryMerchantByAddress(String address);

    String queryMerchantById(String mid);

    /**
     * 根据id集合查询
     * @param mids
     * @return
     */
    String queryMerchantByIds(String mids);

}
