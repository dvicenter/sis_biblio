<div id="mod_rol">
<div class="form_user">
	<form id="form_rol" class="form-horizontal" action="">
		 <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_man_rol">Rol:</label> 
			  <div class="controls">
				<input type="text" class="input-xlarge3" name="rol" id="input_man_rol" data-toggle="popover" data-placement="right" data-content="" required>
			  </div>
			</div>
		 </fieldset>
		</fieldset>
		<div class="control-group">
			 <label class="control-label" for="inpur_man_descripcion">Descripci&oacute;n:</label> 
			 <div class="controls">
				<textarea class="text_area" cols="200" id="inpur_man_descripcion" name="textarea" rows="7" data-toggle="popover" data-placement="right" data-content=""></textarea>
			</div>
		</div>
		</fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<a class="btn btn-primary agregar" href="javascript:;">Agregar</a>
				<button class="btn btn-info "><i class="icon-refresh icon-white"></i></button>
				<button class="btn btn-danger "><i class="icon-fullscreen icon-white"></i></button>
			</fieldset>
		</div>    
	</form>
</div>

<div id="tabla">
	<table id="table_aum" class="table table-striped table-bordered table-condensed table-hover table_de_2">
	    <thead>
	        <th class="title_table">ROL</th>
	        <th class="descripcion_table">DESCRIPCI&Oacute;N</th>
			<th class="title_table">EDITAR</th>
	        <th class="descripcion_table">ELIMINAR</th>
	    </thead>
		<tbody> 
			<?php $i=0; 
				foreach($roles as $rol){
					if($i<17){?>
				<tr onclick="llamar(<?php echo $rol['id_rol'];?>);">
					<td><?php echo $rol['rol']?></td>
					<td><?php echo $rol['descripcion']?></td>
					<td style="text-align:center;"><button class="btn btn-info "><i class="icon-pencil icon-white"></i></button></td>
					<td style="text-align:center;"><button class="btn btn-danger "><i class="icon-fullscreen icon-white"></i></button></td>
				</tr>
			<?php }$i++;}?>
		</tbody>
	</table>
	</div>
</div>