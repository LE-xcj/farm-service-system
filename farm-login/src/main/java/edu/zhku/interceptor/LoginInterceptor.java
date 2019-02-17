package edu.zhku.interceptor;

import edu.zhku.constant.MyDuration;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author chujian
 * @ClassName LoginInterceptor
 * @Description 功能描述
 * @date 2019/2/15 11:23
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private RedisUtil redisUtil;

    //在请求处理之前进行调用Controller方法调用之前
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        System.out.println("preHandle被调用");

        //根据url上的路径辨别请求角色
        String[] path = request.getServletPath().split("/");
        String role = path[1];

        //获取服务器这边设置的属性
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute(role);

        //判断是否已经在某个客户端登录了
        if (null != id){

            String key = id;

            //获取redis那边的信息
            Object value = redisUtil.get(key);

            //再从redis获取，判断session是否已经过期了
            if(value != null) {

                //更新保存时长
                redisUtil.set(key, value, MyDuration.LOGINALIVE);
                return true;    //如果false，停止流程，api被拦截

            }

        }


        String redirectPath = request.getContextPath() + "/" + role + "/signIn";
        response.sendRedirect(redirectPath);
        return false;
    }


    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }


}
    