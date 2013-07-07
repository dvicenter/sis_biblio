<?php foreach($usuarios_roles as $usuario_rol){?>
	<tr>
		<td class="check_table"><input type="checkbox" name="ckeck_rol_user_detail" value="<?php echo $usuario_rol['id_usuario_rol']?>"/></td>
		<td><?php echo $usuario_rol['rol']?></td>
		<td style="display:none;"><?php echo $usuario_rol['id_rol']?></td>
	</tr>
<?php }?>