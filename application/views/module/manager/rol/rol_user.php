<div id="mod_rol">
<div class="form_user">
	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input_man_rol">Rol:</label> 
		  <div class="controls">
			<input type="text" class="input-xlarge3" name="rol" id="input_man_rol" requerid>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	<fieldset>
	<div class="control-group">
		  <label class="control-label" for="inpur_man_descripcion">Descripci&oacute;n:</label> 
		  <div class="controls">
		<textarea class="text_area" cols="200" id="inpur_man_descripcion" name="textarea" rows="7" requerid></textarea>
	</fieldset>  
	  </form>
</div>
<div class="btn_mantenimiento">
	<fieldset>
		<a class="btn btn-primary agregar" class="btn btn-primary " href="javascript:;">Agregar</a>
		<a class="btn btn-info" href="">Modificar</a>
		<a class="btn btn-danger" href="">Eliminar</a>
	</fieldset>
</div>
<div id="tabla">
	<table id="table_aum" class="table table-striped table-bordered table-condensed table-hover table_de_2">
	    <thead>
	        <th class="title_table">ROL</th>
	        <th class="descripcion_table">DESCRIPCI&Oacute;N</th>
	    </thead>
		<tbody> 
			<?php $i=0; 
				foreach($roles as $rol){
					if($i<17){?>
				<tr>
					<td><?php echo $rol['rol']?></td>
					<td><?php echo $rol['descripcion']?></td>
				</tr>
			<?php }$i++;}?>
		</tbody>
	</table>
	</div>
</div>