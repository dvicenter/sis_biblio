
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
				<a input type="submit" class="btn btn-primary agregar" value='Agregar' href="javascript:;">agregar</a>
				<a input type="submit" class="btn btn-primary modificar" value='Modificar' href="javascript:;">modificar</a>
			</fieldset>
		</div>		
		</form>
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
				<?php $i=0; foreach($acciones as $accion){
					if($i<10){?>
				<tr>
					<td style="display:none;"><?php echo $accion['id_accion']?></td>
					<td><?php echo $accion['accion'];?></td>
					<td  style="text-align:center;"><button class="btn btn-info editar "><i class="icon-pencil icon-white"></i></button></td>
					<td  style="text-align:center;"><button class="btn btn-danger "><i class="icon-fullscreen icon-white"></i></button></td>
				</tr>
				<?php $i++;}}?>
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
	