$(document).ready(function(){
	
	$('#tesis').click(function(){
		load_module_not_date('/sis_biblio/module/tesis/manager_tesis', '#tesis', '#tesis_top');
	});
	$('#tesis_top').click(function(){
		load_module_not_date('/sis_biblio/module/tesis/manager_tesis', '#tesis', '#tesis_top');
	});
	$('#constancia').click(function(){
		load_module_not_date('/sis_biblio/module/constancia/manager_constancia', '#constancia', '#constancia_top');
	});
	$('#constancia_top').click(function(){
		load_module_not_date('/sis_biblio/module/constancia/manager_constancia', '#constancia', '#constancia_top');
	});
	$('#user').click(function(){
		load_module_not_date('/sis_biblio/module/manager/manager_user', '#user', 'null');
	});
	$('#role_assignment').click(function(){
		load_module_not_date('/sis_biblio/module/role_assignment/role_assignment', '#role_assignment', 'null');
	});
	$('#request_record').click(function(){
		load_module_date('/sis_biblio/module/user/request_record', '#request_record', 'null');
	});
	$('#tesis_consultation').click(function(){
		load_module_not_date('/sis_biblio/module/user/tesis_consultation', '#tesis_consultation', 'null');
	});
	$('#role_assignment_component').click(function(){
		load_module_not_date('/sis_biblio/module/role_assignment_component/role_assignment_component', '#role_assignment_component', 'null');
	});
	$('#role_component_action').click(function(){
		load_module_not_date('/sis_biblio/module/role_component_action/role_component_action', '#role_component_action', 'null');
	});
	$('#rol').click(function(){
		load_module_date('/sis_biblio/manager/ccrol/listar', '#rol_user', 'null');
	});
	$('#componente').click(function(){
		load_module_not_date('/sis_biblio/module/componente/componente_user', '#componente_user', 'null');
	});
	$('#accion').click(function(){
		load_module_not_date('/sis_biblio/module/accion/accion_user', '#accion_user', 'null');
	});
	$('#load_voucher').click(function(){
		load_module_not_date('/sis_biblio/module/voucher/voucher', '#load_voucher', 'null');
	});

	function load_module_not_date(url,id_nav_left,id_nav_top,url_listar)
	{
		$.ajax({
			url:url,
			beforeSend:function(data){
				$('#module_content').html('<div class="loading"><img src="/sis_biblio/resource/img/utilities/gif/loading.gif"/></div>');
			},
			success:function(data){
				active(id_nav_left,id_nav_top);
				$('#module_content').html(data);
				aparecer_input();
				validar();
					
				$('#module_constancia').click(function(){
				active_consult('.consult_student', '.consult_asesor');
				}); 		
			}
		});
	}

	
	function active_consult(active,desactive)
	{	$(active).addClass('active_consult');
		$(desactive).removeClass('active_consult');
	}

	
	function aparecer_input()
	{
		var check  = $(".opcion").children();
		$(this).change(function(){
  				
			check.each(function( index ) {

		  		var name = $(this).attr('name');

				if ($(this).prop('checked')) 
				{
		  			$('form ul #'+name).css('display','block');
				}
				else
				{
					$('form ul #'+name).css('display','none');
				}
			});
		}).change();

	}
});
	function load_module_date(url,id_nav_left,id_nav_top)
	{
		$.ajax({
			url:url,
			beforeSend:function(){
				$('#module_content').html('<div class="loading"><img src="/sis_biblio/resource/img/utilities/gif/loading.gif"/></div>');
			},
			success:function(data){
				active(id_nav_left,id_nav_top);
				$('#module_content').html(data);
				if($("#mod_rol").is(":visible") == true){		
					$('#mod_rol .agregar').click(function(){
						insertar_rol();
						validar();
					});
				}
				else{
					if($("#mod_request_record").is(":visible") == true){		
						$('#input_man_asesor').click(function(){
							buscar_asesor();
						});
					}
				}
			}
		});
	}

	function insertar_rol()
	{	var rol=$("#mod_rol input[name='rol']").val();
		var descripcion=$("#mod_rol textarea[name='textarea']").val();
			$.ajax({
					url:'/sis_biblio/manager/ccrol/insertar/'+rol+'/'+descripcion,
					type:'post',
					dataType:'json',
					success:function(data){
					var rol;
					var descripcion;
					$.each(data,function(a,b){
						rol=b.rol;
						descripcion=b.descripcion;
					});
					$('tr:last td', $("#table_aum"));
					var tds = '<tr>';							
					tds += '<td>'+rol+'</td><td>'+descripcion+'</td>';							
					tds += '</tr>';
					$("#table_aum").append(tds);
				},
				error:function(data)
					{	console.info(data)
					}
			});
	}

	function active(selector,selector_top)
	{
		$('.nav-list > li').removeClass('active');
		$('.nav > li').removeClass('active');
		$($(selector).parent()).addClass('active');
		if(($(selector).parent()).find('.import')){
			$($(selector_top).parent()).addClass('active');
		}
	}

	function validar()
	{

		//validacion componente
		$('#input01').validCampo(/^[a-zA-Z_-\s]*$/,'#form_component','No se aceptan caracteres especiales.');
		$('#comment_body').validCampo(/^[a-zA-z_-\s\.]*$/,'#form_component','No se aceptan caracteres especiales.');
		//validacion accion
		$('#input_man_accion').validCampo(/^[a-zA-z]*$/,'#form_accion','Se acepta solo caracteres alfabeticos.');
		//validacion rol
		$('#input_man_rol').validCampo(/^[a-zA-z]*$/,'#form_rol','Se acepta solo caracteres alfabeticos.');
		$('#inpur_man_descripcion').validCampo(/^[a-zA-z_-\s\.]*$/,'#form_rol','Se acepta solo caracteres alfabeticos.');
		//validacion tesis
		$('#titulo').validCampo(/^[a-zA-Z_-áéíóúÁÉÍÓÚ \xF1 \xD1 \s\.\d]*$/,'#form_nuevo_tesis','No acepta caracteres especiales.');
		$('#autor').validCampo(/^[a-zA-záéíóúÁÉÍÓÚ \xF1 \xD1 \s]*$/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#asesor').validCampo(/^[a-zA-záéíóúÁÉÍÓÚ \xF1 \xD1 \s]*$/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#anio').validCampo(/[\d{2}\/\d{2}\/\d{4}]/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#input_introduccion').validCampo(/^[a-zA-z-_áéíóú \xF1 \xD1 ÁÉÍÓÚ\s\w\d\.,:;<>0=\(\)\[\]\/]['"]*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_objetivo').validCampo(/^[a-zA-z-_áéíóú \xF1 \xD1 ÁÉÍÓÚ\s\w\d\.,:;<>0=\(\)\[\]\/]['"]*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_resumen').validCampo(/^[a-zA-z-_áéíóú \xF1 \xD1 ÁÉÍÓÚ\s\w\d\.,:;<>0=\(\)\[\]\/]['"]*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_conclusion').validCampo(/^[a-zA-z-_áéíóú \xF1 \xD1 ÁÉÍÓÚ\s\w\d\.,:;<>0=\(\)\[\]\/]['"]*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
	}

	function buscar_asesor()
	{	$.ajax({
			url:'/sis_biblio/user/ccrequestrecord/buscar_asesor',
			type:"POST",
			dataType:"json",
			success:function(data){
				var asesor=[];
				$.each(data,function(a,b){
					asesor.push(b.docente);
				});
				$('#input_man_asesor').typeahead().data('typeahead').source = asesor;
			}
		});
	}
	function cargar_facultad()
	{
		$.ajax({
			url:'/sis_biblio/util/ccfacultad/cargar_facultad',
			type:"POST",
			success:function(data){
				console.info(data);
				$('#facultad_request_record').html(data);
			}
		});
	}