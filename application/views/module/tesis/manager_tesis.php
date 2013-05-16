<?php  $datos=array(
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013')
			);?>
<div id="module_tesis">
<table class="table table-striped table-bordered table-condensed">
  <thead>
    <tr>
      <th class="check_table"><input type="checkbox"/></th>
      <th class="title_table">Titulo</th>
      <th class="author_table">Autor</th>
      <th class="asesor_table">Asesor</th>
      <th class="year_table">A&ntilde;o</th>
      <th class="action_table">Acci&oacute;n</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach($datos as $dato){?>
    <tr>
      <td class="check_table"><input type="checkbox"/></td>
      <td><?php echo $dato[0];?></td>
      <td><?php echo $dato[1];?></td>
      <td><?php echo $dato[2];?></td>
      <td><?php echo $dato[3];?></td>
      <td>
      	<button class="btn"><i class="icon-pencil"></i></button>
      </td>
    </tr>
    <?php }?>
  </tbody>
</table>
</div>