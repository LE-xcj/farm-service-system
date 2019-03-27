package edu.zhku.config;

import edu.zhku.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author chujian
 * @ClassName WebMvcConfig
 * @Description 功能描述
 * @date 2019/3/27 10:26
 *
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    /**
     * @return 登录验证拦截器
     * 自定义登录验证拦截器
     */
    @Bean
    public LoginInterceptor loginInterceptor() {
        return new LoginInterceptor();
    }


    /**
     * @param registry 配置静态资源放行
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    /**
     * @param registry 添加拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //添加登录处理拦截器，拦截所有请求，登录请求除外
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(loginInterceptor());

        //排除配置
        interceptorRegistration.excludePathPatterns("/item/queryItemByPage");
        interceptorRegistration.excludePathPatterns("/item/queryItemForMerchant");
        interceptorRegistration.excludePathPatterns("/item/queryItemById");
        interceptorRegistration.excludePathPatterns("/item/evaluate");
        interceptorRegistration.excludePathPatterns("/item/evaluateForList");
        interceptorRegistration.excludePathPatterns("/item/queryEvaluation");
        interceptorRegistration.excludePathPatterns("/item/countItemComplete");
        interceptorRegistration.excludePathPatterns("/item/topItem");
        interceptorRegistration.excludePathPatterns("/item/topMerchant");
        interceptorRegistration.excludePathPatterns("/item/queryEvaluationByBid");
        interceptorRegistration.excludePathPatterns("/bill/queryBillItemByBid");



        //配置拦截策略
        interceptorRegistration.addPathPatterns("/**");
//        interceptorRegistration.addPathPatterns("/item/addItem");
//        interceptorRegistration.addPathPatterns("/item/updateItem");
//        interceptorRegistration.addPathPatterns("/item/updateItemStatus");
//
//        interceptorRegistration.addPathPatterns("/item/addItemToshoppingCard");
//        interceptorRegistration.addPathPatterns("/item/removeItemFromShoppingCard");
//        interceptorRegistration.addPathPatterns("/item/shoppingCardList");


    }
}
    