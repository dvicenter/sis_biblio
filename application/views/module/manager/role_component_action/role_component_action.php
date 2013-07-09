<script src="/sis_biblio/resource/myjs/manager/role_component_action.js" type="text/javascript"></script>
<div id="mod_role_component_action">
	<form id="form_acc_asig" class="form-horizontal">
	<input type="hidden" name="id_componente"/>
	<fieldset>
		<div class="control">
		  <label style="width: 85px;" class="control-label bold_label" for="input_acc_asig"> Componente: </label> 
		  <div style="margin-left:100px;" class="controls">
			<input autocomplete="off" id="input_acc_asig" type="text" name="rol_accion" class="input-xlarge" data-toggle="popover" data-placement="right" data-content="" required>
			<input type="submit" class="btn search_componente_accion" value="Buscar" />
			<div class="response pos_right"></div>
			<p style="font-weight: normal;" class="help-block">Ejm: M&oacute;dulo componente acci&oacute;n</p>
		  </div>
		</div>
	</fieldset>
	</form>
    <table class="pos_left table table-striped table-bordered table-condensed" >
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox" name="check_componente_accion"/></th>
		<th class="role_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody class="acciones_de_componente">
		
    </tbody>
  </table>
  <div class="pos_left btns_nav_rol">
	  <button class="btn btn-info left" >&lt;&lt;</button>
	  <button class="btn btn-danger delete" >Eliminar</button>
	  <button class="btn btn-primary save" >Guardar</button>
	  <button class="btn cancel">Cancelar</button>
  </div>
  <table class="pos_right table table-striped table-bordered table-condensed" >
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox" name="check_accion"/></th>
		<th class="role_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody class="accion">
		
    </tbody>
  </table>
</div>