<div style="width: 880px;left: 39%;" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="consult_related">
  <div class="modal-header">
  	<a class="close" data-dismiss="modal">x</a>
     <h3>Comparacion de Tesis</h3>
  </div>
  <div class="modal-body">
    	<div class="consult_left pos_left">
    		<?php $this->load->view('module/oficina_biblioteca_central/constancia/actual_tesis');?>
    	</div>
    	<div class="consult_right pos_right well">
    		<div class="consult_student">
    			<?php $this->load->view('module/oficina_biblioteca_central/constancia/consult_student');?>
    		</div>
    		<div class="consult_asesor">
    			<?php //$this->load->view('module/oficina_biblioteca_central/constancia/consult_asesor');?>
    		</div>
    	</div>
  </div>
  <div class="modal-footer">
    <a href="javascript:;" class="btn close__">Cancelar</a>
    <a href="javascript:;" class="btn btn-danger desaprobar">Desaprobar</a>
    <a href="javascript:;" class="btn btn-primary aprobar">Aprobar</a>
  </div>
</div>