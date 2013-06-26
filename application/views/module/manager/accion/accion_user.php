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
		<form class="form-horizontal" action="">
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_man_accion">Accion:</label> 
			  <div class="controls">
				<input type="text" class="input-xlarge" id="input_man_accion" required />
			  </div>
			</div>
		  </fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<input class="btn btn-primary " type="submit" value="Agregar"/>
			</fieldset>
		</div>		
		</form>
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
	