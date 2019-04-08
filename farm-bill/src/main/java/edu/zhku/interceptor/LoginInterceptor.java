package edu.zhku.interceptor;

import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author chujian
 * @ClassName LoginInterceptor
 * @Description 功能描述
 * @date 2019/3/27 10:24
 *
 * 登录拦截器
 * 过程：
 *  拦截部分注册的url，获取拦截的http请求的自定义请求头（token和signture）
 *  然后与redis那边记录的登录信息进行匹配
 *
 * 拦截规则：
 * 1、获取signature字段
 *  1.1、为null，重定向到erro
 *  1.2、进入2
 *
 * 2、获取token字段
 *  2.1、用signature作为key，从redis那边获取对应的value信息（sessionId）
 *  2.2、value为null，重定向erro，否则进入3
 *
 * 3、判断value的信息与token字段信息是否匹配
 *  3.1、是，代表是同一个登录者
 *  3.2、否，不是同一个登录者，存在登录安全问题，跳转
 *
 */
public class LoginInterceptor implements HandlerInterceptor {


    @Autowired
    private RedisUtil redisUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        //session的id
        String token = request.getHeader("token");

        //登录的id
        String signature = request.getHeader("signature");

        if (null != signature) {
            Object value = redisUtil.get(signature);
            //是否已经登录 && 请求的是否登录者
            if (null != value && value.equals(token)) {
                return true;
            }
        }


        
        //response.sendRedirect("http://106.14.139.8/normal/html/loginErro.html");
        response.getWriter().write("unLogin");
        return false;
    }
}
    