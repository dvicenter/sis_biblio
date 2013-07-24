
<div id="mod_accion">
	<div class="form_user">
		<form id='form_accion' class="form-horizontal" action="">
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_man_accion">Accion:</label> 
			  <div class="controls">
				<input maxlength="10" autocomplete="off" type="text" class="input-xlarge" name="accion" id="input_man_accion" data-toggle="popover" data-placement="right" data-content="" required />
				<input type="hidden" name="id_acc"/>
			  </div>
			</div>
		  </fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<input type="submit" class="btn btn-primary agregar" value='Agregar' >
				<button style="cursor:no-drop;" class="btn btn-info modificar" href="javascript:;" disabled>Modificar</button>
				<button style="cursor:no-drop;" class="btn cancelar" href="javascript:;" disabled>Cancelar</button>
			</fieldset>
		</div>		
		</form>
	</div>
		<div class="response pos_right">
		
	</div>

		<div id="tabla">
		<table id="table_acc" class="table table-striped table-bordered table-condensed  table-hover table_de_2">

		    <thead>
				<th style="width:4%; display:none;"></th>
		        <th class="title_table">ACCION</th>
				<th style="width:2%;">EDITAR</th>
				<th style="width:2%;">ELIMINAR</th>
				
				
		    </thead>
			<tbody>
				<?php foreach($accion as $acc):?>
				<tr>
    				<td style="display:none;"><?php echo $acc['id_accion']?></td>
  					<td><?php echo $acc['accion']?></td>
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
              $("#paginacion_accion a").click(function() {
                var pos_=$(this).parent().index();
                var pos=pos_+1;
                var url = $(this).attr("href");
                $.ajax({
                  type: "POST",
                  dataType:'json',
                  url: url,
                  beforeSend: function() {
                    $("#table_acc").html();
                  },
                  success: function(msg) {
                    var i;var r;
                    $.each(msg,function(a,b){
                    	i=0;
                    	$.each(b,function(c,d){
                    		i++;
	                        $('#table_acc tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_accion);
	                        $('#table_acc tbody tr:nth-child('+i+') td:nth-child(2)').html(d.accion);
	                    	if($('#table_acc tbody tr:nth-child('+i+')').is(':visible')!=true){
		                    	console.info('entraaa');
	                    		$("#table_acc tbody tr:nth-child("+i+")").fadeIn();
	                        }    
                    	});
                   	 	if(i%5!=0){
  	                      var j=i%5;
  	                      var z=j+1;
  	                      while(z<6){
  	                      	$("#table_acc tbody tr:nth-child("+z+")").fadeOut();
  	                      	z++;
  	                      }
  	                      r=1;
                       }
                    });
                    
                   
                    $('#paginacion_accion a').parent().removeClass('active');
                    $('#paginacion_accion li:nth-child('+pos+')').addClass('active');
                  }
                });
                return false;
              });
            }
          });
        </script>
        <div id="paginacion_accion" class="pagination loading">
		  <ul>
		  		<?php echo $paginacion; ?>
		  </ul>
		</div>
</div>
        
	