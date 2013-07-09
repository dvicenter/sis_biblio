<script src="/sis_biblio/resource/myjs/manager/role_assignment.js" type="text/javascript"></script>
<div id="mod_role_assignment">
	<form id="form_rol_asig" class="form-horizontal">
	<input type="hidden" name="id_user"/>
	<fieldset>
		<div class="control">
		  <label style="width: 85px;" name="rol_asignacion" class="control-label bold_label" for="input_rol_asig"> Usuario: </label> 
		  <div style="margin-left:100px;" class="controls">
			<input autocomplete="off" id="input_rol_asig" type="text" name="rol_asignacion" class="input-xlarge" data-toggle="popover" data-placement="right" data-content="" required>
			<input type="submit" class="btn search_usuario_rol" value="Buscar">
			<div class="response pos_right"></div>
			<p style="font-weight: normal;" class="help-block">Ejm: Administrador</p>
		  </div>
		</div>
	</fieldset>
	</form>
    <table class="pos_left table table-striped table-bordered table-condensed" >
    <thead>
      <tr>
        <th class="check_table"><input type="checkbox" name="check_rol_user" disabled/></th>
		<th class="role_table">Rol</th>
      </tr>
    </thead>
    <tbody class="roles_de_usuario">
	
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
        <th class="check_table"><input type="checkbox" name="check_rol"/></th>
		<th class="role_table">Rol</th>
      </tr>
    </thead>
    	<tbody class="rol">
		
   		</tbody>
  </table>
</div>