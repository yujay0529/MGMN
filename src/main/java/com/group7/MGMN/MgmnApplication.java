package com.group7.MGMN;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.group7.MGMN.controller.HomeController;
import com.group7.MGMN.controller.QnAController;
import com.group7.MGMN.dao.IQnADAO;
@ComponentScan(basePackageClasses = HomeController.class)
@ComponentScan(basePackageClasses = QnAController.class)
@MapperScan(basePackageClasses = IQnADAO.class)
@SpringBootApplication
public class MgmnApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmnApplication.class, args);
	}

}
