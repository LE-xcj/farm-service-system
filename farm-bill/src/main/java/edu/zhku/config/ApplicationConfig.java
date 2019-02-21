package edu.zhku.config;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author chujian
 * @ClassName ApplicationConfig
 * @Description 功能描述
 * @date 2019/2/17 17:24
 */
@SpringBootApplication
@Configuration
@ComponentScan(basePackages = "edu.zhku")     //扫描包
@ImportResource(locations = "classpath:farm-bill-config.xml")
public class ApplicationConfig {
}
    