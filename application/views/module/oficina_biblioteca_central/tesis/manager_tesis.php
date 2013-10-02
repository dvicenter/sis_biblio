<script src="/sis_biblio/resource/myjs/tesis/tesis.js"></script>
<div id="module_tesis">
    <ul class="control">
      <li class="menu-control"><button id="add_tesis" class="btn btn-primary" data-toggle="modal"><i class="icon-plus-sign icon-white"></i> Agregar</button></li>
      <li class="menu-control"><a disabled id="export_rl_tesis" href="#new_exportar" class="btn btn-info" data-toggle="modal"><i class="icon-upload icon-white"></i> Exportar</a></li>
      <li class="menu-control">
          <div style="display:none;" class="alert alert-error span3">
            <strong>Error!</strong> Ingrese algo en el campo.
          </div>
        <form class="form-search span4 offset2">
          <div id="d-search" class="input-append">
            <input class="span3 d-search" id="appendedDropdownButton" type="text" placeholder="Buscar" required>

            <div class="btn-group">
              <button id="listar" class="btn dropdown-toggle" data-toggle="dropdown" >

                Filtro
                <span id="filtro" class="caret"></span>
              </button>
              <ul style="margin-left: -92px;" class="dropdown-menu">
                <li  class="lt_listar"><a href="#">Titulo</a></li>
                <li  class="lt_listar"><a href="#">Autor</a></li>
                <li  class="lt_listar"><a href="#">Asesor</a></li>
                <li   class="lt_listar"><a href="#">A&ntilde;o</a></li>
              </ul>
            </div>
          </div>
        </form>
      </li>
    </ul>
    <div id="module_table">
  <?php  echo $this->load->view('module/oficina_biblioteca_central/tesis/table_tesis'); ?>
      
    </div>
  <!-- <table id="table_tesis" class="table table-striped table-bordered table-condensed table-hover">
    <thead>
      <tr>
        <th class="title_table">Titulo</th>
        <th class="author_table">Autor</th>
        <th class="asesor_table">Asesor</th>
        <th class="year_table">A&ntilde;o</th>
        <th class="action_table">Acci&oacute;n</th>
      </tr>
    </thead>
    <tbody> 
      <?php foreach($tesis as $ttesis):?>
        <tr>
          <td style="display:none;"><?php echo $ttesis['id_material_bibliografico']?></td>
          <td style="display:none;"><?php echo $ttesis['id_docente']?></td>
          <td style="display:none;"><?php echo $ttesis['id_alumno']?></td>
          <td style="display:none;"><?php echo $ttesis['id_autor_interno']?></td>
          <td style="display:none;"><?php echo $ttesis['id_tipo_autor_interno']?></td>
          <td style="display:none;"><?php echo $ttesis['facultad']?></td>
          <td><?php echo $ttesis['titulo']?></td>
          <td><?php echo $ttesis['alumno']?></td>
          <td><?php echo $ttesis['docente']?></td>
          <td><?php echo $ttesis['anio']?></td>
          <td style="display:none;"><?php echo $ttesis['introduccion']?></td>
          <td style="display:none;"><?php echo $ttesis['objetivo']?></td>
          <td style="display:none;"><?php echo $ttesis['resumen']?></td>
          <td style="display:none;"><?php echo $ttesis['conclusion']?></td>
          <td>
            <button class="btn editar"><i class="icon-pencil"></i></button>
          </td>
        <?php  endforeach; ?>
                </tr>
  </tbody>
  </table> -->
 
  <?php include_once 'new_tesis.php';?>
  <?php include_once 'new_exportar.php'; ?>
</div>