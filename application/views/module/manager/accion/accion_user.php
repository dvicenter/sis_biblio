<?php  $acciones=array(
			array($Accion='karina',$Estado='kari'),
			array($Accion='Kelly',$Estado='Kelly'),
			array($Accion='karina',$Estado='kari'),
			array($Accion='Kelly',$Estado='Kelly'),
			array($Accion='karina',$Estado='kari'),
			array($Accion='Kelly',$Estado='Kelly'),
			array($Accion='karina',$Estado='kari'),
			array($Accion='Kelly',$Estado='Kelly'),
			);?>


<div id="rol">
	<div class="form_user">
		<form class="form-horizontal">
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input01">Accion:</label> 
			  <div class="controls">
				<input type="text" class="input-xlarge" name="input01"></i></a>
				<p class="help-block"></p>
			  </div>
			</div>
		  </fieldset>
		 <fieldset>
				<div class="control-group">
					<label class="control-label" for="input01">Estado:</label>
					<div class="controls">
					<label class="checkbox">
						<input type="checkbox">
					</label>
					</div>
				</div>
			</fieldset>
			
		</form>
	</div>
	<div class="btn_mantenimiento">
		<fieldset>
			<a class="btn btn-primary " href="">Agregar</a>
			<a class="btn btn-info" href="">Modificar</a>
			<a class="btn btn-danger" href="">Eliminar</a>
			<a class="btn " href="">Cancelar</a>
		</fieldset>
	</div>

		<div id="tabla">
		<table class="table table-striped table-bordered table-condensed table-hover">

		    <thead>
		      
		        <th class="title_table">ACCION</th>
		        <th class="estado_table">ESTADO</th>
		            
		    </thead>
			<tbody>
			
				<?php foreach($acciones as $accion){?>
				<tr>
				<td><?php echo $accion[0]?></td>
				<td><?php echo $accion[1]?></td>
				</tr>
				<?php }?>
			</tbody>
		</table>
		</div>
</div>
	