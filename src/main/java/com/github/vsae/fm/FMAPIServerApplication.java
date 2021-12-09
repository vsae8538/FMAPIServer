package com.github.vsae.fm;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan(basePackages = "com.github.vsae" , annotationClass = Mapper.class)
@ComponentScan({"com.github.vsae"})
public class FMAPIServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(FMAPIServerApplication.class, args);
    }

}
