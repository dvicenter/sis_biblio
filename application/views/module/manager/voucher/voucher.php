<?php  $user=array(
			array($nombre='karina',$user='kari',$estado='activo'),
			array($nombre='Kelly',$user='Kelly',$estado='desactivado'),
			array($nombre='Cesar',$user='Cesarin',$estado='activo'),
			array($nombre='Deyvis',$user='Dey',$estado='activo'),
			
			);?>

<div id="voucher">
	<form id="form_voucher" class="form-horizontal" enctype="multipart/form-data">
	<div class="form_user">		
	  <fieldset class="pos_left">
		<div class="control-group">
			<div class="controls">
			<input id="input_control" type="file" data-toggle="popover" data-placement="bottom" data-content="" required></div>
			<p class="help-block"></p>
		</div>
	  </fieldset>
	  <fieldset class="btn_voucher pos_right">
			<input class="btn btn-primary " type="submit" value="Cargar">
	</fieldset>
	</div>	

	<div >
		
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
    <li><a href="#"></a></li>
    <li class="active">
      <a href="#">1</a>
    </li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#"></a></li>
  </ul>
</div>
</div>