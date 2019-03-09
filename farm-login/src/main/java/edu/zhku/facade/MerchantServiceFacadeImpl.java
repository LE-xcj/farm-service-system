package edu.zhku.facade;

import com.alibaba.fastjson.JSON;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.MerchantService;
import edu.zhku.service.MerchantServiceFacade;
import edu.zhku.vo.CodeVo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author chujian
 * @ClassName MerchantServiceFacadeImpl
 * @Description 功能描述
 * @date 2019/2/16 21:34
 */
public class MerchantServiceFacadeImpl implements MerchantServiceFacade {

    @Autowired
    private MerchantService merchantService;

    @Override
    public int updateMerchantSelectedById(String merchant) {

        Merchant m = JSON.parseObject(merchant, Merchant.class);

        int flag = 0;
        try {
            CodeVo codeVo = merchantService.updateMerchant(m);
            flag = codeVo.getCode();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public String queryMerchantByAddress(String address) {


        String data = null;
        try {
            List<Merchant> merchants = merchantService.queryByAddress(address);
            data = JSON.toJSONString(merchants);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

    @Override
    public String queryMerchantById(String mid) {
        String data = null;
        try {
            Merchant merchant = merchantService.selectById(mid);
            data = JSON.toJSONString(merchant);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    /**
     * 批量查询merchant
     *
     * @param ids
     * @return
     */
    @Override
    public String queryMerchantByIds(String ids) {

        List<String> mids = JSON.parseArray(ids, String.class);

        String data = null;
        try {
            List<Merchant> merchants = merchantService.queryMerchantByIds(mids);
            data = JSON.toJSONString(merchants);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }
}
    