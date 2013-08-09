<script src="<?php echo base_url()?>resource/myjs/solicitud_constancia.js" type="text/javascript"></script>
<div id="module_constancia">
    <ul class="control">
      <li class="menu-control"><button class="btn btn-info" disabled><i class="icon-upload icon-white"></i>Exportar</button></li>
    </ul>
  <table class="table table-striped table-bordered table-condensed table-hover" id="solicitud_constancia">
    <thead>
      <tr>
        <th style="display:none;" class="check_table"><input type="checkbox"/></th>
        <th class="title_table">Titulo</th>
        <th class="author_table">Solicitante</th>
        <th class="asesor_table">Asesor</th>
        <th class="year_table">Escuela</th>
        <th class="action_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach($solicitud as $plan_tesis):?>
      <tr>
        
        <td style="display:none;"><?php echo $plan_tesis['id_plan_tesis']?></td>
        <td><?php echo $plan_tesis['titulo'];?></td>
        <td><?php echo $plan_tesis['solicitante'];?></td>
        <td><?php echo $plan_tesis['asesor'];?></td>
        <td><?php echo $plan_tesis['abreaviatura_escuela'];?></td>
        <td>
        	<a class="comparation" href="javascript:;" data-toggle="modal" ><button class="btn"><i class="icon-eye-open"></i></button></a>
        </td>
		<?php  endforeach; ?>
      </tr>
    </tbody>
  </table>
    <script>
          $(function() {
            applyPagination();
        
            function applyPagination() {
                var z;
              $("#paginacion_solicitud a").click(function() {
                var pos_=$(this).parent().index();
                var pos=pos_+1;
                var url = $(this).attr("href");
                $.ajax({
                  type: "POST",
                  dataType:'json',
                  url: url,
                  beforeSend: function() {
                    $("#solicitud_constancia").html();
                  },
                  success: function(msg) {
                    var i;var r;
                    $.each(msg,function(a,b){
                    	i=0;
                    	$.each(b,function(c,d){
                    		i++;
	                        $('#solicitud_constancia tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_plan_tesis);
							$('#solicitud_constancia tbody tr:nth-child('+i+') td:nth-child(2)').html(d.titulo);
							$('#solicitud_constancia tbody tr:nth-child('+i+') td:nth-child(3)').html(d.solicitante);
							$('#solicitud_constancia tbody tr:nth-child('+i+') td:nth-child(4)').html(d.asesor);
							$('#solicitud_constancia tbody tr:nth-child('+i+') td:nth-child(5)').html(d.abreaviatura_escuela);
	                    	if($('#solicitud_constancia tbody tr:nth-child('+i+')').is(':visible')!=true){
	                    		$("#solicitud_constancia tbody tr:nth-child("+i+")").fadeIn();
	                        }    
                    	});
                   	 	if(i%10!=0){
  	                      var j=i%10;
  	                      var z=j+1;
  	                      while(z<11){
  	                      	$("#solicitud_constancia tbody tr:nth-child("+z+")").fadeOut();
  	                      	z++;
  	                      }
  	                      r=1;
                       }
                    });
                                      
                    $('#paginacion_solicitud a').parent().removeClass('active');
                    $('#paginacion_solicitud li:nth-child('+pos+')').addClass('active');
                  }
                });
                return false;
              });
            }
          });
        </script>
		<div id="paginacion_solicitud" class="pagination loading">
		  <ul>
		  		<?php echo $paginacion; ?>
		  </ul>
		</div>
  <?php include_once 'consult_related.php';?>
</div>