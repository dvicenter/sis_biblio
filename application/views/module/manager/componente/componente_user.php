<?php  $componentes=array(
			array($componente='karina',$descripcion='kari'),
			array($componente='Kelly',$descripcion='Kelly'),
			array($componente='Cesar',$descripcion='Cesarin'),
			array($componente='Deyvis',$descripcion='Dey'),
			
			);?>

<div id="componente">
<div class="form_user">
	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Componente:</label> 
		  <div class="controls">
			<input type="text" class="input-xlarge" name="input01"> <a href="#" class="btn"><i class="icon-search"></i></a>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	<fieldset>
	<div class="control-group">
		  <label class="control-label" for="input01">Descripcio&oacute;n:</label> 
		  <div class="controls">
		<textarea cols="200" id="comment_body" name="comment[body]" rows="7"></textarea>
	</fieldset>  
	  </form>
</div>

<div class="btn_mantenimiento">
	<form >
	<fieldset>
	<a class="btn btn-primary " href="">Agregar</a>
	<a class="btn btn-info" href="">Modificar</a>
	<a class="btn btn-danger" href="">Eliminar</a>
	<a class="btn " href="">Cancelar</a>
	</fieldset>
	</form>
	</div>
	

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