package com.group7.MGMN;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.group7.MGMN"})
@MapperScan(basePackages = {"com.group7.MGMN.dao"})


// import com.group7.MGMN.controller.BoardController;
// import com.group7.MGMN.controller.HomeController;
// import com.group7.MGMN.controller.MemberController;
// import com.group7.MGMN.controller.QnACommentController;
// import com.group7.MGMN.controller.QnAController;
// import com.group7.MGMN.dao.IBoardDAO;
// import com.group7.MGMN.dao.IMemberDAO;
// import com.group7.MGMN.dao.IQnACommentDAO;
// import com.group7.MGMN.dao.IQnADAO;
// @SpringBootApplication
// @ComponentScan(basePackageClasses = HomeController.class)
// @ComponentScan(basePackageClasses = MemberController.class)
// @ComponentScan(basePackageClasses = QnAController.class)
// @ComponentScan(basePackageClasses = QnACommentController.class)
// @ComponentScan(basePackageClasses=BoardController.class)
// @MapperScan(basePackageClasses = IMemberDAO.class)
// @MapperScan(basePackageClasses = IQnADAO.class)
// @MapperScan(basePackageClasses = IQnACommentDAO.class)
// @MapperScan(basePackageClasses = IBoardDAO.class)

public class MgmnApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmnApplication.class, args);
	}

}
