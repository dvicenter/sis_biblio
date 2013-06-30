
<div id="mod_accion">
	<div class="form_user">
		<form id='form_accion' class="form-horizontal" action="">
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_man_accion">Accion:</label> 
			  <div class="controls">
				<input type="text" class="input-xlarge" name="accion" id="input_man_accion" data-toggle="popover" data-placement="right" data-content="" required />
				<input type="hidden" name="id_acc"/>
			  </div>
			</div>
		  </fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<input type="submit" class="btn btn-primary agregar" value='Agregar' >
					<a class="btn btn-info modificar" href="javascript:;" disabled>Modificar</a>
					<a class="btn cancelar" href="javascript:;" disabled>Cancelar</a>
			</fieldset>
		</div>		
		</form>
	</div>
		<div class="response pos_right">
		
	</div

		<div id="tabla">
		<table id="table_acc" class="table table-striped table-bordered table-condensed  table-hover table_de_2">

		    <thead>
				<th style="width:4%; display:none;"></th>
		        <th class="title_table">ACCION</th>
				<th style="width:2%;">EDITAR</th>
				<th style="width:2%;">ELIMINAR</th>
				
				
		    </thead>
			<tbody>
				<?php  foreach($acciones as $accion){?>
				<tr>
					<td style="display:none;"><?php echo $accion['id_accion']?></td>
					<td><?php echo $accion['accion'];?></td>
					<td style="text-align:center;"><button name="bot" class="btn btn-info editar"><i class="icon-pencil icon-white"></i></button></td>
					<td style="text-align:center;"><button class="btn btn-danger eliminar"><i class="icon-fullscreen icon-white" ></i></button></td>
				</tr>
				<?php }?>
			</tbody>
		</table>
		</div>
		<div class="pagination loading">
		  <ul name="paginador_accion">
			<li><a href="#"><</a></li>
			<li class="active">
			  <a href="#">1</a>
			</li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">></a></li>
		  </ul>
		</div>
</div>
	