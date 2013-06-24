<div id="mod_rol">
<div class="form_user">
	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Rol:</label> 
		  <div class="controls">
			<input type="text" class="input-xlarge3" name="rol">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	<fieldset>
	<div class="control-group">
		  <label class="control-label" for="input01">Descripci&oacute;n:</label> 
		  <div class="controls">
		<textarea class="text_area" cols="200" id="comment_body" name="textarea" rows="7"></textarea>
	</fieldset>  
	  </form>
</div>

<div class="btn_mantenimiento">
	<form >
	<fieldset>
	<a class="btn btn-primary agregar" class="btn btn-primary " href="javascript:;">Agregar</a>
	<a class="btn btn-info" href="">Modificar</a>
	<a class="btn btn-danger" href="">Eliminar</a>
	<a class="btn " href="">Cancelar</a>
	</fieldset>
	</form>
	</div>
	
	<div id="tabla">

	<table id="table_aum" class="table table-striped table-bordered table-condensed table-hover table_de_2">

	    <thead>
	      
	        <th class="title_table">ROL</th>
	        <th class="descripcion_table">DESCRIPCION</th>
	            
	    </thead>
		<tbody> 
		
			<?php foreach($roles as $rol){?>
			<tr>
			<td><?php echo $rol['rol']?></td>
			<td><?php echo $rol['descripcion']?></td>
			</tr>
			<?php }?>
		</tbody>
	</table>

	</div>
</div>