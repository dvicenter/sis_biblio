<div style="margin-left: 5px;" id="manager_user">
	<div class="form_user">
		<form id="form_adm_user" class="form-horizontal">
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_adm_sujeto">Sujeto:</label> 
			  <div class="controls">
				<input autocomplete="off" id="input_adm_sujeto" type="text" class="input-xlarge" data-toggle="popover" data-placement="right" data-content="" required>
				<p style="font-weight: normal;" class="help-block">Ejm: Garc&iacute;a Fernando</p>
				<input type="hidden" name="id_usuario_man"/>
				<input type="hidden" name="id_sujeto_man"/>
			  </div>
			</div>
		  </fieldset>
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_adm_user">User:</label>
			  <div class="controls">
				<input autocomplete="off" id="input_adm_user" name="m_user" type="text" class="input-xlarge" data-toggle="popover" data-placement="right" data-content="" required>
				<p class="help-block"></p>
			  </div>
			</div>
		  </fieldset>
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_adm_contra">Contrase&ntilde;a:</label>
			  <div class="controls">
				<input id="input_adm_contra" name="m_contra" type="password" class="input-xlarge" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required>
				<i class="confirm_contra"></i>
			  </div>
			</div>
		  </fieldset>
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_adm_confir_contra">Confirmar contrase&ntilde;a:</label>
			  <div class="controls">
				<input id="input_adm_confir_contra" type="password" class="input-xlarge" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" data-source="" required>
				<i class="confirm_contra_igual"></i>
			  </div>
			</div>
		  </fieldset>
		    <fieldset>
				<div class="control-group">
					<label class="control-label" for="input_adm_activo">Habilitado:</label>
					<div class="controls">
					<label class="checkbox">
						<input id="input_adm_activo" name="m_chek" type="checkbox" checked data-toggle="popover" data-placement="right" data-content="" >
					</label>
					</div>
				</div>
			</fieldset>
			<div class="btn_mantenimiento">
				<fieldset>
					<input type="submit" class="btn btn-primary agregar" value='Agregar' />
					<button style="cursor:no-drop;" class="btn btn-info modificar" href="javascript:;" disabled>Modificar</button>
					<button style="cursor:no-drop;" class="btn cancelar" href="javascript:;" disabled>Cancelar</button>
				</fieldset>
			</div>		
		</form>
	</div>
	<div class="response pos_right"></div>
	<div id="tabla">
		<table id="tabla_user" class="table table-striped table-bordered table-condensed table-hover table_de_2">
	    	<thead>
	      		<tr>
	      			<th style="width:4%; display:none;"></th>
	      			<th style="width:4%; display:none;"></th>
			        <th class="title_table">NOMBRE</th>
			        <th class="author_table">USUARIO</th>
			        <th style="width:4%; display:none;"></th>
			        <th class="asesor_table">ESTADO</th>
			        <th class="asesor_table">EDITAR</th>
			        <th class="asesor_table">ELIMINAR</th>
	     		</tr>
	    	</thead>
			<tbody>
				<?php foreach($usuario as $user_usuario):?>
					<tr>
						<td style="display:none;"><?php echo $user_usuario['id_usuario']?></td>		
                        <td style="display:none;"><?php echo $user_usuario['id_sujeto']?></td>
						<td><?php echo $user_usuario['sujeto']?></td>
						<td><?php echo $user_usuario['usuario']?></td>
						<td style="display:none;"><?php echo $user_usuario['contrasenia']?></td>
                        <td name="<?php echo $user_usuario['active'];?>" ><?php if($user_usuario['active']==1){
									echo 'Habilitado';}
									else {if($user_usuario['active']==0){echo 'Deshabilitado';}				
						}?></td>
						<td style="text-align:center;"><button name="bot" class="btn btn-info editar"><i class="icon-pencil icon-white"></i></button></td>
						<td style="text-align:center;"><button class="btn btn-danger eliminar"><i class="icon-fullscreen icon-white" ></i></button></td>
					 <?php  endforeach; ?>
                    </tr>
			</tbody>
		</table>
	<script>
          $(function() {
            applyPagination();
        
            function applyPagination() {
                var z;
              $("#paginacion_usuario a").click(function() {
                var pos_=$(this).parent().index();
                var pos=pos_+1;
                var url = $(this).attr("href");
                $.ajax({
                  type: "POST",
                  dataType:'json',
                  url: url,
                  beforeSend: function() {
                    $("#tabla_user").html();
                  },
                  success: function(msg) {
                    var i;var r;
                    $.each(msg,function(a,b){
                    	i=0;
                    	$.each(b,function(c,d){
                    		i++;
	                        $('#tabla_user tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_usuario);
	                        $('#tabla_user tbody tr:nth-child('+i+') td:nth-child(2)').html(d.id_sujeto);
                            $('#tabla_user tbody tr:nth-child('+i+') td:nth-child(3)').html(d.sujeto);
                            $('#tabla_user tbody tr:nth-child('+i+') td:nth-child(4)').html(d.usuario);
                            $('#tabla_user tbody tr:nth-child('+i+') td:nth-child(5)').html(d.contrasenia);
                            $('#tabla_user tbody tr:nth-child('+i+') td:nth-child(6)').html(d.active);
	                    	if($('#tabla_user tbody tr:nth-child('+i+')').is(':visible')!=true){
		                    	console.info('entraaa');
	                    		$("#tabla_user tbody tr:nth-child("+i+")").fadeIn();
	                        }    
                    	});
                   	 	if(i%5!=0){
  	                      var j=i%5;
  	                      var z=5-j;
  	                      while(z<6){
  	                      	$("#tabla_user tbody tr:nth-child("+z+")").fadeOut();
  	                      	z++;
  	                      }
  	                      r=1;
                       }
                    });
                                      
                    $('#paginacion_usuario a').parent().removeClass('active');
                    $('#paginacion_usuario li:nth-child('+pos+')').addClass('active');
                  }
                });
                return false;
              });
            }
          });
        </script>
        <div id="paginacion_usuario" class="pagination loading">
		  <ul>
		  		<?php echo $paginacion; ?>
		  </ul>
		</div>
</div>