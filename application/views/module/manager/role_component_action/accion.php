<?php foreach ($acciones as $accion){?>
	<tr>
		<td class="check_table"><input type="checkbox" name="check_accion_detail" value="<?php echo $accion['id_accion'];?>"/></td>
		<td><?php echo $accion['accion'];?></td>
	</tr>
<?php }?>