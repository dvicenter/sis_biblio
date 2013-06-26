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
		load_module_not_date('/sis_biblio/module/user/request_record', '#request_record', 'null');
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
				aprecer_input();
				$('#module_constancia').click(function(){
			//	alert('da');console.info('j');
				active_consult('.consult_student', '.consult_asesor');
				}); 		
			}
		});
	}

	
	function active_consult(active,desactive)
	{	$(active).addClass('active_consult');
		$(desactive).removeClass('active_consult');
	}

	
	function aprecer_input()
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
			$.ajax(
				{
					url:url,
					beforeSend:function()
						{
							$('#module_content').html('<div class="loading"><img src="/sis_biblio/resource/img/utilities/gif/loading.gif"/></div>');

						},
					success:function(data)
						{
							active(id_nav_left,id_nav_top);
							$('#module_content').html(data);
							
							if($("#mod_rol").is(":visible") == true)
								{
									$('#mod_rol .agregar').click(function(){
										insertar_rol();
									})
								}
							else 
								{	if($("#mod_accion").is(":visible") == true)
										{
											$('#mod_accion .agregar').click(function(){
											insertar_accion();
											});
										}
																		
									else 
										{ 
											if($("#mod_componente").is(":visible") == true)
												{											
													$('#mod_componente .agregar').click(function(){
													insertar_componente();
													});
												}
																			
									else 
										{
										
											if($("#manager_user").is(":visible") == true){
												
												$('#manager_user .agregar').click(function(){
												insertar_user();
											});
											}
										}}
								}
						}
				});
		}
	

	function insertar_rol()
	{	
					var rol=$("#mod_rol input[name='rol']").val();
					var descripcion=$("#mod_rol textarea[name='textarea']").val();
					$.ajax({
						url:'/sis_biblio/manager/ccrol/insertar/'+rol+'/'+descripcion,
						type:'post',
						dataType:'json',
						success:function(data){
							console.info(data);
							var rol;
							var descripcion;
							$.each(data,function(a,b){
								rol=b.rol;
								descripcion=b.descripcion;
							});
							console.info(rol);
							//$('#mod_rol table tr:last').after('<td>'+rol+'</td><td>'+descripcion+'</td>');
							
							$('tr:last td', $("#table_aum"));

							var tds = '<tr>';							
							tds += '<td>'+rol+'</td><td>'+descripcion+'</td>';							
							tds += '</tr>';
							$("#table_aum").append(tds);
						},
						error:function(data)
						{
							console.info(data)
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
	{				var id_sujeto=1;
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

	function active(selector,selector_top)
	{
		$('.nav-list > li').removeClass('active');
		$('.nav > li').removeClass('active');
		$($(selector).parent()).addClass('active');
		if(($(selector).parent()).find('.import')){
			$($(selector_top).parent()).addClass('active');
		}
	}