<div id="actual_tesis">
	<form class="form-horizontal well">
		<input type="hidden" name="id_plan_tesis_form"/>
		<input type="hidden" name="id_alumno_form"/>
		<input type="hidden" name="id_docente_form"/>
		 <fieldset>
		  	<div class="control-group">
		    	<label class="control-label" for="input01">T&iacute;tulo:</label>
		    <div class="controls">
		      <input type="text" class="input-xlarge" id="input01" disabled>
		    </div>
		  </div>
		</fieldset>
		<fieldset>
		  	<div class="control-group">
		    	<label class="control-label" for="input01">Tesista:</label>
		    <div class="controls">
		      <input type="text" class="input-xlarge" id="input02" disabled>
		    </div>
		    <div id="search_student" class="btn search"><i class="icon-search"></i></div>
		  </div>
		</fieldset>
		<fieldset>
		  	<div class="control-group">
		    	<label class="control-label" for="input01">Asesor:</label>
		    <div class="controls">
		      <input type="text" class="input-xlarge" id="input03" disabled>
		    </div>
		    <div id="search_asesor" class="btn search"><i class="icon-search"></i></div>
		  </div>
		</fieldset>
	  	<ul style="margin-top: 25px;" class="nav nav-tabs">
		  <li class="active"><a href="#introduccion_comp" data-toggle="tab">Introducci&oacute;n</a></li>
		  <li><a href="#objetivo_comp" data-toggle="tab">Objetivo</a></li>
		  <li><a href="#resumen_comp" data-toggle="tab">Resumen</a></li>
		</ul>
		 <div class="tab-content">
          <div class="tab-pane active" id="introduccion_comp">
            <textarea name="introduccion" rows="5" placeholder="Escriba su INTRODUCCION aqui..." disabled></textarea>
          </div>
          <div class="tab-pane" id="objetivo_comp">
            <textarea name="objetivo" rows="5" placeholder="Escriba su OBJETIVO aqui..." disabled></textarea>
          </div>
          <div class="tab-pane" id="resumen_comp">
            <textarea name="resumen" rows="5" placeholder="Escriba su RESUMEN aqui..." disabled></textarea>
          </div>
        </div>
	</form>
</div>