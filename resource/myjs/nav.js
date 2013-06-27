<<<<<<< HEAD
var asesores=[];
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
		load_module_date('/sis_biblio/manager/ccusuario/listar', '#user', 'null');
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
		load_module_date('/sis_biblio/manager/cccomponente/listar', '#componente_user', 'null');
	});
	$('#accion').click(function(){
		load_module_date('/sis_biblio/manager/ccaccion/listar', '#accion_user', 'null');
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
		{	$.ajax({
					url:url,
					beforeSend:function()
						{	$('#module_content').html('<div class="loading"><img src="/sis_biblio/resource/img/utilities/gif/loading.gif"/></div>');
						},
					success:function(data)
						{	active(id_nav_left,id_nav_top);
							$('#module_content').html(data);
							validar();
							if($("#mod_rol").is(":visible") == true)
								{	$('#mod_rol .agregar').click(function(){
										insertar_rol();
									})
								}
							else 
								{	if($("#mod_accion").is(":visible") == true)
										{	$('#mod_accion .agregar').click(function(){
											insertar_accion();
											});
										}
									else 
										{ 	if($("#mod_componente").is(":visible") == true)
												{	$('#mod_componente .agregar').click(function(){
													insertar_componente();
													validar_componente();
													});
												}
									else 
										{	if($("#manager_user").is(":visible") == true){
												$('#manager_user .agregar').click(function(){
												insertar_user();
												});
											}
											else
											{	if($("#mod_request_record").is(":visible") == true){
													if(validar_solicitar_constancia()){
														insertar_solictiud_tesis();
													}
												}
										}
								}
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
	
	function insertar_accion()
	{
					var accion=$("#mod_accion input[name='input_man_accion']").val();
					$.ajax({
						url:'/sis_biblio/manager/ccaccion/insertar/'+accion,
						type:'post',
						dataType:'json',
						success:function(data){
							console.info(data);
							var accion;
							
							$.each(data,function(a,b){
								accion=b.accion;
								
							});
							//$('#mod_accion table tr:last').after('<td>'+accion+'</td>');
							
							$('tr:last td', $("#table_acc"));

							var tds = '<tr>';							
							tds += '<td>'+accion+'</td>';							
							tds += '</tr>';
							$("#table_acc").append(tds);
						}
					});
	}
	
	function insertar_componente()
	{	
					var componente=$("#mod_componente input[name='componente']").val();
					var descripcion_componente=$("#mod_componente textarea[name='txtcomp']").val();
					$.ajax({
						url:'/sis_biblio/manager/cccomponente/insertar/'+componente+'/'+descripcion_componente,
						type:'post',
						dataType:'json',
						success:function(data){
							
							var componente;
							var descripcion_componente;
							$.each(data,function(a,b){
								componente=b.componente;
								descripcion_componente=b.descripcion_componente;
							});
							console.info(componente);
							//$('#mod_componente table tr:last').after('<td>'+componente+'</td><td>'+descripcion_componente+'</td>');
							
							$('tr:last td', $("#table_comp"));

							var tds = '<tr>';							
							tds += '<td>'+componente+'</td><td>'+descripcion_componente+'</td>';							
							tds += '</tr>';
							$("#table_comp").append(tds);
						},
						error:function(data)
						{
							console.info(data)
						}
					});
	}
	
	function insertar_user()
	{	var id_sujeto=1;
		var id_usuario=8;
		var usuario=$("#manager_user input[name='m_user']").val();
		var contrasenia=$("#manager_user input[name='m_contra']").val();
		var estado=$("#manager_user input[name='m_chek']").val();
		if(estado=='on')
			{	var active=1;
			}
		else
			{	var active=0;
			}
		$.ajax({
			url:'/sis_biblio/manager/ccusuario/insertar/'+id_usuario+'/'+usuario+'/'+contrasenia+'/'+id_sujeto+'/'+active,
			type:'post',
			dataType:'json',
			success:function(data){
				console.info(data);
				var usuario;
				var id_usuario;
				var contrasenia;
				var id_sujeto;
				var active;
				$.each(data,function(a,b){
					usuario=b.usuario;
					id_usuario=b.id_usuario;
					contrasenia=b.contrasenia;
					id_sujeto=b.id_sujeto;
					active=b.active;
				});
				//$('#manager_user table tr:last').after('<td>'+user+'</td>'<td>'+contrasenia+'</td><td>'+active+'</td>);
				$('tr:last td', $("#tabla_user"));
				var tds = '<tr>';							
					tds += '<td>'+usuario+'</td><td>'+contrasenia+'</td><td>'+active+'</td>';							
					tds += '</tr>';
					$("#table_user").append(tds);
				}
			});
	}
	function insertar_solictiud_tesis()
	{	var asesor=[];
		var as;
		$('#input_man_asesor').click(function(){
			buscar_asesor();
		});
		$("#mod_request_record .enviar").click(function(){
			var asesor=$('#input_man_asesor').val();
			var titulo=$('#input_man_titulo').val();
			var voucher=$('#input_man_voucher').val();
			var correo=$('#input_man_correo').val();
			var introduccion=$("#mod_request_record textarea[name='introduccion_tes']").val();
			var objetivo=$("#mod_request_record textarea[name='objetivo_tes']").val();
			var resumen=$("#mod_request_record textarea[name='resumen_tes']").val();
			var conclusion=$("#mod_request_record textarea[name='conclusion_tes']").val();
			var id_docente
			var id_sujeto=$("#id_sujeto_login").val()
			$.each(asesores,function(a,b){
				if(b[1]==asesor)
				{	id_docente=b[0];
				}
			});
			console.info(id_docente);
			$.ajax({
				url:'/sis_biblio/user/ccrequestrecord/insertar_solitud',
				dataType:'post',
				data:"asesor="+asesor+"&titulo="+titulo+"&voucher="+voucher+"&correo="+correo+"&introduccion="+introduccion+"&objetivo="+objetivo+"&resumen="+resumen+"&conclusion="+conclusion+"&id_docente="+id_docente+"&id_sujeto="+id_sujeto,
				success:function(data){
					
				}
			});
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

	function validar_componente()
	{	$('#input01').validCampo(/^[a-zA-Z_-\s]*$/,'#form_component','No se aceptan caracteres especiales.');
		$('#comment_body').validCampo(/^[a-zA-z_-\s\.]*$/,'#form_component','No se aceptan caracteres especiales.');
	}
	function validar_accion(){
		$('#input_man_accion').validCampo(/^[a-zA-z\s]*$/,'#form_accion','Se acepta solo caracteres alfabeticos.');
	}
	function validar_rol(){
		$('#input_man_rol').validCampo(/^[a-zA-z\s]*$/,'#form_rol','Se acepta solo caracteres alfabeticos.');
		$('#inpur_man_descripcion').validCampo(/^[a-zA-z_-\s\.]*$/,'#form_rol','Se acepta solo caracteres alfabeticos.');
	}
	function validar_tesis(){
		$('#titulo').validCampo(/^[a-zA-Z_-Ã¡Ã©Ã­Ã³ÃºÃ�Ã‰Ã�Ã“Ãš \xF1 \xD1 \s\.\d]*$/,'#form_nuevo_tesis','No acepta caracteres especiales.');
		$('#autor').validCampo(/^[a-zA-zÃ¡Ã©Ã­Ã³ÃºÃ�Ã‰Ã�Ã“Ãš \xF1 \xD1 \s]*$/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#asesor').validCampo(/^[a-zA-zÃ¡Ã©Ã­Ã³ÃºÃ�Ã‰Ã�Ã“Ãš \xF1 \xD1 \s]*$/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#anio').validCampo(/[\d{2}\/\d{2}\/\d{4}]/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#input_introduccion').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_objetivo').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_resumen').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_conclusion').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
	}
	function validar_solicitar_constancia()
	{	var asesor=$('#input_man_asesor').validCampo(/^[a-zA-zÃ¡Ã©Ã­Ã³ÃºÃ�Ã‰Ã�Ã“Ãš \xF1 \xD1 \s]*$/,'#form_user','Se acepta solo caracteres alfabeticos.');		
		var titulo=$('#input_man_titulo').validCampo(/^[a-zA-Z_-Ã¡Ã©Ã­Ã³ÃºÃ�Ã‰Ã�Ã“Ãš \xF1 \xD1 \s\.\d]*$/,'#form_user','No acepta caracteres especiales.');
		var voucher=$('#input_man_voucher').validCampo(/^[\d]*$/,'#form_user','Se aceptan solo caracteres numericos.');
		var correo=$('#input_man_correo').validCampo(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,'#form_user','Verifique que tenga formato de correo electronico.');
		var introduccion=$('#input_user_introduccion').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var objetivo=$('#input_user_objetivo').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var resumen=$('#input_user_resumen').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var conclusion=$('#input_user_conclusion').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		if(asesor==true)
		{
			alert('hola');
		}
		return true;
	}
	function validar_usuario()
	{	$('#input_adm_sujeto').validCampo(/^[a-zA-Z_-\s]*$/,'#form_adm_user','No se aceptan caracteres especiales.');
		$('#input_adm_user').validCampo(/^[a-zA-Z_-\d]*$/,'#form_adm_user','No se aceptan caracteres especiales.');
		$('#input_adm_contra').validCampo(/^[a-zA-z-_Ã¡Ã©Ã­Ã³Ãº \xF1 \xD1 Ã�Ã‰Ã�Ã“Ãš\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_adm_user','No se aceptan caracteres especiales.');
	}
	function validar_file()
	{	$('#input_control').validCampo(/^.+\.txt$/,'#form_voucher','Solo se acepta formato .txt');
	}
	function validar_asignacion_rol()
	{	$('#input_rol_asig').validCampo(/^[a-zA-z\s]*$/,'#form_rol_asig','Se acepta solo caracteres alfabeticos.');
	}
	function validar_asignacion_rol_componente()
	{	$('#input_comp_asig').validCampo(/^[a-zA-z\s]*$/,'#form_comp_asig','Se acepta solo caracteres alfabeticos.');
	}
	function validar_componente_accion()
	{	$('#input_acc_asig').validCampo(/^[a-zA-z\s]*$/,'#form_acc_asig','Se acepta solo caracteres alfabeticos.');
	}
	function validar()
	{
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

	function buscar_asesor()
	{	$.ajax({
			url:'/sis_biblio/user/ccrequestrecord/buscar_asesor',
			type:"POST",
			dataType:"json",
			success:function(data){
				var asesor=[];
				$.each(data,function(a,b){
					asesor.push(b.docente);
					asesores.push([b.id_docente,b.docente]);
				});
				$('#input_man_asesor').typeahead().data('typeahead').source = asesor;
			}
		});
	}