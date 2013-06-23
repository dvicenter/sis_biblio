<?php  $user=array(
			array($nombre='karina',$user='kari',$estado='activo'),
			array($nombre='Kelly',$user='Kelly',$estado='desactivado'),
			array($nombre='Cesar',$user='Cesarin',$estado='activo'),
			array($nombre='Deyvis',$user='Dey',$estado='activo'),
			
			);?>

<div id="manager_user">
<div class="form_user">
	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Sujeto:</label> 
		  <div class="controls">
			<input type="text" class="input-xlarge" id="input01"> <a href="#" class="btn"><i class="icon-search"></i></a>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	</form>

	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">User:</label>
		  <div class="controls">
			<input type="text" class="input-xlarge" id="input01">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	</form>

	<form class="form-horizontal">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Contra&ntilde;a:</label>
		  <div class="controls">
			<input type="text" class="input-xlarge" id="input01">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	</form>

	<form class="form-horizontal">
	    <fieldset>
			<div class="control-group">
				<label class="control-label" for="input01">Activo:</label>
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
      
        <th class="title_table">NOMBRE</th>
        <th class="author_table">USUARIO</th>
        <th class="asesor_table">ESTADO</th>
     
    </thead>
	<tbody>
	
		<?php foreach($user as $user_usuario){?>
		<tr>
		<td><?php echo $user_usuario[0]?></td>
		<td><?php echo $user_usuario[1]?></td>
		<td><?php echo $user_usuario[2]?></td>
		</tr>
		<?php }?>
	</tbody>
</table>

</div>
<div class="pagination loading">
  <ul>
    <li><a href="#">←</a></li>
    <li class="active">
      <a href="#">1</a>
    </li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">→</a></li>
  </ul>
</div>
</div>