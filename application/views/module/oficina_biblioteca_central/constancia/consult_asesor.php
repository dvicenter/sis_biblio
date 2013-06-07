<?php  $consults_asesor=array(
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013'),
			array($titulo='Consultoria a la empresa FutgolPeru',$bachiller='Piero Alva Solo',$asesor='Ing. Kelly Grados Manrique',$anio='2013'),
			array($titulo='Creaci&oacute;n del sistema web',$bachiller='Lionel Messi Ronaldo',$asesor='Ing. Karina Gonzales Angulo',$anio='2013'),
			array($titulo='Implementaci&oacute;n de un sistema de informaci&oacute;n',$bachiller='Mariafernanda Nicho Alvarado',$asesor='Ing. Cesar Nicho Diaz',$anio='2013'),
			array($titulo='Sistema web a medidas',$bachiller='Alexander Nicho Alvarado',$asesor='Ing. Deyvis Valladares',$anio='2013')
			);?>
<div id="consult_asesor">
	<table class="table table-striped table-bordered table-condensed table-hover">
    <thead>
      <tr>
        <th class="title_table">Titulo</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($consults_asesor as $consult_asesor){?>
      <tr>
        <td><?php echo $consult_asesor[0];?></td>
      </tr>
      <?php }?>
    </tbody>
  </table>
	<ul style="margin-top: 25px;" class="nav nav-tabs">
		  <li class="active"><a href="#introduccion_ases" data-toggle="tab">Introducci&oacute;n</a></li>
		  <li><a href="#objetivo_ases" data-toggle="tab">Objetivo</a></li>
		  <li><a href="#resumen_ases" data-toggle="tab">Resumen</a></li>
		  <li><a href="#conclusion_ases" data-toggle="tab">Conclusi&oacute;n</a></li>
	</ul>
	<div class="tab-content">
          <div class="tab-pane active" id="introduccion_ases">
            <textarea name="introduccion" rows="5" placeholder="Escriba su INTRODUCCION aqui..."></textarea>
        </div>
        <div class="tab-pane" id="objetivo_ases">
            <textarea name="objetivo" rows="5" placeholder="Escriba su OBJETIVO aqui..."></textarea>
        </div>
        <div class="tab-pane" id="resumen_ases">
            <textarea name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..."></textarea>
        </div>
        <div class="tab-pane" id="conclusion_ases">
            <textarea name="conclusion" rows="5" placeholder="Escriba su CONCLUSION aqui..."></textarea>
    	</div>
	</div>
</div>