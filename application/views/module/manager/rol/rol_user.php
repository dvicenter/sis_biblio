<?php  $roles=array(
			array($nombre='karina',$user='kari'),
			array($nombre='Kelly',$user='Kelly'),
			array($nombre='Cesar',$user='Cesarin'),
			array($nombre='Deyvis',$user='Dey'),
			
			);?>

<div id="rol">
<div class="form_user">
	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Rol:</label> 
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
      
        <th class="title_table">ROL</th>
        <th class="descripcion_table">DESCRIPCION</th>
            
    </thead>
	<tbody>
	
		<?php foreach($roles as $rol){?>
		<tr>
		<td><?php echo $rol[0]?></td>
		<td><?php echo $rol[1]?></td>
		</tr>
		<?php }?>
	</tbody>
</table>

</div>
</div>