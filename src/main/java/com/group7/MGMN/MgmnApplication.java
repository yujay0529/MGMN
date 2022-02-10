package com.group7.MGMN;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.group7.MGMN.controller.HomeController;
import com.group7.MGMN.controller.MemberController;
import com.group7.MGMN.dao.IMemberDAO;

@SpringBootApplication
@ComponentScan(basePackageClasses = HomeController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = IMemberDAO.class)

public class MgmnApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmnApplication.class, args);
	}

}
