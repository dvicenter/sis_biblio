<div id="consult_asesor">
	<div class="table_dates_">
		<table class="table table-striped table-bordered table-condensed table-hover">
		    <thead>
		      <tr>
		        <th class="title_table">Titulo</th>
		      </tr>
		    </thead>
		    <?php $j=0;?>
		    <tbody>
		    <?php foreach($consults_asesor as $consult_asesor){
		    	if($j>2){?><script>$(function(){$('#consult_asesor table tbody').addClass('three_dates');});</script> <?php }?>
		      <tr>
		      	<td style="display:none"><?php echo $consult_asesor['id_material_bibliografico'];?></td>
		      	<td style="display:none"><?php echo $consult_asesor['introduccion'];?></td>
		      	<td style="display:none"><?php echo $consult_asesor['objetivo'];?></td>
		      	<td style="display:none"><?php echo $consult_asesor['resumen'];?></td>
		      	<td style="display:none"><?php echo $consult_asesor['conclusion'];?></td>
		        <td><?php echo $consult_asesor['titulo'];?></td>
		      </tr>
		      <?php $j++;}?>
		    </tbody>
	  	</table>
  	</div>
	<ul style="margin-top: 19px;" class="nav nav-tabs">
		  <li class="active"><a href="#introduccion_ases" data-toggle="tab">Introducci&oacute;n</a></li>
		  <li><a href="#objetivo_ases" data-toggle="tab">Objetivo</a></li>
		  <li><a href="#resumen_ases" data-toggle="tab">Resumen</a></li>
	</ul>
	<div class="tab-content">
          <div class="tab-pane active" id="introduccion_ases">
            <textarea name="introduccion" rows="5" placeholder="Escriba su INTRODUCCION aqui..." disabled></textarea>
        </div>
        <div class="tab-pane" id="objetivo_ases">
            <textarea name="objetivo" rows="5" placeholder="Escriba su OBJETIVO aqui..." disabled></textarea>
        </div>
        <div class="tab-pane" id="resumen_ases">
            <textarea name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..." disabled></textarea>
        </div>
	</div>
</div>