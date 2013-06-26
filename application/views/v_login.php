<?php
	 if ($this->session->userdata("usuario")) 
	 {	$this->data['usuario']=$this->session->userdata("usuario");
	 	$this->data['id_sujeto']=$this->session->userdata("id_sujeto");
	 	$this->load->view('v_panel',$this->data);
	 }
	 else{ 
	?>
<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Sistema de Control de Tesis</title>
		<link type="text/css" href="<?php echo base_url();?>resource/css/bootstrap.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/bootstrap-responsive.min.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/style.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/nivo.css" rel="stylesheet"/>
		<link type="text/css" href="<?php echo base_url();?>resource/css/default.css" rel="stylesheet"/>
		
		<script src="<?php echo base_url();?>resource/js/jquery.min.js"></script>
		<script src="<?php echo base_url();?>resource/js/bootstrap.min.js"></script>
		<script src="<?php echo base_url();?>resource/js/jquery.nivo.slider.js"></script>
		<script src="<?php echo base_url();?>resource/myjs/login.js"></script>
		<script>
			$(document).ready(function(){
				$('#slider').nivoSlider();
			})
		</script>
	</head>
	<body>
		<div id="login">
		<div class="m_body">
			<section>
				<div class="top_login">
					<div class="pos_left unjfsc_login"><img src="<?php echo base_url();?>resource/img/utilities/png/UNJFSC_lo.png" /></div>
					<!-- <form class="pos_right form_login" method="post" enctype="application/x-www-form-urlencoded">-->
						<?php echo form_open('acceder/sistema');?>					
						<div class="pos_left user">
							<label class="bold_label">Usuario</label>
							<input autofocus="autofocus" name="usuario_login" type="text"  placeholder="Usuario" requerid>
						</div>
						<div class="pos_left pass">
						<label class="bold_label">Contrase&ntilde;a</label>
							<input name="password_login" type="password" placeholder="Password" requerid>
						</div>
						<div class="pos_right btn_login">
							<button name="btn_entrar" type="submit" class="btn btn-large btn-login">Entrar</button>
						</div>
					</form>
					<div class="log_alert alert alert-error">
					<a class="close" data-dismiss="alert">×</a>
  						<b><?php 
  								echo validation_errors();
  								if($error){
  									echo $error;
  								}
  							?></b>
					</div>
				</div>
			</section>
			
		</div>
		<!-- <section class="well">
				<div class="m_body">
					<div class="slider-wrapper theme-default">
			            <div id="slider" class="nivoSlider">
			                <img src="<?php echo base_url()?>resource/img/utilities/jpg/04.jpg"  alt="" />
			           
			                <img src="<?php echo base_url()?>resource/img/utilities/jpg/01.jpg"  alt="" title="BIENVENIDO A LA UNJFSC" />
			                <img src="<?php echo base_url()?>resource/img/utilities/jpg/02.jpg"  alt="" title="BIENVENIDO A LA UNJFSC" data-transition="slideInLeft" />
			                <img src="<?php echo base_url()?>resource/img/utilities/jpg/03.jpg"  alt="" title="BIENVENIDO A LA UNJFSC" />
			            </div>
			        </div>
	          	</div>
          </section>-->
          <footer class="m_body">
          	<p class="login_footer">&copy; Derecho Reservados - Escuela Acad&eacute;mica Profesional Ingenier&iacute;a de Sistemas</p>
          </footer>
         </div>
	</body>
</html>
<?php }?>
     <!-- <a href="http://web.unjfsc.edu.pe/site/"><img src="<?php echo base_url()?>resource/img/utilities/jpg/01.jpg" data-thumb="<?php echo base_url()?>resource/img/utilities/jpg/01.jpg" alt="" title="BIENVENIDO A LA UNJFSC" /></a>-->