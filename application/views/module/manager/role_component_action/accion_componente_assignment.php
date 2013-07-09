<?php foreach($componentes_accion as $componente_accion){?>
	<tr>
		<td class="check_table"><input type="checkbox" name="check_componente_accion_detail" value="<?php echo $componente_accion['id_componente_accion']?>"/></td>
		<td><?php echo $componente_accion['accion']?></td>
		<td style="display:none;"><?php echo $componente_accion['id_accion']?></td>
	</tr>
<?php }?>