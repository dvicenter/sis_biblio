<div id="nav_left" class="well" style="padding: 8px 0;height: 97%;">
	<ul class="nav nav-list">
    	<li class="active">
    		<a href="<?php echo base_url();?>"><i class="icon-home"></i>Inicio</a>
    	</li>
    	<li class="accordion-group nav_left_content modulo_deshabilitado">
    		<div class="accordion-heading nav_left_head">
                <a data-toggle="collapse" href="#nav_left_one">
                  <i class="icon-book"></i>OFICINA DE BIBLIOTECA CENTRAL
                </a>
             </div>
             <div id="nav_left_one" class="accordion-body collapse nav_left_body">
	             <ul class="nav nav-list">
	             	<li><a id="constancia" href="javascript:;">Solicitudes por Aprobar</a></li>
	             	<!-- <li><a href="#">Informes de Pr&aacute;ctica</a></li>-->
	             	<!-- <li><a href="#">Monograf&iacue;as</a></li>-->
	             	<li><a id="tesis" href="javascript:;">Control de Tesis</a></li>
                    <li><a id="monografias" href="javascript:;">Control de Monograf&iacute;as</a></li>
                    
	             </ul>
             </div>
    	</li>
    	
    	<!-- <li class="accordion-group nav_left_content">
    		<div class="accordion-heading nav_left_head">
                <a data-toggle="collapse" href="#nav_left_two">
                  <i class="icon-barcode"></i>OFICINA DE PATRIMONIO
                </a>
             </div>
             <div id="nav_left_two" class="accordion-body collapse nav_left_body">
	             <ul class="nav nav-list">
	             	<li><a href="#">Material Bibliogr&aacute;fico</a></li>
	             </ul>
             </div>
    	</li>-->
    	<li class="accordion-group nav_left_content modulo_deshabilitado">
    		<div class="accordion-heading nav_left_head">
                <a data-toggle="collapse" href="#nav_left_three">
                  <i class="icon-user"></i>USUARIO
                </a>
             </div>
             <div id="nav_left_three" class="accordion-body collapse nav_left_body">
	             <ul class="nav nav-list">
	             	<li class="modulo_deshabilitado" ><a id="request_record" href="javascript:;">Solicitar Constancia</a></li>
	             	<!-- <li><a id="tesis_consultation" href="javascript:;">Consulta de tesis</a></li>-->
	             </ul>
             </div>
    	</li>
    	<li class="accordion-group nav_left_content modulo_deshabilitado">
    		<div class="accordion-heading nav_left_head">
                <a data-toggle="collapse" href="#nav_left_four">
                  <i class="icon-folder-close"></i>ADMINISTRACI&Oacute;N
                </a>
             </div>
             <div id="nav_left_four" class="accordion-body collapse nav_left_body">
	             <ul class="nav nav-list">
	             	<li class="modulo_deshabilitado"><a id="user" href="javascript:;">Usuario</a></li>
                    <li class="modulo_deshabilitado"><a id="load_voucher" href="javascript:;" data-toggle="modal">Cargar Voucher</a></li>
	             	<li class="modulo_deshabilitado"><a id="role_assignment" href="javascript:;">Asignacion de roles</a></li>
	             	<li class="modulo_deshabilitado"><a id="role_assignment_component" href="javascript:;">Asignacion de componentes y acci&oacute;n</a></li>
	             	<li class="modulo_deshabilitado"><a id="role_component_action" href="javascript:;">Asignacion de acci&oacute;n</a></li>
					
	             </ul>
             </div>
    	</li>
    </ul>
</div>
<?php
$this->load->view('module/manager/voucher/modalVoucher');
?>


