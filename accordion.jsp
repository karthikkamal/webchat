<html lang="en"><head>
	<title>Bootstrap Sidebar</title>
	<meta charset="utf-8">

	<!-- META -->
	<meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- END META -->

	<!-- FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Dosis:400,500,600" rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css">
	<!-- END FONTS -->

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="public/css/font-awesome.min.css">
	
	<link rel="stylesheet" type="text/css" href="public/css/design.css">
	<!-- END CSS -->	
	
	<script async="" src="//www.google-analytics.com/analytics.js"></script><script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-44073820-8', 'auto');
	  ga('send', 'pageview');

	</script>	
</head>
<body>
<header>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<div class="brand">
			<a class="navbar-brand" href="index.php"><span>bootstrap sidebar</span></a>
			<a class="toogle pull-right"><i class="fa fa-chevron-left"></i></a>
		</div>		
	</div>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<select class="form-control solsoThemeEvent">
					<option value="" selected="">choose</option>
					<option value="blue">blue theme</option>
					<option value="orange">orange theme</option>
				</select>
			</div>
		</form>	
	</div>
</div>
</nav></header>

<div class="body slide">
	<aside class="sidebar perfectScrollbar show">
		<div id="solso-sidebar">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="heading1">
					<h4 class="panel-title">
						<a href="index.php" class="single-item">
							<i class="fa fa-dashboard"></i> Dashboard 
						</a>
					</h4>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading2">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true" aria-controls="collapse2">
						<i class="fa fa-bar-chart-o"></i> Charts
						<i class="pull-right fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			
			<div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
				<div>
					<a href="bar-chart.php" class="list-group-item">bar Chart</a>
					<a href="pie-chart.php" class="list-group-item">pie Chart</a>
					<a href="google-chart.php" class="list-group-item">google Chart</a>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading3">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="true" aria-controls="collapse3">
						<i class="fa fa-table"></i> Tables
						<i class="pull-right fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			
			<div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
				<div>
					<a href="simple-tables.php" class="list-group-item">Simple Tables</a>
					<a href="data-tables.php" class="list-group-item">Data Tables</a>
					<a href="beauty-tables.php" class="list-group-item">Beauty Tables</a>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading4">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
						<i class="fa fa-edit"></i> Forms
						<i class="pull-right fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			
			<div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
				<div>
					<a href="form-1.php" class="list-group-item">Form 1</a>
					<a href="form-2.php" class="list-group-item">Form 2</a>
					<a href="form-3.php" class="list-group-item">Form 3</a>
					<a href="form-4.php" class="list-group-item">Form 4</a>
					<a href="form-5.php" class="list-group-item">Form 5</a>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading5">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
						<i class="fa fa-desktop"></i> UI Elements
						<i class="pull-right fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			
			<div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
				<div>
					<a href="element-1.php" class="list-group-item">Element 1</a>
					<a href="element-2.php" class="list-group-item">Element 2</a>
					<a href="element-3.php" class="list-group-item">Element 3</a>
					<a href="element-4.php" class="list-group-item">Element 4</a>
					<a href="element-5.php" class="list-group-item">Element 5</a>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading6">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="true" aria-controls="collapse6">
						<i class="fa fa-file"></i> Pages
						<i class="pull-right fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			
			<div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
				<div>
					<a href="page-1.php" class="list-group-item">Page 1</a>
					<a href="page-2.php" class="list-group-item">Page 2</a>
					<a href="page-3.php" class="list-group-item">Page 3</a>
					<a href="page-4.php" class="list-group-item">Page 4</a>
					<a href="page-5.php" class="list-group-item">Page 5</a>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading7">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse7" aria-expanded="true" aria-controls="collapse7">
						<i class="fa fa-picture-o"></i> Gallery
						<i class="pull-right fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			
			<div id="collapse7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading7">
				<div>
					<a href="gallery-1.php" class="list-group-item">Gallery 1</a>
					<a href="gallery-2.php" class="list-group-item">Gallery 2</a>
					<a href="gallery-3.php" class="list-group-item">Gallery 3</a>
					<a href="gallery-4.php" class="list-group-item">Gallery 4</a>
					<a href="gallery-5.php" class="list-group-item">Gallery 5</a>
				</div>
			</div>
		</div>		
	</div>
</div>	</aside>

	<div class="container-fluid left-border">
	<div class="row">
		<div class="col-md-12 col-lg-12">
			<h1><i class="fa fa-home"></i> Dashboard</h1>
			
			<ol class="breadcrumb">
				<li><a href="index.php">Home</a></li>
				<li><a href="#">Core</a></li>
				<li><a href="#">Library</a></li>
				<li class="active">Dashboard</li>
			</ol>	
		</div>

		<div class="col-sm-6 col-md-3">
			<div class="widget widget-stats bg-green">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-users fa-fw"></i></div>
				<div class="stats-title">clients</div>
				<div class="stats-number">38</div>
				<hr>
				<div class="stats-desc">total number of clients</div>
			</div> 	
		</div> 	

		<div class="col-sm-6 col-md-3">
			<div class="widget widget-stats bg-blue">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-puzzle-piece fa-fw"></i></div>
				<div class="stats-title">products</div>
				<div class="stats-number">24</div>
				<hr>
				<div class="stats-desc">total number of products</div>
			</div> 	
		</div>  

		<div class="col-sm-6 col-md-3">
			<div class="widget widget-stats bg-purple">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-file-pdf-o fa-fw"></i></div>
				<div class="stats-title">invoices</div>
				<div class="stats-number">100</div>
				<hr>
				<div class="stats-desc">total number of invoices</div>
			</div> 
		</div> 		

		<div class="col-sm-6 col-md-3">
			<div class="widget widget-stats bg-grey">
				<div class="stats-icon stats-icon-lg"><i class="fa fa-money fa-fw"></i></div>
				<div class="stats-title">AMOUNT</div>
				<div class="stats-number">3432.89 $</div>
				<hr>
				<div class="stats-desc">total value of amounts</div>
			</div> 
		</div> 

		<div class="col-md-12">
			<h2>Bootstrap Sidebar &amp; Sidebar Accordion Menu</h2>
			
			<p>Bootstrap is one of the most loved CSS framework used by web developers, but it has some shortcomings and one of this is an sidebar and an sidebar accordion menu.</p>
			<p>I try to create a sidebar for Bootstrap only with bootstrap elements so any developer who want to use this app doesn't need to load other components to have access to this feature.</p>
			<p>Bootstrap sidebar use localStorage, new modern concept to keep secure information in browser, to store active link.</p>
			
			<h2>Sidebar Accordion Menu</h2>
			
			<p>This is the main feature which make the goal of this application, sidebar menu are based on bootstrap accordion.</p>
			<p>When web page is loaded, accordion menu leaves the sub-menu open if the sub-menu contains the current page link, making it very convenient for users to navigate through other items in the sub-menu,
			 but with my modification this issue is solved.	
			</p>
			
			<p>Bootstrap Sidebar &amp; Sidebar Accordion Menu come with 2 themes blue and orange, of course anyone can customize this from .css file</p>
		</div>		
		
		<div class="col-md-6">
			<h3>Sidebar Accordion Menu theme 01</h3>
			<img src="public/img/sidebar-menu.png" class="thumbnail">		
		</div>		
		
		<div class="col-md-6">
			<h3>Sidebar Accordion Menu theme 02</h3>
			<img src="public/img/sidebar-menu-02.png" class="thumbnail">			
		</div>
		
		
	</div>	
	</div>	
</div>	

<script type="text/javascript" src="public/js/jquery.js"></script>


	</body></html>