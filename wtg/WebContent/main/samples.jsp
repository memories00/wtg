<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>Barrier- A responsive portfolio and business template</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <!-- CSS
  ================================================== -->
    <!-- Bootstrap -->
    <link href="sample/assets/css/bootstrap.min.css" rel="stylesheet">
     <!-- Prettyphoto -->
	<link rel="stylesheet" href="sample/css/prettyPhoto.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="sample/css/font-awesome.min.css">
    <!--Line icon font -->
    <link rel="stylesheet" href="sample/css/line-icons.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="sample/css/animate.css">
    <!-- Prettyphoto -->
    <link rel="stylesheet" href="sample/css/prettyPhoto.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="sample/css/style.css">
    <!-- color style -->
    <link rel="stylesheet" href="sample/css/presets/maincolor.css">
    <!-- Responsive styles-->
    <link rel="stylesheet" href="sample/css/responsive.css">
    <!-- circle counter -->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <!-- script ================================================================= -->
	<script>
		function locationHref(a) {
			var ty = a.getAttribute("id");
			location.href="/wtg/themeList.nhn?cate="+ty;
		}
		function goHome()
		{
			window.location="/wtg/main.nhn";
		}
	</script>
  </head>
  <body>
    
    <!-- main coding strat -->
    <header id="header" >
    	<nav class="navbar navbar-default navbar-fixed-top"  id="tf-menu">
    	<div class="container">
    		<div class="row">
    			<div class="navbar-header ">
    				<button class="navbar-toggle collapsed" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse">
    					<span class="sr-only"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    				</button>
    				<a href="#" class="navbar-brand page-scroll">I SEOUL GA U</a>
    			</div> <!-- navabr-header -->

    			<div class="collapse navbar-collapse clearfix" id="bs-example-navbar-collapse-1" role="navigation">
    				<ul class="nav navbar-nav navbar-right">
						<li id="all" onClick="locationHref(this);" style="cursor:hand;"><a>전체보기</a></li>
						<li id="관광명소" onClick="locationHref(this);" style="cursor:hand;"><a>관광명소</a></li>
						<li id="데이트" onClick="locationHref(this);" style="cursor:hand;"><a>데이트</a></li>
						<li id="스포츠" onClick="locationHref(this);" style="cursor:hand;"><a>스포츠</a></li>
						<li id="쇼핑" onClick="locationHref(this);" style="cursor:hand;"><a>쇼핑</a></li>
						<li id="추천코스" onClick="locationHref(this);" style="cursor:hand;"><a>추천코스</a></li>
						<li id="장소별검색" onClick="locationHref(this);" style="cursor:hand;"><a>장소별검색</a></li>
    				</ul>
    			</div>
    		</div> <!-- row end -->
    	</div> <!-- container end -->
    	</nav> <!-- nav end -->
    </header>

	<!-- main slider start -->
	<section id="slider" class="slider">
		<div class="overlay"></div>
		<div id="main-slide" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators visible-lg visible-md">
			  	<li data-target="#main-slide" data-slide-to="0" class="active"></li>
			    <li data-target="#main-slide" data-slide-to="1"></li>
			    <li data-target="#main-slide" data-slide-to="2"></li>
			</ol><!--/ Indicators end-->
			
			<!-- Carousel inner -->
			<div class="carousel-inner">
			    <div class="item active">
			    	<img class="img-responsive" src="sample/images/slider/bg1.jpg" alt="slider">
			    </div><!--/ Carousel item end -->

			    <div class="item">
			    	<img class="img-responsive" src="sample/images/slider/bg2.jpg" alt="slider">
			    </div><!--/ Carousel item end -->
			    
			    <div class="item">
			    	<img class="img-responsive" src="sample/images/slider/bg3.jpg" alt="slider">
			    </div><!--/ Carousel item end -->
			</div><!-- Carousel inner end-->
			
			<!-- Controllers -->
			<a class="left carousel-control" href="#main-slide" data-slide="prev">
		    	<span><i class="fa fa-angle-left"></i></span>
			</a>
			<a class="right carousel-control" href="#main-slide" data-slide="next">
		    	<span><i class="fa fa-angle-right"></i></span>
			</a>
		</div><!--/ Carousel end --> 

	</section>
	<!-- main slider end -->

	<!-- Service section Start -->

	<section id="service" class="service">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">Search</h3>
						</div>
						<input type="text" name="search" style="width:80%;">&nbsp;<input type="button" value="검색" onClick="test_Search()">
					</div>
				</div>
			</div>
<!-- 
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" data-wow-delay=".2s">
					<div class="service-desc">
						<div class="icon-box color">
							<i class="icon icon-tablet"></i>
						</div>
						<div class="service-content ">
							<h4>Responsive Web design</h4>
							<span>Desktop, laptop,mobile view</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, vitae. Earum libero repellat excepturi in, deserunt, hic voluptatem placeat tenetur neque ullam sit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" data-wow-delay=".5s">
					<div class="service-desc">
						<div class="icon-box color">
							<i class="icon icon-desktop"></i>
						</div>
						<div class="service-content">
							<h4>Web development</h4>
							<span>Desktop, laptop,mobile view</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, vitae. Earum libero repellat excepturi in, deserunt, hic voluptatem placeat tenetur neque ullam sit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" data-wow-delay=".8s">
					<div class="service-desc">
						<div class="icon-box color">
							<i class="icon icon-tools"></i>
						</div>
						<div class="service-content">
							<h4>graphics design</h4>
							<span>Desktop, laptop,mobile view</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, vitae. Earum libero repellat excepturi in, deserunt, hic voluptatem placeat tenetur neque ullam sit.</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" data-wow-delay="1.1s">
					<div class="service-desc">
						<div class="icon-box color">
							<i class="icon icon-puzzle"></i>
						</div>
						<div class="service-content">
							<h4> Socail marketing</h4>
							<span>Desktop, laptop,mobile view</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, vitae. Earum libero repellat excepturi in, deserunt, hic voluptatem placeat tenetur neque ullam sit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" data-wow-delay="1.4s">
					<div class="service-desc">
						<div class="icon-box color">
							<i class="icon icon-megaphone"></i>
						</div>
						<div class="service-content">
							<h4> Online marketing</h4>
							<span>Desktop, laptop,mobile view</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, vitae. Earum libero repellat excepturi in, deserunt, hic voluptatem placeat tenetur neque ullam sit.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" data-wow-delay="1.8s">
					<div class="service-desc">
						<div class="icon-box color">
							<i class="icon icon-basket "></i>
						</div>
						<div class="service-content">
							<h4> Barnding </h4>
							<span>Desktop, laptop,mobile view</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore, vitae. Earum libero repellat excepturi in, deserunt, hic voluptatem placeat tenetur neque ullam sit.</p>
						</div>
					</div>
				</div>
			</div>--> <!-- row end -->
		</div>  <!-- container end -->
	</section>
	<!-- Service section End -->
	
	<!-- Work process start -->
<!--
	<section id="process" class="process parallax2">
		<div class="parallax-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="sub-heading text-center">
						<h4 >Our working process</h4>
						<div class="line"></div>
						<p>simply we follow these process</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="process-desc">
						<div class="process-timeline"></div>
						<div class="process-none text-center">
							<div >
								<i class="fa fa-lightbulb-o"></i>
							</div>
							<h4>concept</h4>
						</div>
						<div class="single-process text-center">
							<div class="process-icon">
								<i class="fa fa-pencil"></i>
							</div>
							<h4>Sketch</h4>
						</div>

						<div class="single-process text-center">
							<div class="process-icon">
								<i class="fa fa-lightbulb-o"></i>
							</div>
							<h4>Design</h4>
						</div>
						<div class="single-process text-center">
							<div class="process-icon">
								<i class="fa fa-code"></i>
							</div>
							<h4>Code</h4>
						</div>
						<div class="single-process text-center">
							<div class="process-icon">
								<i class="fa fa-flask"></i>
							</div>
							<h4>Test</h4>
						</div>
						<div class="single-process text-center">
							<div class="process-icon">
								<i class="fa fa-rocket"></i>
							</div>
							<h4>launch</h4>
						</div>
					</div>
				</div>
			</div>--> <!-- row end -->
<!--		</div>
	</section>-->
	<!-- Work process end -->
	
	<!-- features quality start -->
	<!--
	<section id="feature">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">Features</h3>
							<span>how dedicated i am</span>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui nulla omnis eos pariatur quidem at alias rerum tempora. </p>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6 wow fadeInLeft" data-wow-delay=".4s">
					<div class="feature-img">
						<img src="sample/images/feature.png" alt="" class="img-responsive">
					</div>
				</div>

				<div class="col-md-6">
					<div class="main-fetaure">
						<div class="feature-desc wow fadeInRight" data-wow-delay=".2s">
							<div class="feature-icon"><i class="icon icon-wallet"></i></div>
							<div class="feature-content">
								<h4> Realaible and secure platform </h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti possimus unde aliquam, reprehenderit assumenda commodi eligendi obcaecati.</p>
							</div>
						</div>
						<div class="feature-desc wow fadeInRight" data-wow-delay=".4s">
							<div class="feature-icon"><i class="icon icon-flag"></i></div>
							<div class="feature-content">
								<h4> Fresh and Clean</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti possimus unde aliquam, reprehenderit assumenda commodi eligendi obcaecati.</p>
							</div>
						</div>
						<div class="feature-desc wow fadeInRight" data-wow-delay=".8s">
							<div class="feature-icon"><i class="icon icon-adjustments "></i></div>
							<div class="feature-content">
								<h4> Easy to customize</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti possimus unde aliquam, reprehenderit assumenda commodi eligendi obcaecati.</p>
							</div>
						</div>
						<div class="feature-desc wow fadeInRight" data-wow-delay="1.1s">
							<div class="feature-icon"><i class="icon icon-hourglass"></i></div>
							<div class="feature-content">
								<h4> Rapid Customer support </h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti possimus unde aliquam, reprehenderit assumenda commodi eligendi obcaecati.</p>
							</div>
						</div>
					</div> <!-- main feature end -->
			<!--</div>--> <!-- col-md-8 end -->
			<!--</div>--> <!-- row end -->
		<!--</div>--> <!-- conatainer end -->
	<!--</section>-->
	<!-- features quality end -->
	
	<!-- Section work start -->
	<section id="work">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="header-desc text-center">
							<div class="header-content">
								<h3 class="big-title">projects</h3>
								<span>creative work sample</span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui nulla omnis eos pariatur quidem at alias rerum tempora. </p>
						</div>
					</div>
				<div class='row wow fadeInUp'>
				    <div class='col-lg-12'>
				      <div class="carousel slide" id="portfolio-carousel">
				        <div class="carousel-inner">
				          	<div class="item  active">
				            	<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio1.jpg" alt="portfolio">
										</div>
									</div>          
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg2.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Sunlight Shine</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio2.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="images/portfolio/portfolio-bg3.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>All Quiet Western</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio3.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>The GodFather</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio4.jpg" alt="portfolio">
										</div>
									</div>
				            	</div>
				          	</div><!--/ Item active end -->
							<div class="item">
					            <div class="row">
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio5.jpg" alt="portfolio">
										</div>
									</div>          
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio6.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio7.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio8.jpg" alt="portfolio">
										</div>
									</div>
					            </div>
				          	</div><!--/ Item end -->
				        </div><!-- Carousel inner end -->
							
							<div class="barrier-carousel-controller">
						        <a data-slide="prev" href="#portfolio-carousel" class="left"><i class="fa fa-chevron-left"></i></a>
						        <a data-slide="next" href="#portfolio-carousel" class="right"><i class="fa fa-chevron-right"></i></a>
					    	</div><!-- Controller end -->
				      </div><!-- Carousel end -->                          
				    </div><!-- Main Col end -->
		  		</div><!--/  row end -->
			</div><!--/ Main row end -->
		</div><!--/ Container end -->
	</section>
	<!-- section portfolio end-->

	
	<!-- video background section start -->

	 <section id="video" class="hero landing hero-section">
        <div class="video-background-container">
            <video preload="auto" autoplay loop muted class="video-background">
                <source type="sample/video/mp4" src="sample/videos/google.mp4" />
                <source type="sample/video/ogg" src="sample/videos/google.ogv" />
                <source type="sample/video/webm" src="sample/videos/google.webm" />
            </video>
        </div> 

        <div class="parallax-overlay"></div>

        <div class="container">
            <div class="hero-content text-center">
                <div class="hero-text" >
                    <h2 class="hero-title">Are you intrested ? want to get more !</h2>
                    <p class="hero-description">Mauris hendrerit eros ac ferment sodales</p>
                    <button class="btn btn-primary page-scroll"> Get in Touch</button>
                </div><!--/ Hero text end -->
            </div><!--/ Hero content end -->
        </div><!--/ Container end -->
    </section><!--/ Home end -->

	<!-- video background section end -->

	<!-- TEAM section strat -->
	<section id="team" class="team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">Our Members</h3>
							<span>our expert team</span>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui nulla omnis eos pariatur quidem at alias rerum tempora. </p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="team-mebers">
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay=".3s">
						<div class="single-member">
							<img src="sample/images/team/team1.jpg" alt="" class="img-responsive">
							<div class="member-overlay">
								<h4> Memeber details</h4>	
								<div class="line"></div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas magni, laborum ipsa. Magnam natus incidunt explicabo excepturi.</p>
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
							</div>

							<div class="member-content">
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
								<div class="member-socail">
									<ul class="list-inline">
										<li> <a href="#"><i class="fa fa-facebook"></i> </a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-behance"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div> <!-- col-md-3 end -->
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay=".6s">
						<div class="single-member">
							<img src="sample/images/team/team2.jpg" alt="" class="img-responsive">
							<div class="member-overlay">
								<h4> Memeber details</h4>	
								<div class="line"></div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas magni, laborum ipsa. Magnam natus incidunt explicabo excepturi.</p>
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
							</div>
							<div class="member-content">
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
								<div class="member-socail">
									<ul class="list-inline">
										<li> <a href="#"><i class="fa fa-facebook"></i> </a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-behance"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div> <!-- col-md-3 end -->
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay=".9s">
						<div class="single-member">
							<img src="sample/images/team/team6.jpg" alt="" class="img-responsive">
							<div class="member-overlay">
								<h4> Memeber details</h4>	
								<div class="line"></div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas magni, laborum ipsa. Magnam natus incidunt explicabo excepturi.</p>
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
							</div>
							<div class="member-content">
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
								<div class="member-socail">
									<ul class="list-inline">
										<li> <a href="#"><i class="fa fa-facebook"></i> </a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-behance"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div> <!-- col-md-3 end -->
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="1.1s">
						<div class="single-member">
							<img src="sample/images/team/team4.jpg" alt="" class="img-responsive">
							<div class="member-overlay">
								<h4> Memeber details</h4>	
								<div class="line"></div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas magni, laborum ipsa. Magnam natus incidunt explicabo excepturi.</p>
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
							</div>

							<div class="member-content">
								<div class="member-desc">
									<h4>Darn Oscar</h4>
									<h5>web designer</h5>
								</div>
								<div class="member-socail">
									<ul class="list-inline">
										<li> <a href="#"><i class="fa fa-facebook"></i> </a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-behance"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div> <!-- col-md-3 end -->
				</div>
			</div> <!-- row end -->
		</div> <!-- container end -->
	</section>
	<!-- TEAM section strat -->

	<!-- Counter start -->
	<section id="counter-area">
        <div class="container">
             <div class="facts">
                <div class="col-md-3 col-xs-12 col-sm-6 columns">
                    <div class="facts-wrap">
	                     <div class="icon-box"><i class="fa fa-thumbs-o-up fw"></i></div>
	                    <div class="fact-content">
	                    	<h6>Clients</h6>
	                     	<div class="facts-wrap-num">
	                            <span class="counter">876</span>
	                        </div>
	                    </div>
                    </div>
                </div>
                <div class="col-md-3 col-xs-12 col-sm-6 columns">
                    <div class="facts-wrap">
                    	<div class="icon-box"><i class="fa fa-gift fw"></i></div>
	                     <div class="fact-content">
	                     	<h6>Awards</h6>
	                     	<div class="facts-wrap-num"><span class="counter"> 275</span></div>
	                    </div>
                    </div>
                </div>
                <div class="col-md-3 col-xs-12 col-sm-6 columns">
                    <div class="facts-wrap">
                    	<div class="icon-box"><i class="fa fa-check-square-o fw"></i></div>
                        <div class="fact-content">
                        	<h6>Projects</h6>
	                        <div class="facts-wrap-num"><span class="counter">658</span></div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-md-3 col-xs-12 col-sm-6 columns">
                    <div class="facts-wrap">
                    	<div class="icon-box"><i class="fa fa-envelope-o fw"></i></div>
                        <div class="fact-content">
                        	<h6>Mails</h6>
	                        <div class="facts-wrap-num"><span class="counter">469</span></div>
	                    </div>
                    </div>
                </div>
            </div> <!-- Conatainer End -->
        </div>	<!-- Fact div ENd -->
	</section>
	<!-- Counter end -->

	<!-- section pricing start -->

	<section id="pricing">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">Pricing</h3>
							<span>how dedicated i am</span>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui nulla omnis eos pariatur quidem at alias rerum tempora. </p>
					</div>
				</div>
			</div> <!-- 1st row end -->

			<div class="row">
				<div class="pricing-desc">
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay=".4s">
						<div class="panel panel-default panel-pricing">
							<div class="panel-heading text-center">
								<h3 class="panel-title">Starter</h3>
								<p class="plan">&#163; 64</p>
							</div>
							<div class="panel-body  text-left">
								<ul class="plan-desc">
									<li> responsive design</li>
									<li> crossbrowser support</li>
									<li> Jquery plugin support</li>
									<li> Creative design</li>
									<li> Much more ..</li>
								</ul>
							</div>
							<div class="panel-footer text-center">
								<button class="btn btn-black">Buy Now </button>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay=".8s">
						<div class="panel panel-default panel-pricing">
							<div class="panel-heading featured text-center">
								<h3 class="panel-title">Designer</h3>
								<p class="plan">&#163; 94</p>
							</div>
							<div class="panel-body">
								<ul class="plan-desc">
									<li> responsive design</li>
									<li> crossbrowser support</li>
									<li> Jquery plugin support</li>
									<li> Creative design</li>
									<li> Much more ..</li>
								</ul>
							</div>
							
							<div class="panel-footer text-center">
								<button class="btn btn-black">Buy Now </button>
							</div>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="1.1s">
						<div class="panel panel-default panel-pricing">
							<div class="panel-heading text-center">
								<h3 class="panel-title">Developer</h3>
								<p class="plan">&#163; 74</p>
							</div>
							<div class="panel-body">
								<ul class="plan-desc">
									<li> responsive design</li>
									<li> crossbrowser support</li>
									<li> Jquery plugin support</li>
									<li> Creative design</li>
									<li> Much more ..</li>
								</ul>
							</div>
							
							<div class="panel-footer text-center">
								 <button class="btn btn-black">Buy Now </button>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="1.3s">
						<div class="panel panel-default panel-pricing">
							<div class="panel-heading text-center">
								<h3 class="panel-title">Speaker</h3>
								<p class="plan">&#163; 84</p>
							</div>
							<div class="panel-body">
								<ul class="plan-desc">
									<li> responsive design</li>
									<li> crossbrowser support</li>
									<li> Jquery plugin support</li>
									<li> Creative design</li>
									<li> Much more ..</li>
								</ul>
							</div>
							
							<div class="panel-footer text-center">
								 <button class="btn btn-black">Buy Now </button>
							</div>
						</div>
					</div>

				</div>
			</div> <!-- row end -->
		</div> <!-- conatiner end -->
	</section>
	<!-- section pricing end -->

	<!-- Section testimonial start -->
	<section id="testimonial" class="parallax1">
		<div class="parallax-overlay"></div>
			<div class="container">
				<div class="row">
					<div id="testimonial-carousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators visible-lg visible-md">
						  	<li data-target="#testimonial-carousel" data-slide-to="0" class="active"></li>
						    <li data-target="#testimonial-carousel" data-slide-to="1"></li>
						    <li data-target="#testimonial-carousel" data-slide-to="2"></li>
						</ol><!--/ Indicators end-->

						<div class="carousel-inner">
							<div class="item active text-center">
								<div class="row">
									<div class="col-md-12">
										<div class="testimonial-thumb">
										<img src="sample/images/team/team1.jpg" alt="" class="img-responsive">
										</div>
										<div class="testimonial-content">
											<p>Officiis blanditiis, tempore, distinctio assumenda fugiat quaerat ea a rem est debitis quo harum corporis, labore eligendi natus quidem. Non, illum, ipsa.Fugiat quaerat ea a rem est debitis quo harum corporis, labore eligendi natus quidem. Non, illum, ipsa.</p>
											<h3>Jimmi Carter</h3>
											<span>Web excutive-company name</span>
										</div>
									</div>
								</div>
							</div>
							<div class="item text-center">
								<div class="row">
									<div class="col-md-12">
										<div class="testimonial-thumb">
										<img src="sample/images/team/team2.jpg" alt="" class="img-responsive">
										</div>
										<div class="testimonial-content">
											<p>Officiis blanditiis, tempore, distinctio assumenda fugiat quaerat ea a rem est debitis quo harum corporis, labore eligendi natus quidem. Non, illum, ipsa.Fugiat quaerat ea a rem est debitis quo harum corporis, labore eligendi natus quidem. Non, illum, ipsa.</p>
											<h3>Jimmi Carter</h3>
											<span>Web excutive-company name</span>
										</div>
									</div>
								</div>
							</div>

							<div class="item text-center">
								<div class="row">
									<div class="col-md-12">
										<div class="testimonial-thumb">
										<img src="sample/images/team/team1.jpg" alt="" class="img-responsive">
										</div>
										<div class="testimonial-content">
											<p>Officiis blanditiis, tempore, distinctio assumenda fugiat quaerat ea a rem est debitis quo harum corporis, labore eligendi natus quidem. Non, illum, ipsa.Fugiat quaerat ea a rem est debitis quo harum corporis, labore eligendi natus quidem. Non, illum, ipsa.</p>
											<h3>Jimmi Carter</h3>
											<span>Web excutive-company name</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> <!-- testimonial-carousel end -->
				</div> <!-- row end -->
			</div> <!-- container end -->
	</section>
	<!-- Section testimonial end -->
	
	<!-- section blog start -->
	<section id="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">Blog</h3>
							<span>my online dairy</span>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui nulla omnis eos pariatur quidem at alias rerum tempora. </p>
					</div>
				</div>
			</div> <!-- 1st row end -->

			<div class="row">
				<div class="blog-single">
					<div class="col-md-6 wow fadeInUp" data-wow-delay=".2s">
						<div class="blog-desc">
							<img src="sample/images/blog/blog1.jpg" alt="" class="img-responsive">
							<div class="blog-overlay">
								<a class="blink" href="#"><i class="fa fa-link"></i></a>
								<a class="bsearch" href="#"><i class="fa fa-search"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="blog-content">
							<h4 class="blog-title">Qui nulla omnis eos pariatur</h4>
							<div class="blog-meta">
								<span> 29 januray 2020</span>
								<span><i class="fa fa-user"></i> Mark astler</span>
								<span class="pull-right"><i class="fa fa-comments"></i> 35 comments</span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam laudantium, ad facilis natus, cum at nesciunt enim, veniam qui illum mollitia non voluptatem, modi. Natus culpa molestias tempora qui expedita.</p>
							<div class="blog-social m20">
								<h4>Share it :</h4>
								<ul class="socail-list list-inline">
									<li><a href="#"><i class="fa fa-facebook wow fadeInLeft" data-wow-delay=".2s"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter wow fadeInLeft" data-wow-delay=".4s"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus wow fadeInLeft" data-wow-delay=".6s"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin wow fadeInLeft" data-wow-delay=".8s"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble wow fadeInLeft" data-wow-delay="1s"></i></a></li>
									<li><a href="#"><i class="fa fa-rss wow fadeInLeft" data-wow-delay="1.1s"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div> 
			</div><!-- row end -->
			<div class="m40"></div>
			<div class="row">
				<div class="blog-single">
					<div class="col-md-6 wow fadeInUp" data-wow-delay=".2s">
						<div class="blog-desc">
							<img src="sample/images/blog/blog2.jpg" alt="" class="img-responsive">
							<div class="blog-overlay">
								<a class="blink" href="#"><i class="fa fa-link"></i></a>
								<a class="bsearch" href="#"><i class="fa fa-search"></i></a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="blog-content">
							<h4 class="blog-title">Qui nulla omnis eos pariatur</h4>
							<div class="blog-meta">
								<span> 29 januray 2020</span>
								<span><i class="fa fa-user"></i> Mark astler</span>
								<span class="pull-right"><i class="fa fa-comments"></i> 35 comments</span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam laudantium, ad facilis natus, cum at nesciunt enim, veniam qui illum mollitia non voluptatem, modi. Natus culpa molestias tempora qui expedita.</p>
							<div class="blog-social m20">
								<h4>Share it :</h4>
								<ul class="socail-list list-inline">
									<li><a href="#"><i class="fa fa-facebook wow fadeInLeft" data-wow-delay=".2s"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter wow fadeInLeft" data-wow-delay=".4s"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus wow fadeInLeft" data-wow-delay=".6s"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin wow fadeInLeft" data-wow-delay=".8s"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble wow fadeInLeft" data-wow-delay="1s"></i></a></li>
									<li><a href="#"><i class="fa fa-rss wow fadeInLeft" data-wow-delay="1.1s"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div> 
			</div><!-- row end -->
		</div> <!-- container end -->
	</section>
	<!-- section blog end -->
	
	<!-- Clent section start -->
	<section id="client">
		<div class="container">
			<div class="row">
				<div class="header-desc text-center">
					<h2>Clients</h2>
					<h5>our respectables clients</h5>
					<div class="line"></div>
				</div>
			</div>

			<div class="row">
				<div class="client-desc text-center">
					<ul class="list-inline">
						<li><a href="#"><img src="sample/images/client/client1.png" alt="" class="img-responsive"></a></li>
						<li><a href="#"><img src="sample/images/client/client2.png" alt="" class="img-responsive"></a></li>
						<li><a href="#"><img src="sample/images/client/client3.png" alt="" class="img-responsive"></a></li>
						<li><a href="#"><img src="sample/images/client/client4.png" alt="" class="img-responsive"></a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="btm-client text-center">
					<ul class="list-inline">
						<li><a href="#"><img src="sample/images/client/client1.png" alt="" class="img-responsive"></a></li>
						<li><a href="#"><img src="sample/images/client/client2.png" alt="" class="img-responsive"></a></li>
						<li><a href="#"><img src="sample/images/client/client3.png" alt="" class="img-responsive"></a></li>
						<li><a href="#"><img src="sample/images/client/client4.png" alt="" class="img-responsive"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- Clent section end -->

	<!-- section contact start -->

	<section id="contact" class="contact parallax4">
		<div class="parallax-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">contact</h3>
							<span>my online dairy</span>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui nulla omnis eos pariatur quidem at alias rerum tempora. </p>
					</div>
				</div>
			</div> <!-- 1st row end -->

			<div class="row">
				<div class="col-md-12">
					<div class="contact-desc">
						<form method="post" role="form" id="contact-form">
							<div class="row">
								<div class="col-md-4 wow fadeInLeft" data-wow-delay=".2s">
									<div class="form-group">
										<label> Name</label>
										<input class="form-control" name="name" placeholder="name" type="text" required>
									</div>
								</div>

								<div class="col-md-4 wow fadeInDown" data-wow-delay=".5s">
									<div class="form-group">
										<label> Email</label>
										<input class="form-control" name="name" placeholder="email" type="text" required>
									</div>
								</div>

								<div class="col-md-4 wow fadeInRight" data-wow-delay=".8s">
									<div class="form-group">
										<label>Subject</label>
										<input class="form-control" name="name" placeholder="subject" type="text">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 wow fadeInUp" data-wow-delay="1.1s">
									<div class="form-group">
										<label > Message</label>
										<textarea cols="30" rows="10" class="form-control"  placeholder="message"></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 wow fadeInUp" data-wow-delay="1.3s">
									<div class="text-left  m20">
										<button class="btn btn-white">Submit</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div> <!-- col-md-6 end -->
			</div> <!-- row end -->
		</div> <!-- container end -->
	</section>
	<!-- section contact end -->

	
	<!-- Map start here -->
	<section id="map-wrapper" class="no-padding">
		<div class="container">
			<div class="contact-info-inner wow fadeInUp">
    			<h3>Contact Info</h3>
	    		<div><i class="fa fa-map-marker pull-left"></i>  
	    			<p><strong>Address</strong>Her Majesty The Queen, <br>Buckingham Palace, London, SW1A 1AA</p>
	    		</div>
	    		<div><i class="fa fa-phone pull-left"></i>  
	    			<p><strong>Phone</strong>+(0207) 766-7300</p>
	    		</div>
	    		<div><i class="fa fa-envelope-o pull-left"></i>  
	    			<p><strong>Email</strong>info@hrh.co.uk</p>
	    		</div>
	    		<div><i class="fa fa-compass pull-left"></i>  
	    			<p><strong>Office Hours</strong>Mon - Friday, 9:30 - 4:40</p>
	    		</div>

			</div>
	    </div>
		<div class="map" id="map"></div>
	</section><!--/ Map end here -->

	<!-- footer start -->

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-desc text-center">
						<div class="logo wow fadeInDown">Barrier</div>
						<ul class="socail-list list-inline">
							<li><a href="#"><i class="fa fa-facebook wow fadeInLeft" data-wow-delay=".2s"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter wow fadeInLeft" data-wow-delay=".4s"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus wow fadeInLeft" data-wow-delay=".6s"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin wow fadeInLeft" data-wow-delay=".8s"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble wow fadeInLeft" data-wow-delay="1s"></i></a></li>
							<li><a href="#"><i class="fa fa-rss wow fadeInLeft" data-wow-delay="1.1s"></i></a></li>
						</ul>
					</div>
				</div>
			</div><!-- row end -->
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="copyright-info m20">
&copy; Copyright 2020 Barrier. 
        			</div>
				</div>
			</div><!--/ Row end -->

			<div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top affix">
			 	<a href="#slider" class="page-scroll">
					<button class="btn btn-primary" title="Back to Top"><i class="fa fa-angle-double-up"></i></button>
				</a>
			</div>
		</div><!-- container end -->
	</footer>
	<!-- footer end -->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="sample/assets/js/bootstrap.min.js"></script>
    <!-- initialize jQuery Library -->
    <script type="text/javascript" src="sample/js/jquery.js"></script>
    <!-- Wow Animation -->
    <script type="text/javascript" src="sample/js/wow.min.js"></script>
    <!-- SmoothScroll -->
    <script type="text/javascript" src="sample/js/smooth-scroll.js"></script>
    <!-- prettyphoto -->
    <script type="text/javascript" src="sample/js/jquery.prettyPhoto.js"></script>
    <!-- Eeasing -->
    <script type="text/javascript" src="sample/js/jquery.easing.1.3.js"></script>
    <!-- Counter -->
    <script type="text/javascript" src="sample/js/jquery.counterup.min.js"></script>
    <!-- Waypoints -->
    <script type="text/javascript" src="sample/js/jquery.waypoints.min.js"></script>
    <!-- Google Map API Key Source -->
    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <!-- Google Map  Source -->
    <script type="text/javascript" src="sample/js/gmaps.js"></script>
    <script type="text/javascript" src="sample/js/custom.js"></script>
		
  </body>
</html>