<?php  $user=array(
			array($nombre='karina',$user='kari',$estado='activo'),
			array($nombre='Kelly',$user='Kelly',$estado='desactivado'),
			array($nombre='Cesar',$user='Cesarin',$estado='activo'),
			array($nombre='Deyvis',$user='Dey',$estado='activo'),
			
			);?>

<div id="manager_user">
	<form class="form-horizontal">
	<div class="form_user">		
	  <fieldset>
		<div class="control-group">
			<div class="controls">
			<input type="file" required></div>
			<p class="help-block"></p>
		</div>
	  </fieldset>
	</div>	

	<div class="btn_voucher">
		<fieldset>
			<a class="btn btn-primary " href="">Cargar</a>
		</fieldset>
	</div>
	  

	</form>
	

<div id="tabla">

<table class="table table-striped table-bordered table-condensed table-hover">

    <thead>
      
        <th class="title_table">CAMPO 1</th>
        <th class="author_table">CAMPO 2</th>
        <th class="asesor_table">CAMPO 3</th>
     
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