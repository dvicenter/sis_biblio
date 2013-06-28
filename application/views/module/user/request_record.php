<div id="mod_request_record" >
	<form id="form_user" class="form-horizontal" action="/sis_biblio/module/user/request_record" method="post">
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_asesor">Asesor: </label> 
		  <div class="controls">
			<input id="input_man_asesor" type="text" class="span3" style="margin: 0 auto;" data-provide="typeahead" data-items="4" data-toggle="popover" data-placement="right" data-content="" required data-source="">
			<p class="help-block">Ejm: Garc&iacute;a Fernando</p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_titulo">T&iacute;tulo: </label> 
		  <div class="controls">
			<input type="text" class="input-xxlarge" required id="input_man_titulo" data-toggle="popover" data-placement="right" data-content="" >
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_voucher" >Voucher: </label> 
		  <div class="controls">
			<input type="text" class="input-xlarge" required id="input_man_voucher" data-toggle="popover" data-placement="right" data-content="" >
			<p class="help-block"></p>
		  </div>
		</div>
	  </fieldset>
	  <fieldset>
		<div class="control-group">
		  <label class="control-label bold_label" for="input_man_correo">Correo: </label> 
		  <div class="controls">
			<input type="email" class="input-xxlarge" required id="input_man_correo" data-toggle="popover" data-placement="right" data-content="" >
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
	            <textarea id="input_user_introduccion" name="introduccion_tes" rows="5" placeholder="Escriba su INTRODUCCION aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	          <div class="tab-pane" id="objetivo_tes">
	            <textarea id="input_user_objetivo" name="objetivo_tes" rows="5" placeholder="Escriba su OBJETIVO aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	          <div class="tab-pane" id="resumen_tes">
	            <textarea id="input_user_resumen" name="resumen_tes" rows="5" placeholder="Escriba su RESUMEN aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	          <div class="tab-pane" id="conclusion_tes">
	            <textarea id="input_user_conclusion" name="conclusion_tes" rows="5" placeholder="Escriba su CONCLUSION aqui..." data-toggle="popover" data-placement="right" data-content=""  required></textarea>
	          </div>
	        </div>
        </div>
        <div class="btn_tesi">
	        <input class="btn btn-primary enviar" value="Enviar" type="submit"/>
        </div>
	</form>
	<div class="msg_request_record"></div>
</div>