
<div id="mod_accion">
	<div class="form_user">
		<form class="form-horizontal" action="">
		  <fieldset>
			<div class="control-group">
			  <label class="control-label" for="input_man_accion">Accion:</label> 
			  <div class="controls">
				<input type="text" class="input-xlarge" id="input_man_accion" name="input_man_accion" required />
			  </div>
			</div>
		  </fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<a class="btn btn-primary agregar" value="Agregar" href="javascript:;">agregar</a>
			</fieldset>
		</div>		
		</form>
	</div>


		<div id="tabla">
		<table id="table_acc" class="table table-striped table-bordered table-condensed table-hover">

		    <thead>
		        <th class="title_table">ACCION</th>
		    </thead>
			<tbody>
				<?php $i=0; foreach($acciones as $accion){
					if($i<17){?>
				<tr>
				<td><?php  
					echo $accion['accion'];?></td>
				</tr>
				<?php $i++;}}?>
			</tbody>
		</table>
		</div>
</div>
	