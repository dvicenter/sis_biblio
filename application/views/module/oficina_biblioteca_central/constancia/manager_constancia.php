<?php  $datos=array(
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$facultad='FIISI'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$facultad='FIISI'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$facultad='FIISI'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$facultad='FIISI'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$facultad='FIISI'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$facultad='FIISI'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$facultad='FIISI'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$facultad='FIISI'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$facultad='FIISI'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$facultad='FIISI')
			);?>
<div id="module_constancia">
    <ul class="control">
      <li class="menu-control"><a href="" class="btn btn-info"><i class="icon-upload icon-white"></i> Exportar</a></li>
    </ul>
  <table class="table table-striped table-bordered table-condensed">
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox"/></th>
        <th class="title_table">Titulo</th>
        <th class="author_table">Tesista</th>
        <th class="asesor_table">Asesor</th>
        <th class="year_table">Facultad</th>
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
        	<a id="#consult_related" href="javascript:;"><button class="btn"><i class="icon-eye-open"></i></button></a>
        </td>
      </tr>
      <?php }?>
    </tbody>
  </table>
  <?php include_once 'consult_related.php';?>
</div>