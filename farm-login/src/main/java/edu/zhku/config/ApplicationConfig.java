package edu.zhku.config;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author chujian
 * @ClassName ApplicationConfig
 * @Description 功能描述
 * @date 2019/2/13 10:02
 */
@SpringBootApplication
@Configuration
@ComponentScan(basePackages = "edu.zhku")     //扫描包
@ImportResource(locations = {"classpath:farm-login-config.xml"})
public class ApplicationConfig {


}

