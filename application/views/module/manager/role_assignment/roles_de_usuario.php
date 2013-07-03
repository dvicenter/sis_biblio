
	<?php foreach($usuarios_roles as $usuario_rol){?>
		<tr>
			<td class="check_table"><input type="checkbox"/></td>
			<td> <?php echo $usuario_rol['rol']?></td>
		</tr>
		<?php }?>