<?php foreach ($roles as $rol){?>
	<tr>
		<td class="check_table"><input type="checkbox" name="check_rol_detail" value="<?php echo $rol['id_rol'];?>"/></td>
		<td><?php echo $rol['rol'];?></td>
	</tr>
<?php }?>