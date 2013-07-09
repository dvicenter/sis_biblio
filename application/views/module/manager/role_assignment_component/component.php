<?php foreach ($componentes as $componente){?>
	<tr>
		<td class="check_table"><input type="checkbox" name="check_comp_detail" value="<?php echo $componente['id_componente_accion'];?>"/></td>
		<td><?php echo $componente['componente'];?></td>
		<td><?php echo $componente['accion'] ?></td>
	</tr>
<?php }?>