<script type="text/javascript" src="/sis_biblio/resource/myjs/monografia/monografia.js"></script>

<div id="module_monografia">
    <ul class="control">
      <li class="menu-control"><button id="add_monografia" class="btn btn-primary" data-toggle="modal"><i class="icon-plus-sign icon-white"></i> Agregar</button></li>
      <li class="menu-control"><a disabled id="export_ctrl_monografia" href="#new_exportar" class="btn btn-info" data-toggle="modal"><i class="icon-upload icon-white"></i> Exportar</a></li>
      <li class="menu-control">
        <form class="form-search span4 offset2">
          <div class="input-append">
            <input class="span3" id="appendedDropdownButton" type="text" placeholder="Buscar" disabled>
            <div class="btn-group">
              <button class="btn dropdown-toggle" data-toggle="dropdown" disabled>
                Filtro
                <span class="caret"></span>
              </button>
              <ul style="margin-left: -92px;" class="dropdown-menu">
                <li><a href="#">Titulo</a></li>
                <li><a href="#">Autor</a></li>
                <li><a href="#">Asesor</a></li>
                <li><a href="#">A&ntilde;o</a></li>
              </ul>
            </div>
          </div>
        </form>
      </li>
    </ul>
    <table id="table_monografia" class="table table-striped table-bordered table-condensed table-hover">
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
  			
                  </tr>
    </tbody>
    </table>
    <script>
      $(function() {
              applyPagination();
          
              function applyPagination() {
                  var z;
                $("#paginacion_tesis a").click(function() {
                  var pos_=$(this).parent().index();
                  var pos=pos_+1;
                  var url = $(this).attr("href");
                  $.ajax({
                    type: "POST",
                    dataType:'json',
                    url: url,
                    beforeSend: function() {
                      $("#table_tesis").html();
                    },
                    success: function(msg) {
                      var i;var r;
                      $.each(msg,function(a,b){
                        i=0;
                        $.each(b,function(c,d){
                          i++;
                            $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(1)').html(d.id_material_bibliografico);
                $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(2)').html(d.id_docente);
                $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(3)').html(d.id_alumno);
                $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(4)').html(d.id_autor_interno);
                $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(5)').html(d.id_tipo_autor_interno);
                $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(6)').html(d.facultad);
                            $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(7)').html(d.titulo);
                              $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(8)').html(d.alumno);
                $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(9)').html(d.docente);
                              $('#table_tesis tbody tr:nth-child('+i+') td:nth-child(10)').html(d.anio);
                          if($('#table_tesis tbody tr:nth-child('+i+')').is(':visible')!=true){
                            console.info('entraaa');
                            $("#table_tesis tbody tr:nth-child("+i+")").fadeIn();
                            }    
                        });
                        if(i%10!=0){
                            var j=i%10;
                            var z=j+1;
                            while(z<11){
                              $("#table_tesis tbody tr:nth-child("+z+")").fadeOut();
                              z++;
                            }
                            r=1;
                         }
                      });
                                        
                      $('#paginacion_tesis a').parent().removeClass('active');
                      $('#paginacion_tesis li:nth-child('+pos+')').addClass('active');
                    }
                  });
                  return false;
                });
              }
            });
    </script>
    <div id="paginacion_tesis" class="pagination loading">
      <ul>
       
      </ul>
    </div>
    <?php  include_once 'new_monografia.php'; ?>
</div>