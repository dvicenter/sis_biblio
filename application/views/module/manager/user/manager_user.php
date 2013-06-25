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
			<input type="text" class="input-xlarge" required> <a href="#" class="btn"><i class="icon-search"></i></a>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">User:</label>
		  <div class="controls">
			<input type="text" class="input-xlarge" required>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label" for="input01">Contrase&ntilde;a:</label>
		  <div class="controls">
			<input type="text" class="input-xlarge" required>
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	    <fieldset>
			<div class="control-group">
				<label class="control-label" for="input01">Activo:</label>
				<div class="controls">
				<label class="checkbox">
					<input type="checkbox" required>
				</label>
				</div>
			</div>
		</fieldset>
		<div class="btn_mantenimiento">
			<fieldset>
				<input class="btn btn-primary " type="submit" value="Agregar" />
			</fieldset>
		</div>		
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