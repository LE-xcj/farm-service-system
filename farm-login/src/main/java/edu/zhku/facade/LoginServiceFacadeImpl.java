package edu.zhku.facade;

import edu.zhku.service.LoginServiceFacade;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author chujian
 * @ClassName LoginServiceFacadeImpl
 * @Description 功能描述
 * @date 2019/2/19 16:56
 */

/**
 * 判断用户是否已经登录
 * 根据redis中是否登录的缓存来判断
 */
public class LoginServiceFacadeImpl implements LoginServiceFacade {

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public boolean isLogin(String id) {

        Object obj = redisUtil.get(id);

        if (null == obj)
            return false;
        return true;
    }
}
    