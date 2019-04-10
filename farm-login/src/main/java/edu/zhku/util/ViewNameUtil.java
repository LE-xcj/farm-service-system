package edu.zhku.util;

import edu.zhku.service.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author chujian
 * @ClassName ViewNameUtil
 * @Description 功能描述
 * @date 2019/4/10 16:24
 */
@Component
public class ViewNameUtil {

    @Autowired
    private MerchantService merchantService;

    /**
     * 设置视图的路径，如果没有认证就跳转到认证界面
     * @param mv
     * @param mid
     * @param destination
     * @throws Exception
     */
    public void setViewName(ModelAndView mv, String mid, String destination) throws Exception {

        boolean certify = merchantService.isCertify(mid);
        if (certify) {
            mv.setViewName(destination);
        } else {
            mv.setViewName("merchant/certify");
        }
    }
}
    