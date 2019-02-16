package edu.zhku.service.impl;

import edu.zhku.constant.Content;
import edu.zhku.constant.Count;
import edu.zhku.constant.Role;
import edu.zhku.constant.Status;
import edu.zhku.mapper.CertificationMapper;
import edu.zhku.pojo.Certification;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.CertifyService;
import edu.zhku.service.MerchantServiceFacade;
import edu.zhku.service.NotifyServiceFacade;
import edu.zhku.util.CertifyUtil;
import edu.zhku.util.OCRUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chujian
 * @ClassName CertifyServiceImpl
 * @Description 功能描述
 * @date 2019/2/16 15:39
 */
@Service
public class CertifyServiceImpl implements CertifyService {

    @Autowired
    CertificationMapper mapper;

    @Override
    public void certify(String mid) throws Exception {

        //创建一个查询条件
        Certification condition = new Certification();
        condition.setMid(mid);
        condition.setStatus(Status.UNCERTIFY);



        List<Certification> list = mapper.selecetByCondition(condition);
        //遍历当前商户所有未认证的请求
        for (Certification c : list) {

            //商户上传的经营许可图片
            String url = c.getUrl();

            //提取公司名称
            String name = tryGetName(url);

            //第一步，图片是否能够识别并提取公司名称
            //能够提取
            if (isNotNull(name)) {

                //第二步，调用无人机经营查询接口
                boolean exsit = CertifyUtil.exsit(name);

                if (exsit) {
                    c.setStatus(Status.CERTIFYSUCCESS);
                    mapper.updateByPrimaryKeySelective(c);

                    //更新商户的认证状态
                    updateMerchant(mid);

                    //通知认证成功
                    notifyMerchant(mid, true);
                    break;
                }

            } else {

                //更新数据库
                c.setStatus(Status.CERTIFYFAIL);
                mapper.updateByPrimaryKeySelective(c);

                //通知，认证失败
                notifyMerchant(mid, false);
            }

            //下一条
        }

    }


    @Autowired
    private MerchantServiceFacade merchantServiceFacade;

    /**
     * 更新merchant的认证状态为1
     * @param mid
     */
    private void updateMerchant(String mid) {

        Merchant merchant = new Merchant();
        merchant.setMid(mid);
        merchant.setIsverify(1);

        //将对象转为json字符串
        JSONObject jo = new JSONObject(merchant);
        String jso = jo.toString();

        //调用登录系统的更新接口
        int flag = merchantServiceFacade.updateMerchantSelectedById(jso);

    }


    @Autowired
    private NotifyServiceFacade notifyServiceFacade;

    /**
     * 调用消息系统的通知服务,通知商户认证情况
     * @param mid
     */
    private void notifyMerchant(String mid, boolean success) {

        String role = Role.MERCHANT.getPref();
        System.out.println(mid + " 认证 " + success);

        String content = null;
        if (success) {
            content = Content.CERTIFYSUCCESS;
        } else {
            content = Content.CERTIFYFAIL;
        }

        //调用消息系统的接口
        notifyServiceFacade.notify(role, mid, content);
    }


    /**
     * 尝试获取图片中的公司名称
     *
     * 有两种方式：
     * 这里使用容错机制：
     *      先使用普通识别，再使用高精度识别
     *      每种方式最多尝试三次
     *
     * @param url   识别图片的url
     * @return      公司名称，失败返回null
     */
    private String tryGetName(String url) {

        if (null == url) {
            return null;
        }

        int count = 0;

        //使用普通的OCR进行识别提取
        while (count < Count.TIME) {

            //获取识别数据
            String data = OCRUtil.normalCertify(url);

            //提取公司名称
            String name = OCRUtil.getName(data);

            //能够提取名字
            if (isNotNull(name)) {
                return name;
            }

            ++count;
        }

        count = 0;
        //使用高精度识别
        while (count < Count.TIME) {

            String data = OCRUtil.preciseCertify(url);
            String name = OCRUtil.getName(data);

            if (isNotNull(name)) {
                return name;
            }

            ++count;
        }

        return null;
    }

    private boolean isNotNull(String name) {
        if (name != null) {
            return true;
        }
        return false;
    }

}
    