package edu.zhku.config;


import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * @author chujian
 * @ClassName CorsConfig
 * @Description 功能描述
 * @date 2019/2/28 11:25
 *
 * 跨域访问配置
 * 为了订单系统的安全性，这里对所有跨域的请求进行一个白名单的设置
 *
 * 白名单：
 * 登录系统：http://ip:10086
 */
@Configuration
public class CorsConfig{

    @Bean
    public FilterRegistrationBean corsFilter() {

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);

        // 设置你要允许的网站域名，如果全允许则设为 *
        //todo 限制跨域访问域名
        config.addAllowedOrigin("http://106.14.139.8:10086");
        //config.addAllowedOrigin("http://127.0.0.1:10086");
        //config.addAllowedOrigin("*");

        // 如果要限制 HEADER 或 METHOD 请自行更改
        config.addAllowedHeader("*");
        config.addAllowedMethod("*");
        source.registerCorsConfiguration("/**", config);
        FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));

        // 这个顺序很重要哦，为避免麻烦请设置在最前
        bean.setOrder(0);
        return bean;
    }


}
    