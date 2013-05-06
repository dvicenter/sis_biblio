<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Sistema de Biblioteca Central</title>
		<meta name="charset" content="uft-8"/>
		<meta name="keyboards" content="Sistema de Biblioteca Central UNJFSC,UNJFSC Biblioteca"/>
		<meta name="author" content="Grados Manrique, Kelly; Gonzales Angulo, Karina; Nicho Diaz, Cesar; Valladares Loza, Deyvis"/>
		
		<link type="text/css" href="<?php echo base_url();?>resource/css/bootstrap.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/bootstrap-responsive.min.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/style.css" rel="stylesheet"/>
		
		<script src="<?php echo base_url();?>resource/js/jquery.min.js"></script>
		<script src="<?php echo base_url();?>resource/js/bootstrap.min.js"></script>
		
	</head>
	<body>
		<section class="body">
			<header class="header"></header>
			<nav class="nav_top">
				<?php $this->load->view('panel/nav_top');?>
			</nav>
			<article class="nav_left">
				<?php $this->load->view('panel/nav_left');?>
			</article>
			<section class="body_right"></section>
			<footer class="footer"></footer>
		</section>
	</body>
</html>