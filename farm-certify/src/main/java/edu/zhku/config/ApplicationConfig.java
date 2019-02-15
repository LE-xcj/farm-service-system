package edu.zhku.config;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author chujian
 * @ClassName ApplicationConfig
 * @Description 功能描述
 * @date 2019/2/15 23:39
 */
@SpringBootApplication
@Configuration
@ComponentScan(basePackages = "edu.zhku")     //扫描包
public class ApplicationConfig {
}
    