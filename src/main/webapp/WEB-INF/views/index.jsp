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
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
        <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
				
	function toMarket() {		// 중고거래 링크 접근과 동시에 ip => 주소 
		// ip 구하는 api 키
		// IP API 변경
		// let apiKey = 'e467b63698e3483a919b49c7ee41550f';
		
		$.getJSON("https://api.ipify.org?format=jsonp&callback=?", function (data) {
		// $.getJSON('https://ipgeolocation.abstractapi.com/v1/?api_key=' + apiKey, function (data) {
			console.log(data.ip);
			// console.log(data.ip_address);
			// ip 주소를 RestController 로 post => geolocation api 실행
			$.ajax({
				type: "post",
				url: "/location2",
				data: {
					ip: data.ip
					// ip: data.ip_address
				},
				dataType: "text",
				success: function(data) {
					location.href="/market/listRegionPost";
				},
				error: function(data, textStatus) {
					console.log(data);
					console.log(textStatus);
				}
			})
		});
	} 
</script>

        
    </head>
    <body data-spy="scroll" data-target="#main-navbar">
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
       
		
		<div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <div id="menubar" class="main-menu">	
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png" alt="" /></a>
                    </div>
      

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#home">Home<span class="sr-only">(current)</span></a></li>
                            <li><a href="#works-area">Service</a></li>
                            <li><a href="#our-team">About</a></li>
                            <li><a href="#our-portfolio">Portfolio</a></li>
                            <li><a href="#our-history">Academic</a></li>
                            <li><a href="#our-feature">Blog</a></li>
                            <li><a href="#">Contact Us</a></li>

                            <div class="contact-number text-right"> 
                                <ul><li class="">(+001122334)</li></ul>
                            </div>
      
		
  			<section>
			<div>
	         <a href="<c:url value='qnaList' />">qna페이지</a><br><br>
	         <a href="<c:url value='noticeList' />"> 공지사항 </a><br><br>
	         <a href="<c:url value='shops' />">동네 샵정보</a><br><br>
	         <a href="javascript:toMarket();">중고거래 페이지 </a><br><br>
			 </div>
			</section>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <!--Home page style-->
        <header id="home" class="sections">
            <div class="container">

                <div class="row">
                    <div class="homepage-style">

                        <div class="top-arrow hidden-xs text-center"><img src="assets/images/top-arrow.png" alt="" /></div>

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="unique-apps">
                                <h2>UNIQUE-TECH<br>APP DEVELOPMENT </h2>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco. 
                                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit. 
                                </p>

                                <div class="home-btn"><button class="btn btn-primary">View More <span><i class="fa fa-paper-plane"></i></span></button></div>
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
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/slider-img.png" alt="" />
                                        </div>

                                        <div class="item">
                                            <img src="assets/images/slider-img.png" alt="" />
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

       

        <section id="our-feature" class="sections">
            <div class="container">
                <div class="heading">
                    <div class="title text-center arrow-left">
                        <img class="hidden-xs" src="assets/images/left-arrow.png" alt="" />

                        <h4 class="">Our Features</h4>
                    </div>
                </div>

                <div class="feature-wrapper">
                    <div class="row">

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content active"> 
                                <h4><i class="fa fa-database"></i><span>Visual Composer</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Responsive</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="features-content"> 
                                <h4><i class="fa fa-database"></i><span>Retina Ready</span></h4>
                                <p>orem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla</p>
                            </div>
                        </div>
                    </div>	
                </div>		


            </div>


        </section>

        

        <section id="our-history" class="sections">
            <div class="container">

                <div class="row">

                    <div class="main-history">

                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="history-img">
                                <img src="assets/images/history-img.png" alt="" />
                            </div>
                        </div>



                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="history-wrapper">
                                <div class="history-heading"> 
                                    <h5 class="our-history">Our History</h5>
                                </div>

                                <div class="history-content">
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
                                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est. laboru
                                    </p>

                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
                                        consequat.
                                    </p>

                                    <div class="hst-btn"><button class="btn btn-primary">BROWSE OUR HISTORY</button></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="our-project" class="sections">
            <div class="container">

                <div class="heading">
                    <div class="title text-center arrow-left">

                        <h4 class="">Our Business Project</h4>
                        <img class="hidden-xs" src="assets/images/right-arrow.png" alt="" />
                    </div>
                </div>

                <div class="row">


                    <div class="main-project text-center">

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/1.png" alt="" /></div>
                                <h5>TECHNICAL AID</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/2.png" alt="" /></div>
                                <h5>SECURE ACCESS</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/3.png" alt="" /></div>
                                <h5>MARKET RESERCH</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/4.png" alt="" /></div>
                                <h5>CREDIT RESERCH</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/5.png" alt="" /></div>
                                <h5>TECHNICAL AID</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/6.png" alt="" /></div>
                                <h5>TECHNICAL AID</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/7.png" alt="" /></div>
                                <h5>TECHNICAL AID</h5>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="project-item">
                                <div class="project-photo"><img src="assets/images/projects/8.png" alt="" /></div>
                                <h5>TECHNICAL AID</h5>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
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

        <section id="our-supports" class="sections">
            <div class="container">

                <div class="heading">
                    <div class="title text-center arrow-left">

                        <h4 class="">Updates & Support</h4>
                        <img class="hidden-xs" src="assets/images/right-arrow.png" alt="" />
                    </div>
                </div>

                <!-- Example row of columns -->
                <div class="row">


                    <div class="col-sm-6 col-xs-12">
                        <div class="supports-content">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est. laboru
                            </p>
                            <div class="spt-btn"><button class="btn btn-primary">SUPPORT CENTER</button></div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xs-12">
                        <div class="supports-img"><img class="img-responsive" src="assets/images/monitor.png" alt="" /></div>
                    </div>


                </div>

            </div> <!-- /container -->       
        </section>

        <section id="hire-us" class="sections">

            <div class="container">

                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="hire-content">
                            <div class="img-overlay">

                                <div class="creative-works">
                                    <h3>NEED CREATIVE WORKERS?</h3>
                                    <button class="btn hire-btn btn-primary">HIRE US</button>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </div> <!-- /container -->  

        </section>

        <div class="scroll-top">

            <div class="scrollup">
                <i class="fa fa-angle-double-up"></i>
            </div>

        </div>

        <!--Footer-->
        <footer id="footer" class="footer">
            <div class="container">

                <div class="row">
                    <div class="main-footer">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>PORTFOLIO</h2>
                                <ul>
                                    <li><a href="#">Web Design</a></li>
                                    <li><a href="#">Brand & Identity</a></li>
                                    <li><a href="#">Mobile Design</a></li>
                                    <li><a href="#">Print</a></li>
                                    <li><a href="#">User Interface</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>ABOUT</h2>
                                <ul>
                                    <li><a href="#">The Company</a></li>
                                    <li><a href="#">History</a></li>
                                    <li><a href="#">Vision</a></li>

                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>GALLERY</h2>
                                <ul>
                                    <li><a href="#">lickr</a></li>
                                    <li><a href="#">Picasa</a></li>
                                    <li><a href="#">iStockPhoto</a></li>
                                    <li><a href="#">PhotoDune</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>CONTACT</h2>
                                <ul>
                                    <li><a href="#">Basic Info</a></li>
                                    <li><a href="#">Map</a></li>
                                    <li><a href="#">Conctact Form</a></li>

                                </ul>
                            </div>
                        </div>

                    </div>

                    <div class="socio-copyright">

                        <div class="social">
                            <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-linkedin"></i></a>
                        </div>

                        <p>Made with <i class="fa fa-heart"></i> by <a target="_blank" href="http://bootstrapthemes.co"> Bootstrap Themes </a>2016. All rights reserved.</p>
                    </div>

                </div>	
            </div>

        </footer>


        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
