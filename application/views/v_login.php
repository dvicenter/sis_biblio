<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Sistema de Biblioteca Central</title>
		<link type="text/css" href="<?php echo base_url();?>resource/css/bootstrap.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/bootstrap-responsive.min.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/style.css" rel="stylesheet"/>
		
		<script src="<?php echo base_url();?>resource/js/jquery.min.js"></script>
		<script src="<?php echo base_url();?>resource/js/bootstrap.min.js"></script>
	</head>
	<body>
		<section>
			<div>
				<div class="pos_left"><img src="<?php echo base_url();?>resource/img/utilities/png/UNJFSC_lo.png" /></div>
				<form class="pos_right">
					<div class="pos_left">
						<label class="bold_label">Usuario</label>
						<input type="text" class="input-xlarge" placeholder="Usuario">
					</div>
					<div class="pos_left">
					<label class="bold_label">Password</label>
						<input type="password" class="input-small" placeholder="Password">
					</div>
					<div class="pos_right">
						<button type="submit" class="btn btn-warning">Enviar</button>
					</div>
				</form>
			</div>
		</section>
		<footer></footer>
	</body>
</html>