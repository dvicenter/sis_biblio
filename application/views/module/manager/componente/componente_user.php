<?php  $componentes=array(
			array($componente='karina',$descripcion='kari'),
			array($componente='Kelly',$descripcion='Kelly'),
			array($componente='Cesar',$descripcion='Cesarin'),
			array($componente='Deyvis',$descripcion='Dey'),
			array($componente='karina',$descripcion='kari'),
			array($componente='Kelly',$descripcion='Kelly'),
			array($componente='Cesar',$descripcion='Cesarin'),
			array($componente='Deyvis',$descripcion='Dey'),
			
			);?>
 
<div id="componente">
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
	</fieldset>  
</div>

<div class="btn_mantenimiento">
	
	<fieldset>
	<input type="submit" class="btn btn-primary" value='Agregar'/>
	</fieldset>

	</div>
</form>
	

<div id="tabla">

<table class="table table-striped table-bordered table-condensed table-hover">

    <thead>
      
        <th class="title_table">COMPONENTE</th>
        <th class="descripcion_table">DESCRIPCION</th>
            
    </thead>
	<tbody>
	
		<?php foreach($componentes as $componente){?>
		<tr>
		<td><?php echo $componente[0]?></td>
		<td><?php echo $componente[1]?></td>
		</tr>
		<?php }?>
	</tbody>
</table>


</div>


</div>