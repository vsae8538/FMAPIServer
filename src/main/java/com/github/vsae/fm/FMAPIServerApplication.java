package com.github.vsae.fm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.github.vsae"})
public class FMAPIServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(FMAPIServerApplication.class, args);
    }

}
