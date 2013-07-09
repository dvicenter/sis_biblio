<script src="/sis_biblio/resource/myjs/manager/component_assignament.js" type="text/javascript"></script>
<div id="mod_role_assignment_component">
	<form id="form_comp_asig"class="form-horizontal">
	<input type="hidden" name="id_comp"/>
	<fieldset>
		<div class="control">
		  <label style="width: 85px;" class="control-label bold_label" for="input_comp_asig"> Rol: </label> 
		  <div style="margin-left:100px;" class="controls">
			<input autocomplete="off" id="input_comp_asig" type="text" name="rol_comp" class="input-xlarge" data-toggle="popover" data-placement="right" data-content="" required>
			<input type="submit" class="btn search_rol_componente" value="Buscar"/>
			<div class="response pos_right"></div>
			<p style="font-weight: normal;" class="help-block">Ejm: Administrador</p>
			<p class="help-block"></p>
		  </div>
		</div>
	</fieldset>
	</form>
    <table class="pos_left table table-striped table-bordered table-condensed" >
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox" name="check_comp_rol" disabled/></th>
		<th class="comp_table">Componente</th>
		<th class="acc_table">Accion</th>
      </tr>
    </thead>
    <tbody class="componente_de_rol">
		<!-- body de la tabla compomentes de un rol -->
    </tbody>
  </table>
  <div class="pos_left btns_nav_rol">
  <button class="btn btn-info left" type="submit">&lt;&lt;</button>
  <button class="btn btn-danger delete" type="submit">Eliminar</button>
  <button class="btn btn-primary save" type="submit">Guardar</button>
  <button class="btn cancel" type="submit">Cancelar</button>
  </div>
 
  
  <table class="pos_right table table-striped table-bordered table-condensed" >
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox" name="check_comp"/></th>
		<th class="comp_table">Componente</th>
		<th class="acc_table">Accion</th>
      </tr>
    </thead>
    <tbody class="componente">
		<!-- body de componentes -->
    </tbody>
  </table>
</div>