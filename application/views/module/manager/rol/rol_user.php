<div id="mod_rol">
<div class="form_user">
	<form id="form_rol" class="form-horizontal" action="">
		 <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_man_rol">Rol:</label> 
			  <div class="controls">
				<input autocomplete="off" type="text" class="input-xlarge3" name="rol" id="input_man_rol" data-toggle="popover" data-placement="right" data-content="" required>
			  <input type="hidden" name="id-rol"/>
			  </div>
			</div>
		 </fieldset>
		<fieldset>
		<div class="control-group">
			 <label class="control-label" for="inpur_man_descripcion">Descripci&oacute;n:</label> 
			 <div class="controls">
				<textarea class="text_area" cols="200" id="inpur_man_descripcion" name="text_rol" rows="7" data-toggle="popover" data-placement="right" data-content=""></textarea>
			</div>
		</div>
		</fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<input type="submit" class="btn btn-primary agregar" value="Agregar" />
				<button style="cursor:no-drop;" class="btn btn-info modificar" href="javascript:;" disabled>Modificar</button>
				<button style="cursor:no-drop;" class="btn cancelar" href="javascript:;" disabled>Cancelar</button>
			</fieldset>
		</div>    
	</form>
</div>
<div class="response pos_right">
		
	</div>
<div id="tabla">
	<table id="table_aum" class="table table-striped table-bordered table-condensed table-hover table_de_2">
	    <thead>
	    	<tr>
				<th style="width:4%; display:none;"></th>
		        <th class="title_table">ROL</th>
		        <th class="descripcion_table">DESCRIPCI&Oacute;N</th>
				<th class="title_table">EDITAR</th>
		        <th class="descripcion_table">ELIMINAR</th>
	        </tr>
	    </thead>
		<tbody> 
			<?php foreach($roles as $rol):?>
				<tr>
					<td style="display:none;"><?php echo $rol['id_rol']?></td>
					<td><?php echo $rol['rol']?></td>
					<td><?php echo $rol['descripcion']?></td>
					<td style="text-align:center;"><button class="btn btn-info editar"><i class="icon-pencil icon-white"></i></button></td>
					<td style="text-align:center;"><button class="btn btn-danger eliminar"><i class="icon-fullscreen icon-white"></i></button></td>
				    <?php  endforeach; ?>
                </tr>
		</tbody>
	</table><script>
          $(function() {
            applyPagination();
        
            function applyPagination() {
                var z;
              $("#paginacion_rol a").click(function() {
                var pos_=$(this).parent().index();
                var pos=pos_+1;
                var url = $(this).attr("href");
                $.ajax({
                  type: "POST",
                  dataType:'json',
                  url: url,
                  beforeSend: function() {
                    $("#table_aum").html();
                  },
                  success: function(msg) {
                    var i;var r;
                    $.each(msg,function(a,b){
                    	i=0;
                    	$.each(b,function(c,d){
                    		i++;
	                        $('#table_aum tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_rol);
	                        $('#table_aum tbody tr:nth-child('+i+') td:nth-child(2)').html(d.rol);
                            $('#table_aum tbody tr:nth-child('+i+') td:nth-child(3)').html(d.descripcion);
	                    	if($('#table_aum tbody tr:nth-child('+i+')').is(':visible')!=true){
		                    	console.info('entraaa');
	                    		$("#table_aum tbody tr:nth-child("+i+")").fadeIn();
	                        }    
                    	});
                   	 	if(i%5!=0){
  	                      var j=i%5;
  	                      var z=5-j;
  	                      while(z<6){
  	                      	$("#table_aum tbody tr:nth-child("+z+")").fadeOut();
  	                      	z++;
  	                      }
  	                      r=1;
                       }
                    });
                                      
                    $('#paginacion_rol a').parent().removeClass('active');
                    $('#paginacion_rol li:nth-child('+pos+')').addClass('active');
                  }
                });
                return false;
              });
            }
          });
        </script>
        <div id="paginacion_rol" class="pagination loading">
		  <ul>
		  		<?php echo $paginacion; ?>
		  </ul>
		</div>
</div>