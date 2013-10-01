<table id="table_tesis" class="table table-striped table-bordered table-condensed table-hover">
    <thead>
      <tr>
        <th class="title_table">Titulo</th>
        <th class="author_table">Autor</th>
        <th class="asesor_table">Asesor</th>
        <th class="year_table">A&ntilde;o</th>
        <th class="action_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody> 
			<?php foreach($tesis as $ttesis):?>
				<tr>
					<td style="display:none;"><?php echo $ttesis['id_material_bibliografico']?></td>
					<td style="display:none;"><?php echo $ttesis['id_docente']?></td>
					<td style="display:none;"><?php echo $ttesis['id_alumno']?></td>
					<td style="display:none;"><?php echo $ttesis['id_autor_interno']?></td>
					<td style="display:none;"><?php echo $ttesis['id_tipo_autor_interno']?></td>
					<td style="display:none;"><?php echo $ttesis['facultad']?></td>
					<td><?php echo $ttesis['titulo']?></td>
					<td><?php echo $ttesis['alumno']?></td>
					<td><?php echo $ttesis['docente']?></td>
					<td><?php echo $ttesis['anio']?></td>
					<td style="display:none;"><?php echo $ttesis['introduccion']?></td>
					<td style="display:none;"><?php echo $ttesis['objetivo']?></td>
					<td style="display:none;"><?php echo $ttesis['resumen']?></td>
					<td style="display:none;"><?php echo $ttesis['conclusion']?></td>
					<td>
						<button class="btn editar"><i class="icon-pencil"></i></button>
					</td>
				<?php  endforeach; ?>
                </tr>
  </tbody>
  </table>