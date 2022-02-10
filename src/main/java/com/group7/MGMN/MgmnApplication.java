package com.group7.MGMN;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.group7.MGMN.controller.HomeController;
@ComponentScan(basePackageClasses = HomeController.class)
@SpringBootApplication
public class MgmnApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmnApplication.class, args);
	}

}
