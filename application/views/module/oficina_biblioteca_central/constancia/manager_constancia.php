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
<script src="/sis_biblio/resource/myjs/solicitud_constancia.js" type="text/javascript"></script>
<div id="module_constancia">
    <ul class="control">
      <li class="menu-control"><button class="btn btn-info" disabled><i class="icon-upload icon-white"></i>Exportar</button></li>
    </ul>
  <table class="table table-striped table-bordered table-condensed table-hover" id="solicitud_constancia">
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox"/></th>
        <th class="title_table">Titulo</th>
        <th class="author_table">Tesista</th>
        <th class="asesor_table">Asesor</th>
        <th class="year_table">Escuela</th>
        <th class="action_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($planes_tesis as $plan_tesis){?>
      <tr>
        <td class="check_table"><input type="checkbox"/></td>
        <td style="display:none;"><?php echo $plan_tesis['id_plan_tesis'];?></td>
        <td><?php echo $plan_tesis['titulo'];?></td>
        <td><?php echo $plan_tesis['tesista'];?></td>
        <td><?php echo $plan_tesis['asesor'];?></td>
        <td><?php echo $plan_tesis['abreaviatura_escuela'];?></td>
        <td>
        	<a class="comparation" href="javascript:;" data-toggle="modal" ><button class="btn"><i class="icon-eye-open"></i></button></a>
        </td>
      </tr>
      <?php }?>
    </tbody>
  </table>
  <?php include_once 'consult_related.php';?>
</div>