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
		<script src='<?php echo base_url();?>resource/js/validarcampo.js'></script>
		<script src='<?php echo base_url();?>resource/js/jquery.form.js'></script>
		<script src="<?php echo base_url();?>resource/myjs/nav.js"></script>
		<script src="<?php echo base_url();?>resource/myjs/validations.js"></script>
		<script src="<?php echo base_url();?>resource/myjs/utilities.js"></script>
		<script src="/sis_biblio/resource/myjs/voucher.js" type="text/javascript"></script>
		<script> base_url="<?php echo base_url();?>"</script>
	</head>
	<body>
		<section class="body">
			<header class="header"> 
			   <?php $this->load->view('panel/header');?>
			</header>
			<nav class="nav_top">
				<?php $this->load->view('panel/nav_top');?>
			</nav>
			<article class="nav_left">
				<?php $this->load->view('panel/nav_left');?>
			</article>
			<section id="module_content" class="body_right">
				<img style="padding: 10% 0% 0% 26%;" src="<?php echo base_url();?>resource/img/utilities/png/unjfsc.png"/>
			</section>
			<footer class="footer" style="color: white;">
				<div style="text-align:center;">
					©2013 Universidad Nacional Jos&eacute; Faustino S&aacute;nchez Carri&oacute;n
					<p>
						Facultad de Ingenier&iacute;a - Ingenier&iacute;a de Sistemas - Sistema Web Para el Control y Gesti&oacute;n de Tesis
					</p>
				</div>
			</footer>
		</section>
	</body>
</html>