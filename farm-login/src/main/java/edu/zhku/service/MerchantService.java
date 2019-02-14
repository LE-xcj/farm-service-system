package edu.zhku.service;

import edu.zhku.pojo.Merchant;
import edu.zhku.vo.CodeVo;

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

}