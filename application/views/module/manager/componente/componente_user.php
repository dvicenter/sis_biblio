<div id="mod_componente">
	<div class="form_user">
		<form id="form_component" class="form-horizontal">
			<fieldset>
				<div class="control-group">
			  		<label class="control-label" for="input_man_componente">Componente:</label> 
			  		<div class="controls">
						<input id="input_man_componente" type="text" class="input-xlarge3" name="componente"  data-toggle="popover" data-placement="right" data-content="" autocomplete="off" required/>
						<input type="hidden" name="id_comp"/>
			  		</div>
				</div>
		  	</fieldset>
			<fieldset>
				<div class="control-group">
					<label class="control-label"  for="comment_body">Descripci&oacute;n:</label> 
					<div class="controls">
						<textarea class="text_area" cols="200" id="comment_body" name="desc_componente" rows="7" data-toggle="popover" data-placement="right" data-content=""></textarea>
					</div>
				</div>
			</fieldset>  
			<div class="btn_mantenimiento">
				<fieldset>
					<input type="submit" class="btn btn-primary agregar" value='Agregar'" >
					<button style="cursor:no-drop;" class="btn btn-info modificar" href="javascript:;" disabled>Modificar</button>
					<button style="cursor:no-drop;" class="btn cancelar" href="javascript:;" disabled>Cancelar</button>
				</fieldset>
			</div>
		</form>
	</div>
	<div class="response pos_right"></div>	
	<div id="tabla">
		<table id="table_comp" class="table table-striped table-bordered table-condensed table-hover table_de_2">
		    <thead>
		    	<tr>
					<th style="width:4%; display:none;"></th>
			        <th class="title_table">COMPONENTE</th>
			        <th class="descripcion_table">DESCRIPCION</th>
					<th class="title_table">EDITAR</th>
			        <th style="display:none;" class="descripcion_table">ELIMINAR</th>
            	</tr>
    		</thead>
			<tbody>
			<?php foreach($componentes as $componente):?>
				<tr>
					<td style="display:none;" ><?php echo $componente['id_componente']?></td>
					<td><?php echo $componente['componente']?></td>
					<td><?php echo $componente['descripcion_componente']?></td>
					<td style="text-align:center;"><button name="bot" class="btn btn-info editar"><i class="icon-pencil icon-white"></i></button></td>
					<td style="text-align:center;display:none;"><button class="btn btn-danger eliminar"><i class="icon-fullscreen icon-white" ></i></button></td>
			 <?php  endforeach; ?>
            	</tr>
		
			</tbody>
		</table><script>
          $(function() {
            applyPagination();
        
            function applyPagination() {
                var z;
              $("#paginacion_componente a").click(function() {
                var pos_=$(this).parent().index();
                var pos=pos_+1;
                var url = $(this).attr("href");
                $.ajax({
                  type: "POST",
                  dataType:'json',
                  url: url,
                  beforeSend: function() {
                    $("#table_comp").html();
                  },
                  success: function(msg) {
                    var i;var r;
                    $.each(msg,function(a,b){
                    	i=0;
                    	$.each(b,function(c,d){
                    		i++;
	                        $('#table_comp tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_componente);
	                        $('#table_comp tbody tr:nth-child('+i+') td:nth-child(2)').html(d.componente);
                            $('#table_comp tbody tr:nth-child('+i+') td:nth-child(3)').html(d.descripcion);
	                    	if($('#table_comp tbody tr:nth-child('+i+')').is(':visible')!=true){
		                    	console.info('entraaa');
	                    		$("#table_comp tbody tr:nth-child("+i+")").fadeIn();
	                        }    
                    	});
                   	 	if(i%5!=0){
  	                      var j=i%5;
  	                      var z=5-j;
  	                      while(z<6){
  	                      	$("#table_comp tbody tr:nth-child("+z+")").fadeOut();
  	                      	z++;
  	                      }
  	                      r=1;
                       }
                    });
                                      
                    $('#paginacion_componente a').parent().removeClass('active');
                    $('#paginacion_componente li:nth-child('+pos+')').addClass('active');
                  }
                });
                return false;
              });
            }
          });
        </script>
        <div id="paginacion_componente" class="pagination loading">
		  <ul>
		  		<?php echo $paginacion; ?>
		  </ul>
		</div>
</div>