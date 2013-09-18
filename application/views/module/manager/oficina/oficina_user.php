<div id="mod_oficina">
	<div class="form_user">
		<form id="form_oficina" class="form-horizontal">
			<fieldset>
				<div class="control-group">
			  		<label class="control-label" for="input_man_oficina">Oficina:</label> 
			  		<div class="controls">
						<input maxlength="50" id="input_man_oficina" type="text" class="input-xlarge3" name="oficina"  data-toggle="popover" data-placement="right" data-content="" autocomplete="off" required/>
						<input type="hidden" name="id_ofi"/>
			  		</div>
				</div>
		  	</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label"  for="comment_body">Descripci&oacute;n:</label> 
					<div class="controls">
						<textarea class="text_area" cols="200" id="body_oficina" name="desc_oficina" rows="7" data-toggle="popover" data-placement="right" data-content=""></textarea>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="input_adm_activo">Habilitado:</label>
					<div class="controls">
					<label class="checkbox">
						<input id="input_ofi" name="ofi_chek" type="checkbox" checked data-toggle="popover" data-placement="right" data-content="" >
					</label>
					</div>
				</div>
			</fieldset>  
			<div class="btn_mantenimiento">
				<fieldset>
					<input type="submit" class="btn btn-primary agregar" value='Agregar'>
					<button style="cursor:no-drop;" class="btn btn-info modificar" href="javascript:;" disabled>Modificar</button>
					<button style="cursor:no-drop;" class="btn cancelar" href="javascript:;" disabled>Cancelar</button>
				</fieldset>
			</div>
		</form>
	</div>
	<div class="response pos_right"></div>	
	<div id="tabla">
		<table id="table_oficina" class="table table-striped table-bordered table-condensed table-hover table_de_2">
		    <thead>
		    	<tr>
					<th style="width:4%; display:none;"></th>
			        <th class="title_table">OFICINA</th>
			        <th class="descripcion_table">DESCRIPCION</th>
			        <th class="descripcion_table">ESTADO</th>
					<th class="title_table">EDITAR</th>
			        <th style="class="descripcion_table">ELIMINAR</th>
            	</tr>
    		</thead>
			<tbody>
			<?php foreach($oficinas as $oficina):?>
				<tr>
					<td style="display:none;" ><?php echo $oficina['id_oficina']?></td>
					<td><?php echo $oficina['oficina']?></td>
					<td><?php echo $oficina['descripcion_oficina']?></td>
					<td name="<?php echo $oficina['activo'];?>" ><?php if($oficina['activo']==1){
									echo 'Habilitado';}
									else {if($oficina['activo']==0){echo 'Deshabilitado';}				
						}?></td>
					<td style="text-align:center;"><button name="bot" class="btn btn-info editar"><i class="icon-pencil icon-white"></i></button></td>
					<td style="text-align:center;"><button class="btn btn-danger eliminar"><i class="icon-fullscreen icon-white" ></i></button></td>
			 <?php  endforeach; ?>
            	</tr>
		
			</tbody>
		</table><script>
          $(function() {
            applyPagination();
        
            function applyPagination() {
                var z;
              $("#paginacion_oficina a").click(function() {
                var pos_=$(this).parent().index();
                var pos=pos_+1;
                var url = $(this).attr("href");
                $.ajax({
                  type: "POST",
                  dataType:'json',
                  url: url,
                  beforeSend: function() {
                    $("#table_oficina").html();
                  },
                  success: function(msg) {
                    var i;var r;
                    $.each(msg,function(a,b){
                    	i=0;
                    	$.each(b,function(c,d){
                    		i++;
	                        $('#table_oficina tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_oficina);
	                        $('#table_oficina tbody tr:nth-child('+i+') td:nth-child(2)').html(d.oficina);
                            $('#table_oficina tbody tr:nth-child('+i+') td:nth-child(3)').html(d.descripcion_oficina);
                            $('#table_oficina tbody tr:nth-child('+i+') td:nth-child(4)').html(d.activo);
	                    	if($('#table_oficina tbody tr:nth-child('+i+')').is(':visible')!=true){
	                    		$("#table_oficina tbody tr:nth-child("+i+")").fadeIn();
	                        }    
                    	});
                   	 	if(i%5!=0){
  	                      var j=i%5;
  	                      var z=j+1;
  	                      while(z<6){
  	                      	$("#table_oficina tbody tr:nth-child("+z+")").fadeOut();
  	                      	z++;
  	                      }
  	                      r=1;
                       }
                    });
                                      
                    $('#paginacion_oficina a').parent().removeClass('activo');
                    $('#paginacion_oficina li:nth-child('+pos+')').addClass('activo');
                  }
                });
                return false;
              });
            }
          });
        </script>
        <div id="paginacion_oficina" class="pagination loading">
		  <ul>
		  		<?php echo $paginacion; ?>
		  </ul>
		</div>
</div>