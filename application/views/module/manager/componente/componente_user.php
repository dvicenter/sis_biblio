 
<div id="mod_componente">
<div class="form_user">
	<form id="form_component" class="form-horizontal" action="nuevo.php">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Componente:</label> 
		  <div class="controls">
			<input id="input01" type="text" class="input-xlarge3" name="input01"  data-toggle="popover" data-placement="right" data-content="" required> 

			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	<fieldset>
	<div class="control-group">
		<label class="control-label" for="comment_body">Descripci&oacute;n:</label> 
		<div class="controls">
			<textarea class="text_area" cols="200" id="comment_body" name="comment[body]" rows="7" data-toggle="popover" data-placement="right" data-content="" required></textarea>
		</div>
	</div>
	</fieldset>  


<div class="btn_mantenimiento">
	
	<fieldset>
	<a input type="submit" class="btn btn-primary agregar" value='Agregar' href="javascript:;">agregar</a>
	</fieldset>

	</div>
</form>
</div>	

<div id="tabla">

<table id="table_comp" class="table table-striped table-bordered table-condensed table-hover">

    <thead>
      
        <th class="title_table">COMPONENTE</th>
        <th class="descripcion_table">DESCRIPCION</th>
            
    </thead>
	<tbody>
	
		<?php $i=0; 
				foreach($componentes as $componente){
					if($i<17){?>
				<tr>
					<td><?php echo $componente['componente']?></td>
					<td><?php echo $componente['descripcion_componente']?></td>
				</tr>
			<?php }$i++;}?>
	</tbody>
</table>


</div>


</div>