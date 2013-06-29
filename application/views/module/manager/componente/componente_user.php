 
<div id="mod_componente">
<div class="form_user">
	<form id="form_component" class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label name="comp" class="control-label" for="input01">Componente:</label> 
		  <div class="controls">
			<input id="input01" type="text" class="input-xlarge3" autocomplete="off" name="componente"  data-toggle="popover" data-placement="right" data-content="" required/> 
			<input type="hidden" name="id_comp"/>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	<fieldset>
	<div class="control-group">
		<label name="desc" class="control-label"  for="comment_body">Descripci&oacute;n:</label> 
		<div class="controls">
			<textarea class="text_area" cols="200" id="comment_body" name="desc_componente" rows="7" data-toggle="popover" data-placement="right" data-content=""></textarea>
		</div>
	</div>
	</fieldset>  


<div class="btn_mantenimiento">
	
	<fieldset>
	<input type="submit" class="btn btn-primary agregar" value='Agregar' href="javascript:;" >
	<a type="submit" class="btn btn-info modificar" value='Modificar' href="javascript:;">modificar</a>
	
	
	</fieldset>

	</div>
</form>
</div>	

<div id="tabla">

<table id="table_comp" class="table table-striped table-bordered table-condensed table-hover table_de_2">

    <thead>
		<th style="width:4%; display:none;"></th>
        <th class="title_table">COMPONENTE</th>
        <th class="descripcion_table">DESCRIPCION</th>
		<th class="title_table">EDITAR</th>
        <th class="descripcion_table">ELIMINAR</th>
            
    </thead>
	<tbody>
	
		<?php $i=0; 
				foreach($componentes as $componente){
					if($i<17){?>
				<tr>
					<td style="display:none;" ><?php echo $componente['id_componente']?></td>
					<td><?php echo $componente['componente']?></td>
					<td><?php echo $componente['descripcion_componente']?></td>
					<td style="text-align:center;"><button name="bot" class="btn btn-info editar"><i class="icon-pencil icon-white"></i></button></td>
					<td style="text-align:center;"><button class="btn btn-danger eliminar"><i class="icon-fullscreen icon-white" ></i></button></td>
				</tr>
			<?php }$i++;}?>
	</tbody>
</table>


</div>


</div>