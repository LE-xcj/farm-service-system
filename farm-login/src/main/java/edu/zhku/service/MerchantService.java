package edu.zhku.service;

import edu.zhku.pojo.Merchant;
import edu.zhku.vo.CodeVo;
import edu.zhku.vo.MerchantVo;

import java.util.List;

/**
 * @author chujian
 * @ClassName MerchantService
 * @Description 功能描述
 * @date 2019/2/13 12:26
 */
public interface MerchantService {

    CodeVo login(Merchant merchant) throws Exception;

    CodeVo registe(Merchant merchant, String vCode, String realCode) throws Exception;

    Merchant selectById(String mid) throws Exception;
    List<Merchant> selectByCondition(Merchant condition) throws Exception;

    CodeVo updateMerchant(Merchant merchant) throws Exception;

    List<Merchant> queryByAddress(String address) throws Exception;

    boolean isCertify(String mid) throws Exception;


    CodeVo updatePsw(MerchantVo vo) throws Exception;

    CodeVo updatePhone(Merchant merchant) throws Exception;

    List<Merchant> queryMerchantByIds(List<String> mids) throws Exception;

}
