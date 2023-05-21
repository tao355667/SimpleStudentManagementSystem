package org.example;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.example.mapper")//让启动类扫描org.example包里的mapper接口
public class Application {/*Application启动类*/

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}