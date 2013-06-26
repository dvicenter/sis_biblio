<div id="mod_request_record">
	<form class="form-horizontal" action="">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_asesor">Asesor: </label> 
		  <div class="controls">
			<input id="input_man_asesor" type="text" class="span3" style="margin: 0 auto;" data-provide="typeahead" data-items="4" required data-source="">
			<p class="help-block">Ejm: Garc&iacute;a Fernando</p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_titulo">T&iacute;tulo: </label> 
		  <div class="controls">
			<input type="text" class="input-xxlarge" required id="input_man_titulo">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_voucher" >Voucher: </label> 
		  <div class="controls">
			<input type="text" class="input-xlarge" required id="input_man_voucher">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_correo">Correo: </label> 
		  <div class="controls">
			<input type="email" class="input-xxlarge" required id="input_man_correo">
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <div class="text_tesista">
	 	<ul class="nav nav-tabs" id="myTab">
	          <li class="active"><a href="#introduccion_tes" data-toggle="tab">Introduccion</a></li>
	          <li><a href="#objetivo_tes" data-toggle="tab">Objetivo</a></li>
	          <li><a href="#resumen_tes" data-toggle="tab">Resumen</a></li>
	          <li><a href="#conclusion_tes" data-toggle="tab">Conclusion</a></li>
	        </ul> 
	        <div class="tab-content">
	          <div class="tab-pane active" id="introduccion_tes">
	            <textarea name="introduccion_tes" rows="5" placeholder="Escriba su INTRODUCCION aqui..." required></textarea>
	          </div>
	          <div class="tab-pane" id="objetivo_tes">
	            <textarea name="objetivo_tes" rows="5" placeholder="Escriba su OBJETIVO aqui..." required></textarea>
	          </div>
	          <div class="tab-pane" id="resumen_tes">
	            <textarea name="resumen_tes" rows="5" placeholder="Escriba su RESUMEN aqui..." required></textarea>
	          </div>
	          <div class="tab-pane" id="conclusion_tes">
	            <textarea name="conclusion_tes" rows="5" placeholder="Escriba su CONCLUSION aqui..." required></textarea>
	          </div>
	        </div>
        </div>
        <div class="btn_tesi">
	        <a class="btn btn-primary enviar" href="javascript:;">Enviar</a>
        </div>
	</form>
</div>