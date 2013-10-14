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
	
	</head>
	<body>
		<div id="login">
		<div class="m_body">
			<section>
				<div class="top_login">
					<div id="pos_login_left"><img src="<?php echo base_url();?>resource/img/utilities/jpg/06.jpg" />
					</div>
					<!-- <form class="pos_right form_login" method="post" enctype="application/x-www-form-urlencoded">-->
					<div id="pos_login_right"><img src="<?php echo base_url();?>resource/img/utilities/jpg/07.jpg" />
					</div>
				</div>
			</section>
			
		</div>
		<section class="well">
				<div class="m_body">
						<div><img id="pos_login_center" src="<?php echo base_url();?>resource/img/utilities/jpg/05.jpg" />
							 <img id="pos_login_center1" src="<?php echo base_url();?>resource/img/utilities/png/facultad.png" />	
							 <img id="pos_login_logo" src="<?php echo base_url();?>resource/img/utilities/jpg/08.png" />
						</div>

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
	          	</div>
          </section>
          

         </div>
	</body>

	<body background="red"><footer class="m_body" >
          	<p class="login_footer" >&copy; Derecho Reservados - Escuela Acad&eacute;mica Profesional Ingenier&iacute;a de Sistemas</p>
          </footer></body>
</html>

<?php }?>
     <!-- <a href="http://web.unjfsc.edu.pe/site/"><img src="<?php echo base_url()?>resource/img/utilities/jpg/01.jpg" data-thumb="<?php echo base_url()?>resource/img/utilities/jpg/01.jpg" alt="" title="BIENVENIDO A LA UNJFSC" /></a>-->