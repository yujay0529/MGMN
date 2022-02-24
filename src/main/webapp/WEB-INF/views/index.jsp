<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       

        
    </head>
    <body data-spy="scroll" data-target="#main-navbar">
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
       
		
		<div class='preloader'><div class='loaded'>&nbsp;</div></div>
		
       <!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
        <!--Home page style-->
        <header id="home" class="sections">
            <div class="container">

                <div class="row">
                    <div class="homepage-style">

    

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="unique-apps">
                                <h2>물어볼개🐶<br>무엇이냥😺 </h2>
                                <p>
                        		   커져가는 반려동물 시장! 보호자에게는 집 근처 나와 우리 아이에게 딱 맞는 정보가 필요하다!<br>

									반려동물을 키우는 사람들을 위해 사용자의 위치를 기반으로 거주지 근처 시설들을 추천하고 <br>실사용자들의 후기를 공유하는 플랫폼
                                </p>

                                <div class="home-btn"><button class="btn btn-primary" style="color:white;">
                                <a href="https://github.com/yujay0529/MGMN">View More <span><i class="fa fa-paper-plane"></i></span></a></button></div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="slider-area">

                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
                                    <!-- Indicators -->
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>

                                    </ol>

                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">

                                        <div class="item active">
                                            <img src="assets/images/cat1.jpeg" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/dog1.jpeg" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/dog2.jpeg" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/cat2.jpeg" alt="" />
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>	
                </div>

            </div>

        </header>

        <!-- Sections -->
        <section id="our-portfolio" class="sections">
            <div class="container">

                <div class="row">
                    <div class="heading">
                        <div class="title text-center arrow-right">
                            <h4 class="">WHAT WE DO </h4>
                            <img class="hidden-xs" src="assets/images/right-arrow.png" alt="" />

                        </div>
                    </div>	


                    <!-- Example row of columns -->

                    <div class="portfolio-wrap">

                        <div class="portfolio">

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img src="assets/images/monitor.png" alt="" />
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="portfolio-item">
                                    <h4>WEB DESIGN</h4>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
                                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est. laboru
                                    </p>
                                    <button class="btn pt-btn btn-primary">View More</button>
                                </div>
                            </div>

                        </div>



                        <div class="portfolio">

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="portfolio-item">
                                    <h4>SEARCH ENGINE OPTIMIZATION</h4>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
                                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est. laboru
                                    </p>
                                    <button class="btn pt-btn btn-primary">View More</button>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img class="portfolio-img img-responsive" src="assets/images/monitor.png" alt="" />
                            </div>

                        </div>



                        <div class="portfolio">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img class="portfolio-img img-responsive" src="assets/images/monitor.png" alt="" />
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="portfolio-item">
                                    <h4>AFFILIATE MARKETING</h4>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
                                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est. laboru
                                    </p>
                                    <button class="btn pt-btn btn-primary">View More</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- /container -->       
        </section>

       

        
        

       
      
        <section id="our-team" class="sections">
            <div class="container">

                <div class="heading">
                    <div class="title text-center arrow-left">
                        <img class="hidden-xs" src="assets/images/left-arrow.png" alt="" />

                        <h4 class="">Our Team Members</h4>
                    </div>
                </div>
            </div>

            <div class="container-fluid project-bg">
                <div class="row">

                    <div class="main-team text-center">

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="team-member">

                                <img class="img-circle" src="assets/images/team/1.png" alt="" />
                                <h5>SAYED MIRAJ</h5>
                                <p>UI & UX DESIGNER</p>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="team-member">
                                <img class="img-circle" src="assets/images/team/2.png" alt="" />
                                <h5>PENNY HUSTON</h5>
                                <p>DEVELOPER</p>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="team-member">
                                <img class="img-circle" src="assets/images/team/3.png" alt="" />
                                <h5>LENNERD SHELLY</h5>
                                <p>REVIEWER</p>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="team-member">
                                <img class="img-circle" src="assets/images/team/4.png" alt="" />
                                <h5>SHELDON CUPPER</h5>
                                <p>MARKETTER</p>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>


        <div class="scroll-top">

            <div class="scrollup">
                <i class="fa fa-angle-double-up"></i>
            </div>

        </div>

    
        <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
    </body>
</html>
