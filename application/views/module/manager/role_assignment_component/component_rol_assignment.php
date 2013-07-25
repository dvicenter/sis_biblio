<?php foreach($roles_componentes as $rol_componente){?>
	<tr>
		<td class="check_table"><input type="checkbox" name="ckeck_rol_comp_detail" value="<?php echo $rol_componente['id_rol_componente_accion']?>"/></td>
		<td><?php echo $rol_componente['componente']?></td>
		<td><?php echo $rol_componente['accion']?></td>
		<td style="display:none;"><?php echo $rol_componente['id_componente_accion']?></td>

	</tr>
<?php }?>