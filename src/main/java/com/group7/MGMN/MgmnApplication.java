package com.group7.MGMN;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.group7.MGMN.controller.HomeController;
import com.group7.MGMN.controller.MarketCommentController;
import com.group7.MGMN.controller.MarketController;
import com.group7.MGMN.controller.MarketRestController;
import com.group7.MGMN.controller.MemberController;
import com.group7.MGMN.controller.QnACommentController;
import com.group7.MGMN.controller.QnAController;
import com.group7.MGMN.controller.ShopController;
import com.group7.MGMN.controller.ShopRestController;
import com.group7.MGMN.dao.IMarketCommentDAO;
import com.group7.MGMN.dao.IMarketDAO;
import com.group7.MGMN.dao.IMemberDAO;
import com.group7.MGMN.dao.IQnACommentDAO;
import com.group7.MGMN.dao.IQnADAO;
import com.group7.MGMN.dao.IShopDAO;
@SpringBootApplication
@ComponentScan(basePackageClasses = HomeController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@ComponentScan(basePackageClasses = QnAController.class)
@ComponentScan(basePackageClasses = MarketController.class)
@ComponentScan(basePackageClasses = QnACommentController.class)
@ComponentScan(basePackageClasses = MarketCommentController.class)
@ComponentScan(basePackageClasses = ShopController.class)
@ComponentScan(basePackageClasses = ShopRestController.class)
@ComponentScan(basePackageClasses = MarketRestController.class)
@MapperScan(basePackageClasses = IMemberDAO.class)
@MapperScan(basePackageClasses = IQnADAO.class)
@MapperScan(basePackageClasses = IMarketDAO.class)
@MapperScan(basePackageClasses = IQnACommentDAO.class)
@MapperScan(basePackageClasses = IMarketCommentDAO.class)
@MapperScan(basePackageClasses = IShopDAO.class)
@ComponentScan(basePackages = {"com.group7.MGMN"})

public class MgmnApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmnApplication.class, args);
	}

}
