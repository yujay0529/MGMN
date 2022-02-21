package com.group7.MGMN;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
@SpringBootApplication
@ComponentScan(basePackages = {"com.group7.MGMN"})
@MapperScan(basePackages = {"com.group7.MGMN.dao"})
public class MgmnApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmnApplication.class, args);
	}

}
