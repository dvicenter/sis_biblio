var asesores=[];
var sujetos=[];
var pos_editar;
var oficinas=[];

$(document).ready(function(){
	habilitar_modulo();
	$('#tesis').click(function(){
		load_module_not_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_tesis', '#tesis', '#tesis_top');
	});
	$('#tesis_top').click(function(){
		load_module_not_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_tesis', '#tesis', '#tesis_top'
		);
	});
	$('#constancia').click(function(){
		load_module_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_solicitud', '#constancia', '#constancia_top');
	});
	$('#constancia_top').click(function(){
		load_module_date(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_solicitud', '#constancia', '#constancia_top');	
	});
	$('#user').click(function(){
		load_module_date(base_url+'manager/ccusuario/listar', '#user', 'null');
	});
	$('#role_assignment').click(function(){
		load_module_not_date(base_url+'module/role_assignment/role_assignment', '#role_assignment', 'null');
	});
	$('#request_record').click(function(){
		load_module_date(base_url+'module/user/request_record', '#request_record', 'null');
	});
	$('#monografias').click(function(){
		load_module_not_date(base_url+'module/monografia/manager_monografia', '#monografias', 'null');
	});
	$('#tesis_consultation').click(function(){
		load_module_not_date(base_url+'module/user/tesis_consultation', '#tesis_consultation', 'null');
	});
	$('#role_assignment_component').click(function(){
		load_module_not_date(base_url+'module/role_assignment_component/role_assignment_component', '#role_assignment_component', 'null');
	});
	$('#role_component_action').click(function(){
		load_module_not_date(base_url+'module/role_component_action/role_component_action', '#role_component_action', 'null');
	});
	$('#rol').click(function(){
		load_module_date(base_url+'manager/ccrol/listar', '#rol_user', 'null');
	});
	$('#componente').click(function(){
		
		load_module_date(base_url+'manager/cccomponente/listar', '#componente_user', 'null');
	});
	$('#accion').click(function(){
		load_module_date(base_url+'manager/ccaccion/listar', '#accion_user', 'null');
	});

	$('#load_voucher').click(function(){
		load_module_not_date(base_url+'module/voucher/voucher', '#load_voucher', 'null');
	});

	$('#oficina').click(function(){
		load_module_date(base_url+'manager/ccoficina/listar', '#oficina_user', 'null');
	});
	function load_module_not_date(url,id_nav_left,id_nav_top,url_listar)
	{		$.ajax({
			url:url,
			beforeSend:function(data){
				$('#module_content').html('<div class="loading"><img src="'+base_url+'resource/img/utilities/gif/loading.gif"/></div>');
			},
			success:function(data){
				active(id_nav_left,id_nav_top);
				$('#module_content').html(data);
				if($('#mod_role_assignment_component').is(':visible')){
				$("#mod_role_assignment_component input[name='rol_comp']").focus();
					buscar_rol_componente();
					
				}
						aparecer_input();

				validar();
				}
		});
	}
	function aparecer_input()
	{
		var check  = $(".opcion").children();
		$(this).change(function(){
			check.each(function( index ) {
		  		var name = $(this).attr('name');
				if ($(this).prop('checked')) 
				{	$('form ul #'+name).css('display','block');
					$('form ul #'+name+' input').focus();
				}
				else
				{	$('form ul #'+name).css('display','none');
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
							$('#module_content').html('<div class="loading"><img src="'+base_url+'resource/img/utilities/gif/loading.gif"/></div>');
						},
					success:function(data)
						{
							active(id_nav_left,id_nav_top);
							$('#module_content').html(data);
							validar();

							if($("#mod_rol").is(":visible") == true)
								{	$("#mod_rol input[name='rol']").focus();
									
								$('#mod_rol form').submit(function(evento){
									evento.preventDefault();
									if($('#mod_rol .agregar').attr('disabled')=='disabled'){}else{
										insertar_rol();
										$("#mod_rol form")[0].reset();
										$("#mod_rol input[name='rol']").focus();
									}
									});
									$('#mod_rol .modificar').click(function(){
										modificar_rol();
									});
									$('#mod_rol .eliminar').click(function(){
										var pos_=$("#mod_rol #table_aum td .eliminar").index(this);
										var pos=pos_+1;
										cancelar_rol();
										eliminar_rol(pos);
									});
									$('#mod_rol #table_aum td .editar').click(function() {
										var pos_editar_=$("#table_aum td .editar").index(this);
										pos_editar=pos_editar_+1;
										editar_rol(pos_editar);
									});
									$('#mod_rol .cancelar').click(function() {
										$("#mod_rol input[name='rol']").focus();
										cancelar_rol();										
									});
								}
							else 
								{	if($("#mod_accion").is(":visible") == true)
										{	
											$("#mod_accion input[name='accion']").focus();
											$("#mod_accion ul[name='paginador_accion'] li").click(function(){
												var index=$("#mod_accion ul[name='paginador_accion'] li").index(this);
											});
											$('#mod_accion form').submit(function(evento){
												evento.preventDefault();
												if($('#mod_accion .agregar').attr('disabled')=='disabled'){}else{
													insertar_accion();
													$('#mod_accion form')[0].reset();
												}
											});
											$('#mod_accion .modificar').click(function(){
											modificar_accion();
											});
											
											$('#mod_accion .eliminar').click(function(){
														var pos_=$("#mod_accion #table_acc td .eliminar").index(this);
														var pos=pos_+1;
														cancelar_accion();
														eliminar_accion(pos);
											});
											$('#mod_accion .cancelar').click(function() {
												$("#mod_accion input[name='accion']").focus();
														cancelar_accion();
											});
											$('#mod_accion #table_acc td .editar').click(function() {
														var pos_editar_=$("#table_acc td .editar").index(this);
														pos_editar=pos_editar_+1;
														editar_accion(pos_editar);
													});
										}
																		
									else 
										{ 
											if($("#mod_componente").is(":visible") == true)
												{	buscar_oficina();
													$("#mod_componente #input_comp_oficina").focus();
													$('#input_comp_oficina').click(function(){
														buscar_oficina();	
													});
													$("#mod_componente input[name='componente']").focus();								
													$('#mod_componente form').submit(function(evento){
														evento.preventDefault();
														if($('#mod_componente .agregar').attr('disabled')=='disabled'){}else{
															insertar_componente();
														}
														$("#mod_componente form")[0].reset();
														$("#mod_componente input[name='componente']").focus();
													});
													$('#mod_componente .modificar').click(function(){
														modificar_componente();
													});
													$('#mod_componente .eliminar').click(function(){
														var pos_=$("#mod_componente #table_comp td .eliminar").index(this);
														var pos=pos_+1;
														cancelar_componente();
														eliminar_componente(pos);
													});
													$('#mod_componente .cancelar').click(function() {
														cancelar_componente();
													});
													$('#mod_componente #table_comp td .editar').click(function() {
														var pos_editar_=$("#table_comp td .editar").index(this);
														pos_editar=pos_editar_+1;
														editar_componente(pos_editar);
													});
												}

											else 
												{	 
													if($("#mod_oficina").is(":visible") == true)
														{	
															$("#mod_oficina input[name='oficina']").focus();								
															$('#mod_oficina form').submit(function(evento){
																evento.preventDefault();
																if($('#mod_oficina .agregar').attr('disabled')=='disabled'){}else{
																	insertar_oficina();
																}
																$("#mod_oficina form")[0].reset();
																$("#mod_oficina input[name='oficina']").focus();
																});

																$('#mod_oficina .modificar').click(function(){
																modificar_oficina();
																});

																$('#mod_oficina .eliminar').click(function(){
																var pos_=$("#mod_oficina #table_oficina td .eliminar").index(this);
																var pos=pos_+1;
																cancelar_oficina();
																eliminar_oficina(pos);
																});

																$('#mod_oficina .cancelar').click(function() {
																cancelar_oficina();
																});

																$('#mod_oficina #table_oficina td .editar').click(function() {
																var pos_editar_=$("#table_oficina td .editar").index(this);
																pos_editar=pos_editar_+1;
																editar_oficina(pos_editar);
																});
														}
					
									else 
										{	if($("#manager_user").is(":visible") == true){
												buscar_sujeto();
												$("#manager_user #input_adm_sujeto").focus();
												$('#input_adm_sujeto').click(function(){
													buscar_sujeto();	
												});
												validar_contrasenia_man();
												$('#manager_user form').submit(function(evento){
													evento.preventDefault();
													if($('#manager_user .agregar').attr('disabled')=='disabled'){}else{
													insertar_user();
													$("#manager_user form")[0].reset();
													$("#manager_user #input_adm_sujeto").focus();
													}
												});
												$('#manager_user .modificar').click(function(){
													modificar_usuario();
												});
												$('#manager_user .eliminar').click(function(){
													var pos_=$("#manager_user #tabla_user td .eliminar").index(this);
													var pos=pos_+1;
													cancelar_usuario_();
													eliminar_usuario(pos);
												});
												$('#manager_user .cancelar').click(function() {
													$("#manager_user #input_adm_sujeto").focus();
													cancelar_usuario_();
												});
												$('#manager_user #tabla_user td .editar').click(function() {
													var pos_editar_=$("#tabla_user td .editar").index(this);
													pos_editar=pos_editar_+1;
													editar_usuario(pos_editar);
												});
											}

											else
											{	if($("#mod_request_record").is(":visible") == true){
												$("#input_man_asesor").focus();
													var asesor=[];
													buscar_asesor();
													$('#input_man_asesor').click(function(){
														buscar_asesor();	
													});
												$("#mod_request_record #check_acompaniante").click(function(){
													if($(this).is(":checked")){
														buscar_autor_acompa();
														$("#mod_request_record #input_man_acompaniante").attr('disabled',false);
														$("#mod_request_record #input_man_acompaniante").attr('required',true);
														$("#mod_request_record #input_man_acompaniante").focus();
													}
													else{
														$("#mod_request_record #input_man_acompaniante").attr('disabled',true);
														$("#mod_request_record #input_man_acompaniante").attr('required',false);
														$("#mod_request_record #input_man_acompaniante").attr('value',"");
													}
												});
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
	/*STAR ABM ROL*/
	function insertar_rol()
	{	var rol=$("#mod_rol input[name='rol']").val();
		var descripcion=$("#mod_rol textarea[name='text_rol']").val();
		var fallos = validar_rol();
		if (fallos == 0) {
			
			$.ajax({
				url:base_url+'manager/ccrol/insertar',
				data:'rol='+rol+'&descripcion_rol='+descripcion,
				type:'post',
				dataType:'json',
				success:function(data){
					var id_rol;
					var rol;
					var descripcion;
					$.each(data,function(a,b){
						id_rol=b.id_rol;
						rol=b.rol;
						descripcion=b.descripcion;
					});
					refresh_rol("guardado");
				},
				error:function(data)
					{	$('#mod_rol .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; guardar</div>");
						close_msg('#mod_rol .response');
					}
			});
			
		};
	}
	function editar_rol(pos_editar)
	{	$('#mod_rol form .agregar').attr('disabled',true).css({'cursor':'no-drop'});
		var idcomponente=$('#table_aum tr:nth-child('+pos_editar+') td:nth-child(1)').html();
		var componente=$('#table_aum tr:nth-child('+pos_editar+') td:nth-child(2)').html();
		var descripcion=$('#table_aum tr:nth-child('+pos_editar+') td:nth-child(3)').html();
		$("#mod_rol input[name='id-rol']").attr('value',idcomponente);
		$("#mod_rol input[name='rol']").attr('value',componente);
		$("#mod_rol input[name='rol']").focus();
		$('#mod_rol .modificar').attr('disabled',false).css({'cursor':''});
		$('#mod_rol .cancelar').attr('disabled',false).css({'cursor':''});
		$("#mod_rol textarea[name='text_rol']").attr('value',descripcion);
	}
	function modificar_rol()
	{	var idrol=$("#mod_rol input[name='id-rol']").attr('value');
		var rol=$("#mod_rol input[name='rol']").attr('value');
		var descripcion=$("#mod_rol textarea[name='text_rol']").attr('value');
		if(validar_rol()==0){
		$.ajax({
			url:base_url+'manager/ccrol/modificar/',
			data:'id_rol='+idrol+'&rol='+rol+'&descripcion_rol='+descripcion,
			type:'post',
			dataType:'json',
			success:function(data){
				$('#table_aum tr:nth-child('+pos_editar+') td:nth-child(2)').html(rol);
				$('#table_aum tr:nth-child('+pos_editar+') td:nth-child(3)').html(descripcion);
				$("#mod_rol form")[0].reset();
				$("#mod_rol input[name='rol']").attr('value','');
				$("#mod_rol input[name='id-tol']").attr('value','');
				$('#mod_rol form .agregar').attr('disabled',false).css({'cursor':''});
				$('#mod_rol .modificar').attr('disabled',true).css({'cursor':'no-drop'});;
				$('#mod_rol form .cancelar').attr('disabled',true).css({'cursor':'no-drop'});;
				$('#mod_rol .response').fadeIn().html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Rol modificado</div>");
				close_msg('#mod_rol .response');
			},
			error:function(data){
					$('#mod_rol .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; modificar</div>");
					close_msg('#mod_rol .response');
				}
		});}
	}
	function eliminar_rol(pos)
	{
		var id_rol=$("#mod_rol #table_aum tr:nth-child("+pos+") td:nth-child(1)").html();
		console.info(id_rol);
			$.ajax({
				url:base_url+'manager/ccrol/eliminar/'+id_rol,
				type:'post',
				dataType:'json',
				success:function(data)
				{	refresh_rol('eliminado');
					$("#mod_rol #table_aum tbody tr:nth-child("+pos+")").fadeOut('slow',function(){$(this).remove();});},
				error:function(data)
					{	$('#mod_rol .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; eliminar</div>");
						close_msg('#mod_rol .response');
					}
			});
	}
	function refresh_rol(msj){
		$.ajax({
			url:base_url+'manager/ccrol/listar',
			success:function(data){
				$("#mod_rol").html(data);
				$('#mod_rol .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Rol " +msj+"</div>");
				close_msg('#mod_rol .response');
				$('#mod_accion form').submit(function(evento){
					evento.preventDefault();
					if($('#mod_accion .agregar').attr('disabled')=='disabled'){}else{
						insertar_accion();
						$('#mod_accion form')[0].reset();
					}
				});
				$('#mod_rol .eliminar').click(function(){
					var pos_=$("#mod_rol #table_aum td .eliminar").index(this);
					var pos=pos_+1;
					cancelar_rol();
					eliminar_rol(pos);
				});
				$('#mod_rol #table_aum td .editar').click(function() {
					var pos_editar_=$("#table_aum td .editar").index(this);
					pos_editar=pos_editar_+1;
					editar_rol(pos_editar);
				});
				$('#mod_rol .cancelar').click(function() {
					cancelar_rol();
				});
				$('#mod_rol form').submit(function(evento){
					evento.preventDefault();
					if($('#mod_rol .agregar').attr('disabled')=='disabled'){}else{
						insertar_rol();
						$("#mod_rol form")[0].reset();
						$("#mod_rol input[name='rol']").focus();
					}
					});
					$('#mod_rol .modificar').click(function(){
						modificar_rol();
					});
			}
		});
	}
	/*END ABM ROL*/
	function insertar_accion()
	{	var accion=$("#mod_accion input[name='accion']").val();
		var fallos = validar_accion();
		if (fallos == 0){
		$.ajax({
						url:base_url+'manager/ccaccion/insertar',
						data:'accion='+accion,
						type:'post',
						dataType:'json',
						success:function(data){
							var id_accion;
							var accion;							
							$.each(data,function(a,b){
								id_accion=b.id_accion;
								accion=b.accion;								
							});
							refresh_accion("guardado");
						},
						error:function(data){
							$('#mod_accion .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; guardar</div>");
							close_msg('#mod_accion .response');
						}
					});
			};
	}
	function editar_accion(pos_editar)
	{
		$('#mod_accion form .agregar').attr('disabled',true);
		var idaccion=$('#table_acc tr:nth-child('+pos_editar+') td:nth-child(1)').html();
		var accion=$('#table_acc tr:nth-child('+pos_editar+') td:nth-child(2)').html();
		$("#mod_accion input[name='id_acc']").attr('value',idaccion);
		$("#mod_accion input[name='accion']").attr('value',accion);
		$("#mod_accion input[name='accion']").focus();
		$('#mod_accion .modificar').attr('disabled',false).css('cursor','');
		$('#mod_accion .cancelar').attr('disabled',false).css('cursor','');
	}
	function modificar_accion()
	{	var idacc=$("#mod_accion input[name='id_acc']").attr('value');
		var accion=$("#mod_accion input[name='accion']").attr('value');
		if(validar_accion()==0){
			$.ajax({
						url:base_url+'manager/ccaccion/modificar',
						data:'id_accion='+idacc+'&accion='+accion,
						type:'post',
						dataType:'json',
						success:function(data){
							$('#table_acc tr:nth-child('+pos_editar+') td:nth-child(2)').html(accion);
							$("#mod_accion form")[0].reset();
							$("#mod_accion input[name='accion']").attr('value','');
							$("#mod_accion input[name='id_acc']").attr('value','');
							$('#mod_accion form .agregar').attr('disabled',false).css('cursor','');
							$('#mod_accion .modificar').attr('disabled',true).css('cursor','no-drop');
							$('#mod_accion form .cancelar').attr('disabled',true).css('cursor','no-drop');
							$('#mod_accion .response').fadeIn().html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Accion modificado</div>");
							close_msg('#mod_accion .response');			
								},
						error:function(data)
							{	$('#mod_accion .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; modificar</div>");
								close_msg('#mod_accion .response');
							}
					});
			}
	}

	function eliminar_accion(pos)
	{
		var idacc = $("#mod_accion #table_acc tr:nth-child("+pos+") td:nth-child(1)").html();
		console.info(idacc);
			$.ajax({
				url:base_url+'manager/ccaccion/eliminar/'+idacc,
				type:'post',
				dataType:'json',
				success:function(data)
				{
					$("#mod_accion #table_acc tbody tr:nth-child("+pos+")").fadeOut('slow',function(){$(this).remove();});
					refresh_accion("eliminado");
				},
				error:function(data)
					{	$('#mod_accion .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; eliminar</div>");
						close_msg('#mod_accion .response');
					}
			});
	}
	function refresh_accion(msj){
		$.ajax({
			url:base_url+'manager/ccaccion/listar',
			success:function(data){
				$("#mod_accion").html(data);
				$('#mod_accion .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Accion " +msj+"</div>");
				close_msg('#mod_accion .response');
				$('#mod_accion form').submit(function(evento){
					evento.preventDefault();
					if($('#mod_accion .agregar').attr('disabled')=='disabled'){}else{
						insertar_accion();
						$('#mod_accion form')[0].reset();
					}
				});
				$("#mod_accion .eliminar").click(function(){
					var pos_=$("#mod_accion #table_acc td .eliminar").index(this);
					var pos=pos_+1;
					eliminar_accion(pos);
				});
				$('#mod_accion #table_acc td .editar').click(function(){
					var pos_editar_=$("#table_acc td .editar").index(this);
					pos_editar=pos_editar_+1;
					cancelar_accion();
					editar_accion(pos_editar);
				});
				$('#mod_accion .modificar').click(function(){
					modificar_accion();
					});
				$('#mod_accion .cancelar').click(function(){
					cancelar_accion();
				});
			}
		});
	}
	/*STAR USUARIO*/
	function insertar_user()
	{	var sujeto=$('#manager_user #input_adm_sujeto').val();
		var id_sujeto;
		var usuario=$("#manager_user input[name='m_user']").val();
		var contrasenia=$("#manager_user input[name='m_contra']").val();
		var estado=$("#manager_user input[name='m_chek']");
		if(estado.is(':checked'))
			{	var active=1;
			}
		else
			{	var active=0;
			}
		if(validar_sujeto(sujeto)){
		$.each(sujetos,function(a,b){
			if(b[1]==sujeto)
			{	id_sujeto=b[0];
			}
		});
			if(retorno_contrasenia_valido()==true){
				if(validar_usuario()==0){
			$.ajax({
				url:base_url+'manager/ccusuario/insertar',
				data:'usuario='+usuario+'&contrasenia='+contrasenia+'&id_sujeto='+id_sujeto+'&active='+active,
				type:'post',
				dataType:'json',
				success:function(data){
					var usuario;
					var id_usuario;
					var contrasenia;
					var id_sujeto;
					var active;
					var sujeto;
					console.info(data);
					$.each(data,function(a,b){
						id_usuario=b.id_usuario;
						id_sujeto=b.id_sujeto;
						sujeto=b.sujeto;
						usuario=b.usuario;
						contrasenia=b.contrasenia;
						active=b.active;
					});
					if(active==1){estado='Habilitado';} else{estado='Desahabilitado';}
					$('tr:last td', $("#tabla_user"));
					var tds = '<tr>';							
						tds += "<td style='display:none;'>"+id_usuario+"</td><td style='display:none;'>"+id_sujeto+'</td><td>'+sujeto+'</td><td>'+usuario+"</td><td style='display:none;'>"+contrasenia+"</td><td name="+active+">"+estado+'</td>'+
							"<td style='text-align:center;'><button name='bot' class='btn btn-info editar'><i class='icon-pencil icon-white'></i></button></td>"+
							"<td style='text-align:center;'><button class='btn btn-danger eliminar'><i class='icon-fullscreen icon-white' ></i></button></td>";							
						tds += '</tr>';
						$("#tabla_user").append(tds);
						$('#manager_user .confirm_contra_igual,#manager_user .confirm_contra').removeClass("icon-ok");
						$('#manager_user .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Usuario guardado</div>");
						$('#manager_user .eliminar').click(function(){
							var pos_=$("#manager_user #tabla_user td .eliminar").index(this);
							var pos=pos_+1;
							eliminar_usuario(pos);
						});
						$('#manager_user #tabla_user td .editar').click(function() {
							var pos_editar_=$("#tabla_user td .editar").index(this);
							pos_editar=pos_editar_+1;
							editar_usuario(pos_editar);
						});
					},
					error:function(data){
						$('#manager_user .response').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; insertar</div>");
					}
				});}
			}
			else{
				$('#manager_user #input_adm_contra').focus();
				$('#manager_user .response').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong>No coinciden contrase&ntilde;a</strong></div>");
				close_msg('#manager_user .response');
			}
		}
		else{
			$('#manager_user .response').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong>Sujeto inexistente</strong></div>");
			close_msg('#manager_user .response');
		}
		
	}
	function editar_usuario(pos_editar)
	{	$('#manager_user form .agregar').attr('disabled',true).css({'cursor':'no-drop'});
		var id_usuario=$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(1)').html();
		var id_sujeto=$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(2)').html();
		var sujeto=$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(3)').html();
		var usuario=$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(4)').html();
		var contrasenia=$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(5)').html();
		var activo=$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(6)').attr('name');
		$("#manager_user input[name='id_usuario_man']").attr('value',id_usuario);
		$("#manager_user input[name='id_sujeto_man']").attr('value',id_sujeto);
		$("#manager_user input[name='m_user']").attr('value',usuario);
		$("#manager_user input[name='m_contra']").attr('value',contrasenia);
		$("#manager_user #input_adm_confir_contra").attr('value',contrasenia);
		if(activo==1){
			$("#manager_user input[name='m_chek']").attr('checked',true);
		}
		else{
			$("#manager_user input[name='m_chek']").attr('checked',false);
		}
		$("#manager_user #input_adm_sujeto").attr('value',sujeto).css('cursor','no-drop');
		$("#manager_user #input_adm_sujeto").attr('disabled',true);
		$("#manager_user input[name='m_user']").focus();
		$('#manager_user .modificar').attr('disabled',false).css('cursor','');
		$('#manager_user .cancelar').attr('disabled',false).css('cursor','');
	}
	function modificar_usuario()
	{	var sujeto=$('#manager_user #input_adm_sujeto').val();
		var id_usuario=$("#manager_user input[name='id_usuario_man']").val();
		var usuario=$("#manager_user input[name='m_user']").val();
		var contrasenia=$("#manager_user input[name='m_contra']").val();
		var estado=$("#manager_user input[name='m_chek']");
		if(estado.is(':checked'))
			{	var active='Habilitado';
				estado=1;
			}
		else
			{	var active='Deshabilitado';
				estado=0;
			}
			if(retorno_contrasenia_valido()==true){
				if(validar_usuario()==0){
				$.ajax({
					url:base_url+'manager/ccusuario/modificar',
					data:'id_usuario='+id_usuario+'&usuario='+usuario+'&contrasenia='+contrasenia+'&active='+estado,
					type:'post',
					dataType:'json',
					success:function(data){
						$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(3)').html(sujeto);
						$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(4)').html(usuario);
						$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(5)').html(contrasenia);
						$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(6)').html(active);
						$('#tabla_user tr:nth-child('+pos_editar+') td:nth-child(6)').attr('name',estado);
						$("#manager_user form")[0].reset();
						$("#manager_user #input_adm_sujeto").attr('value','').css({'cursor':''});
						$("#manager_user #input_adm_sujeto").attr('disabled',false);
						$("#manager_user input[name='id_usuario_man']").attr('value','');
						$("#manager_user input[name='id_sujeto_man']").attr('value','');
						$("#manager_user input[name='m_user']").attr('value','');
						$("#manager_user input[name='m_contra']").attr('value','');
						$("#manager_user #input_adm_confir_contra").attr('value','');
						$('#manager_user form .agregar').attr('disabled',false).css({'cursor':''});
						/*$('#manager_user .modificar').attr('disabled',true).css({'cursor':'no-drop'});;
						$('#manager_user form .cancelar').attr('disabled',true).css({'cursor':'no-drop'});*/
						$('#manager_user .confirm_contra_igual,#manager_user .confirm_contra').removeClass("icon-remove");
						$('#manager_user .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Usuario modificado</div>");
						close_msg('#manager_user .response');
						cancelar_usuario_();
					},
					error:function(data)
						{	$('#manager_user .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; modificar</div>");
							close_msg('#manager_user .response');
						}
				});}
			}
			else{
				$('#manager_user #input_adm_contra').focus();
				$('#manager_user .response').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong>No coinciden contrase&ntilde;a</strong></div>");
				close_msg('#manager_user .response');
			}
		
	}
	
	function eliminar_usuario(pos)
	{	
		var id_usuario=$("#manager_user #tabla_user tr:nth-child("+pos+") td:nth-child(1)").html();
			$.ajax({
				url:base_url+'manager/ccusuario/eliminar/'+id_usuario,
				type:'post',
				dataType:'json',
				success:function(data){
				console.info(data);
					$("#manager_user #tabla_user tbody tr:nth-child("+pos+")").fadeOut('slow',function(){$(this).remove();});
				},
				error:function(data){
					$('#manager_user .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; eliminar</div>");
					close_msg('#manager_user .response');
					}
			});
	}
	
	function habilitar_modulo()
	{
		var id_sujeto=$("#id_sujeto_login").attr('value');
		$.ajax({
			url:base_url+'util/ccpermiso/habilitar_permiso',
			dataType:'json',
			success:function(data){
			
			$.each(data,function(a,b){
				if(b.id_sujeto==id_sujeto){
					switch (b.id_componente){
						case '84': $('#accion').parent().addClass('modulo_habilitado');$('#accion').parent().removeClass('modulo_deshabilitado');
						$('#accion').parent().parent().parent().addClass('modulo_habilitado');
						$('#accion').parent().parent().parent().removeClass('modulo_deshabilitado');
						break; 
						case '77': $('#componente').parent().addClass('modulo_habilitado');$('#componente').parent().removeClass('modulo_deshabilitado');
						$('#componente').parent().parent().parent().addClass('modulo_habilitado');
						$('#componente').parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '86': $('#rol').parent().addClass('modulo_habilitado');$('#rol').parent().removeClass('modulo_deshabilitado');
						$('#rol').parent().parent().parent().addClass('modulo_habilitado');
						$('#rol').parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '98': $('#constancia_top').parent().addClass('modulo_habilitado');$('#constancia_top').parent().removeClass('modulo_deshabilitado');
						$('#constancia').parent().addClass('modulo_habilitado');$('#constancia').parent().removeClass('modulo_deshabilitado');
						$('#constancia').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#constancia').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '96': $('#tesis').parent().addClass('modulo_habilitado');$('#tesis').parent().removeClass('modulo_deshabilitado');
						$('#tesis').parent().addClass('modulo_habilitado');$('#tesis').parent().removeClass('modulo_deshabilitado');
						$('#tesis').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#tesis').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '89': $('#request_record').parent().addClass('modulo_habilitado');$('#request_record').parent().removeClass('modulo_deshabilitado');
						$('#request_record').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#request_record').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '87': $('#user').parent().addClass('modulo_habilitado');$('#user').parent().removeClass('modulo_deshabilitado');
						$('#user').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#user').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '97': $('#load_voucher').parent().addClass('modulo_habilitado');$('#load_voucher').parent().removeClass('modulo_deshabilitado');
						$('#load_voucher').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#load_voucher').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '91': $('#role_assignment').parent().addClass('modulo_habilitado');$('#role_assignment').parent().removeClass('modulo_deshabilitado');
						$('#role_assignment').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#role_assignment').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '93': $('#role_assignment_component').parent().addClass('modulo_habilitado');$('#role_assignment_component').parent().removeClass('modulo_deshabilitado');
						$('#role_assignment_component').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#role_assignment_component').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
						case '94': $('#role_component_action').parent().addClass('modulo_habilitado');$('#role_component_action').parent().removeClass('modulo_deshabilitado');
						$('#role_component_action').parent().parent().parent().parent().addClass('modulo_habilitado');
						$('#role_component_action').parent().parent().parent().parent().removeClass('modulo_deshabilitado');
						break;
					}
				}
			});
			
			}
		});
		
		
	}

	/*END USUARIO*/
	function insertar_solictiud_tesis()
	{	$("#mod_request_record form").submit(function(evento){
		var asesor=$('#input_man_asesor').val();
		var titulo=$('#input_man_titulo').val();
		var voucher=$('#input_man_voucher').val();
		var correo=$('#input_man_correo').val();
		var introduccion=$("#mod_request_record textarea[name='introduccion_tes']").val();
		//if (introduccion=="") //{alert('Vacio D:')};
		var objetivo=$("#mod_request_record textarea[name='objetivo_tes']").val();
		var resumen=$("#mod_request_record textarea[name='resumen_tes']").val();
		var conclusion=$("#mod_request_record textarea[name='conclusion_tes']").val();
		var id_docente;
		var id_sujeto1=$("#id_sujeto_login").val();
		$.each(asesores,function(a,b){
			if(b[1]==asesor)
			{	id_docente=b[0];
			}
		});
		evento.preventDefault();
		if(validar_asesor(asesor)){
			if(validar_solicitar_constancia()==0){
				var id_sujeto2="0";
				if($("#mod_request_record #check_acompaniante").is(":checked")){
					var autor_acom=$("#mod_request_record #input_man_acompaniante").val();
						if(validar_autor_acom(autor_acom)){
							$.each(autores_acom,function(a,b){
								if(b[1]==autor_acom)
								{	id_sujeto2=b[0];
								}
							});
							ajax_insertar_solicitud_tesis(titulo,voucher,correo,introduccion,objetivo,resumen,conclusion,id_docente,id_sujeto1,id_sujeto2,2);
							}
						else{
							$('#mod_request_record .msg_request_record').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong class='msg'></strong></div>");
							$('#mod_request_record .msg_request_record .error_request_record .msg').html('Acompa&ntilde;ante inexistente');
						}
					}else{
						ajax_insertar_solicitud_tesis(titulo,voucher,correo,introduccion,objetivo,resumen,conclusion,id_docente,id_sujeto1,id_sujeto2,1);
					}
				}
		}
		else{
			$('#mod_request_record .msg_request_record').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong class='msg'></strong></div>");
			$('#mod_request_record .msg_request_record .error_request_record .msg').html('Asesor inexistente');
		}
	});
	}
	function ajax_insertar_solicitud_tesis(titulo,voucher,correo,introduccion,objetivo,resumen,conclusion,id_docente,id_sujeto1,id_sujeto2,pIns){
		$.ajax({
			url:base_url+'user/ccrequestrecord/insertar_solitud',
			type:'POST',
			data:"&titulo="+titulo+"&voucher="+voucher+"&correo="+correo+"&introduccion="+introduccion+"&objetivo="+objetivo+"&resumen="+resumen+"&conclusion="+conclusion+"&id_docente="+id_docente+"&id_sujeto1="+id_sujeto1+"&id_sujeto2="+id_sujeto2+"&pIns="+pIns,
			success:function(data){
				$("#mod_request_record form")[0].reset();
				$("#input_man_asesor").focus();
				$('#mod_request_record #myTab li').removeClass();
				$('#mod_request_record #myTab li:nth-child(1)').addClass('active');
				$('#mod_request_record .msg_request_record').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong><br>Solicitud aceptada</div>");
				$("#mod_request_record #input_man_acompaniante").attr('disabled',true);
				$("#mod_request_record #input_man_acompaniante").attr('required',false);
				close_msg('#mod_request_record .msg_request_record');
			},
			error:function(data){
				$('#mod_request_record .msg_request_record').html("<div class='alert alert-error error_request_record' style='text-align:center;'><a class='close' data-dismiss='alert'>x</a><strong class='msg'></strong></div>");
				$('#mod_request_record .msg_request_record .error_request_record .msg').html('No se pudo enviar la solicitud');
				close_msg('#mod_request_record .msg_request_record');
			}
		});
	}
	/*ABM DE COMPONENTE*/
	function insertar_componente()
	{	var componente=$("#mod_componente input[name='componente']").val();
		var descripcion_componente=$("#mod_componente textarea[name='desc_componente']").val();
		var oficina=$("#input_comp_oficina").val();
		var id_oficina;
		$.each(oficinas,function(a,b){
			if(b[1]==oficina)
			{	id_oficina=b[0];
			}
		});
		var fallos = validar_componente();
		if (fallos == 0) {
			$.ajax({
				url:base_url+'manager/cccomponente/insertar',
				data:'componente='+componente+'&descripcion_componente='+descripcion_componente+'&id_oficina='+id_oficina,
				type:'post',
				dataType:'json',
				success:function(data){
					var id_componente;
					var componente;
					var descripcion_componente;
					var id_oficina;
				$.each(data,function(a,b){
					id_componente=b.id_componente;
					componente=b.componente;
					descripcion_componente=b.descripcion_componente;
					id_oficina=b.id_oficina;
				});
				refresh_componente('guardado');
					$('#mod_componente .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Componente guardado</div>");
					close_msg('#mod_componente .response');
				},
				error:function(data)
				{	$('#mod_componente .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; guardar</div>");
					close_msg('#mod_componente .response');
				}
			});
			};
	}
	function editar_componente(pos_editar)
	{	$('#mod_componente form .agregar').attr('disabled',true).css({'cursor':'no-drop'});
		var idcomponente=$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(1)').html();
		var componente=$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(2)').html();
		var descripcion=$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(3)').html();
		var oficina=$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(5)').html();

		$("#mod_componente input[name='id_comp']").attr('value',idcomponente);
		$("#mod_componente input[name='componente']").attr('value',componente);
		$("#mod_componente input[name='componente']").focus();
		$('#mod_componente .modificar').attr('disabled',false).css({'cursor':''});
		$('#mod_componente .cancelar').attr('disabled',false).css({'cursor':''});
		$("#mod_componente textarea[name='desc_componente']").attr('value',descripcion);
		$("#input_comp_oficina").attr('value',oficina);
	}
	function modificar_componente()
	{	var idcomp=$("#mod_componente input[name='id_comp']").attr('value');
		var componente=$("#mod_componente input[name='componente']").attr('value');
		var descripcion_componente=$("#mod_componente textarea[name='desc_componente']").attr('value');
		var oficina=$("#input_comp_oficina").val();
		var id_oficina;
		$.each(oficinas,function(a,b){
			if(b[1]==oficina)
			{	id_oficina=b[0];
			}
		});

		if(validar_componente()==0){
			$.ajax({
				url:base_url+'manager/cccomponente/modificar',
				data:'id_componente='+idcomp+'&componente='+componente+'&descripcion_componente='+descripcion_componente+'&id_oficina='+id_oficina,
				type:'post',
				dataType:'json',
				success:function(data){
					$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(2)').html(componente);
					$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(3)').html(descripcion_componente);
					$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(4)').html(id_oficina);
					$('#table_comp tr:nth-child('+pos_editar+') td:nth-child(5)').html(oficina);
					$("#mod_componente form")[0].reset();
					$("#mod_componente input[name='componente']").attr('value','');
					$("#mod_componente input[name='id_comp']").attr('value','');
					$('#mod_componente form .agregar').attr('disabled',false).css({'cursor':''});
					$('#mod_componente .modificar').attr('disabled',true).css({'cursor':'no-drop'});
					$('#mod_componente form .cancelar').attr('disabled',true).css({'cursor':'no-drop'});
					$('#mod_componente .response').fadeIn().html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Componente modificado</div>");
					close_msg('#mod_componente .response');
				},
				error:function(data){
						$('#mod_componente .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; modificar</div>");
						close_msg('#mod_componente .response');
					}
			});
			}
	}
	
	function eliminar_componente(pos)
	{	
		var idcomp=$("#mod_componente #table_comp tr:nth-child("+pos+") td:nth-child(1)").html();
			$.ajax({
				url:base_url+'manager/cccomponente/eliminar/'+idcomp,
				type:'post',
				dataType:'json',
				success:function(data){
					$("#mod_componente #table_comp tbody tr:nth-child("+pos+")").fadeOut('slow',function(){$(this).remove();});
					refresh_componente('eliminado');
				},
				error:function(data){	
					$('#mod_componente .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; eliminar</div>");
					close_msg('#mod_componente .response');
				}
			});
	}
	function refresh_componente(msj){
		$.ajax({
			url:base_url+'manager/cccomponente/listar',
			success:function(data){
				$("#mod_componente").html(data);
				$('#mod_componente .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Componente " +msj+"</div>");
				close_msg('#mod_componente .response');
				$('#mod_componente .eliminar').click(function(){
					var pos_=$("#mod_componente #table_comp td .eliminar").index(this);
					var pos=pos_+1;
					eliminar_componente(pos);
				});
				$('#mod_componente #table_comp td .editar').click(function() {
					var pos_editar_=$("#table_comp td .editar").index(this);
					pos_editar=pos_editar_+1;
					cancelar_componente();
					editar_componente(pos_editar);
				});
				$('#mod_componente .cancelar').click(function() {
					cancelar_componente();
				});
				$('#mod_componente form').submit(function(evento){
					evento.preventDefault();
					if($('#mod_componente .agregar').attr('disabled')=='disabled'){}else{
						insertar_componente();
					}
					$("#mod_componente form")[0].reset();
					$("#mod_componente input[name='componente']").focus();
				});
				$('#mod_componente .modificar').click(function(){
					modificar_componente();
				});
			}
		});
	}

	/*ABM DE OFICINA*/
	function insertar_oficina()
	{	
		var oficina=$("#input_man_oficina").val();
		var descripcion_oficina=$("#mod_oficina textarea[name='desc_oficina']").val();		

		if($("#mod_oficina input[name ='ofi_chek']").is(':checked'))
			{	var activo=1;
			}
		else
			{	var activo=0;
			}
			$.ajax({
				url:base_url+'manager/ccoficina/insertar',
				data:'oficina='+oficina+'&descripcion_oficina='+descripcion_oficina+'&activo='+activo,
				type:'post',
				dataType:'json',
				success:function(data){
					var id_oficina;
					var oficina;
					var descripcion_oficina;
					var activo;
				$.each(data,function(a,b){
					id_oficina=b.id_oficina;
					oficina=b.oficina;
					descripcion_oficina=b.descripcion_oficina;
					activo=b.activo;
				});
				refresh_oficina('guardado');
					$('#mod_oficina .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Oficina guardada</div>");
					close_msg('#mod_oficina .response');
					
				},
				error:function(data)
				{	$('#mod_oficina .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; guardar</div>");
					close_msg('#mod_oficina .response');
				}
			});
			;

		}

		function editar_oficina(pos_editar)
		{	$('#mod_oficina form .agregar').attr('disabled',true).css({'cursor':'no-drop'});
			var id_oficina=$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(1)').html();
			var oficina=$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(2)').html();
			var descripcion_oficina=$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(3)').html();
			var activo=$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(4)').attr('name');
			$("#mod_oficina input[name='id_ofi']").attr('value',id_oficina);
			$("#mod_oficina input[name='oficina']").attr('value',oficina);
			$("#mod_oficina input[name='oficina']").focus();
			$("#mod_oficina textarea[name='desc_oficina']").attr('value',descripcion_oficina);
			$("#mod_oficina input[name='ofi_chek']").attr('value',activo);
			if(activo==1){
			$("#mod_oficina input[name='ofi_chek']").attr('checked',true);
			}
			else{
				$("#mod_oficina input[name='ofi_chek']").attr('checked',false);
			}
			$('#mod_oficina .modificar').attr('disabled',false).css({'cursor':''});
			$('#mod_oficina .cancelar').attr('disabled',false).css({'cursor':''});
		}

		function modificar_oficina()
			{	var id_oficina=$("#mod_oficina input[name='id_ofi']").attr('value');
				var oficina=$("#mod_oficina input[name='oficina']").attr('value');
				var descripcion_oficina=$("#mod_oficina textarea[name='desc_oficina']").attr('value');
				var activo=$("#mod_oficina input[name='ofi_chek']");
				if(activo.is(':checked'))
					{	var activo='Habilitado';
						activo=1;
					}
				else
					{	var activo='Deshabilitado';
						activo=0;
					}

					//if(validar_oficina()==0){
					$.ajax({
						url:base_url+'manager/ccoficina/modificar',
						data:'id_oficina='+id_oficina+'&oficina='+oficina+'&descripcion_oficina='+descripcion_oficina+'&activo='+activo,
						type:'post',
						dataType:'json',
						success:function(data){
							$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(2)').html(oficina);
							$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(3)').html(descripcion_oficina);
							$('#table_oficina tr:nth-child('+pos_editar+') td:nth-child(4)').html(activo);
							$("#mod_oficina form")[0].reset();
							$("#mod_oficina input[name='oficina']").attr('value','');
							$("#mod_oficina input[name='id_ofi']").attr('value','');
							$("#mod_oficina textarea[name='desc_oficina']").attr('value','');
							$("#mod_oficina input[name='ofi_chek']").attr('value','');
							$('#mod_oficina form .agregar').attr('disabled',false).css({'cursor':''});
							$('#mod_oficina .modificar').attr('disabled',true).css({'cursor':'no-drop'});
							$('#mod_oficina form .cancelar').attr('disabled',true).css({'cursor':'no-drop'});
							$('#mod_oficina .response').fadeIn().html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Oficina modificada</div>");
							close_msg('#mod_oficina .response');
						},
						error:function(data){
								$('#mod_oficina .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; modificar</div>");
								close_msg('#mod_oficina .response');
							}
					});
					//}
			}

			function eliminar_oficina(pos)
						{	
							var id_oficina=$("#mod_oficina #table_oficina tr:nth-child("+pos+") td:nth-child(1)").html();
								$.ajax({
									url:base_url+'manager/ccoficina/eliminar/'+id_oficina,
									type:'post',
									dataType:'json',
									success:function(data){
										$("#mod_oficina #table_oficina tbody tr:nth-child("+pos+")").fadeOut('slow',function(){$(this).remove();});
										refresh_oficina('eliminado');
									},
									error:function(data){	
										$('#mod_oficina .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Oh no!</strong> fall&oacute; eliminar</div>");
										close_msg('#mod_oficina .response');
									}
								});
						}

		function refresh_oficina(msj){
		$.ajax({
			url:base_url+'manager/ccoficina/listar',
			success:function(data){
				$("#mod_oficina").html(data);
				$('#mod_oficina .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>&iexcl;Bien hecho!</strong> Oficina " +msj+"</div>");
				close_msg('#mod_oficina .response');

				$('#mod_oficina .eliminar').click(function(){
					var pos_=$("#mod_oficina #table_oficina td .eliminar").index(this);
					var pos=pos_+1;
					eliminar_oficina(pos);
				});

				$('#mod_oficina #table_oficina td .editar').click(function() {
					var pos_editar_=$("#table_oficina td .editar").index(this);
					pos_editar=pos_editar_+1;
					cancelar_oficina();
					editar_oficina(pos_editar);
				});
	
				$('#mod_oficina form').submit(function(evento){
					evento.preventDefault();
					if($('#mod_oficina .agregar').attr('disabled')=='disabled'){}else{
						insertar_oficina();
					}
					$("#mod_oficina form")[0].reset();
					$("#mod_oficina input[name='oficina']").focus();
				});

				$('#mod_oficina .modificar').click(function(){
					modificar_oficina();
				});

				$('#mod_oficina .cancelar').click(function() {
					cancelar_oficina();
				});			
							}
		});
	}

	/*ABM DE COMPONENTE*/
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
	{	var res;
		var res1 = $('#input_man_componente').validCampo(/^[a-zA-Z_-\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \s]*$/,'#form_component','No se aceptan caracteres especiales.');
		var res2 = $('#comment_body').validCampo(/^[a-zA-z_-\s\.]*$/,'#form_component','No se aceptan caracteres especiales.');
		res = res1 + res2;
		 return res;
	}
	function validar_accion(){
		var res = $('#input_man_accion').validCampo(/^[a-zA-z\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \s]*$/,'#form_accion','Se acepta solo caracteres alfabeticos.');
		return res;
	}
	function validar_rol(){var res;
		var res1 =	$('#input_man_rol').validCampo(/^[a-zA-Z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s]*$/,'#form_rol','Se acepta solo caracteres alfabeticos.');
		var res2=$('#inpur_man_descripcion').validCampo(/^[a-zA-Z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s\.]*$/,'#form_rol','Se acepta solo caracteres alfabeticos.');
		res=res1+res2;
		return res;
	}
	function validar_tesis(){
		var res = $('#titulo').validCampo(/^[a-zA-Z_-\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s\.\d]*$/,'#form_nuevo_tesis','No acepta caracteres especiales.');
		$('#autor').validCampo(/^[a-zA-\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s]*$/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#asesor').validCampo(/^[a-zA-z\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s]*$/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#anio').validCampo(/[\d{2}\/\d{2}\/\d{4}]/,'#form_nuevo_tesis','Se acepta solo caracteres alfabeticos.');
		$('#input_introduccion').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 ÁÉÍÓÚ\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_objetivo').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_resumen').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		$('#input_conclusion').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 ÁÉÍÓÚ\.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_nuevo_tesis','No se aceptan caracteres especiales.');
		return res;
	}

	function validar_solicitar_constancia()
	{	var res;
		var res0=$('#input_man_asesor').validCampo(/^[a-zA-z,\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s]*$/,'#form_user','Se acepta solo caracteres alfabeticos.');		
		var res1=$('#input_man_titulo').validCampo(/^[a-zA-Z_,-\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s\.\d]*$/,'#form_user','No acepta caracteres especiales.');
		var res2=$('#input_man_voucher').validCampo(/^[\d]*$/,'#form_user','Se aceptan solo caracteres numericos.');
		var res3=$('#input_man_correo').validCampo(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,'#form_user','Verifique que tenga formato de correo electronico.');
		var res4=$('#input_user_introduccion').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var res5=$('#input_user_objetivo').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var res6=$('#input_user_resumen').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var res7=$('#input_user_conclusion').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_user','No se aceptan caracteres especiales.');
		var res8=$("#input_man_acompaniante").validCampo(/^[a-zA-z,\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s]*$/,'#form_user','Se acepta solo caracteres alfabeticos.');
		res=res0+res1+res2+res3+res4+res5+res6+res6+res7;
		
		return res;
	}
	function validar_usuario()
	{	var res;
		var res0 = $('#input_adm_sujeto').validCampo(/^[a-zA-Z_,-\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \s]*$/,'#form_adm_user','No se aceptan caracteres especiales.');
		var res1 =$('#input_adm_user').validCampo(/^[a-zA-Z_-\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \d]*$/,'#form_adm_user','No se aceptan caracteres especiales.');
		var res2 =$('#input_adm_contra').validCampo(/^[a-zA-z-_\u00e1 \u00e9 \u00ed \u00f3 \u00fa \u00c1 \u00c9 \u00cd \u00d3 \u00da \u00FC \u00DC \xF1 \xD1 \.,:;<>0=\s\t\f\v\(\)\[\]\/\d\]["']*$/,'#form_adm_user','No se aceptan caracteres especiales.');
		res=res0+res1+res2;
		return res;
	}
	function validar_file()
	{	
		var res = $('#input_control').validCampo(/^.+\.txt$/,'#form_voucher','Solo se acepta formato .txt');
		return res;
	}
	function validar_asignacion_rol()
	{	
		var res = $('#input_rol_asig').validCampo(/^[a-zA-z\s]*$/,'#form_rol_asig','Se acepta solo caracteres alfabeticos.');
		return res;
	}

	function validar_asignacion_rol_componente()
	{	
		var res = $('#input_comp_asig').validCampo(/^[a-zA-z\s]*$/,'#form_comp_asig','Se acepta solo caracteres alfabeticos.');
		return res;
	}
	function validar_componente_accion()
	{	
		var res = $('#input_acc_asig').validCampo(/^[a-zA-z\s]*$/,'#form_acc_asig','Se acepta solo caracteres alfabeticos.');
		return res;
	}
	function validar_asesor(asesor)
	{	var resultado=false;
		$.each(asesores,function(a,b){
			if(b[1]==asesor)
			{	resultado=true;
			}
		});
		return resultado;
	}
	function validar_sujeto(sujeto)
	{	var resultado=false;
		$.each(sujetos,function(a,b){
			if(b[1]==sujeto)
			{	resultado=true;
			}
		});
		return resultado;
	}
	function validar_autor_acom(autor_acom){
		var resultado=false;
		$.each(autores_acom,function(a,b){
			if(b[1]==autor_acom)
			{	resultado=true;
			}
		});
		return resultado;
	}
	function validar()
	{
	}	
	function cargar_facultad(tipo)
	{	
		$.ajax({
			url:base_url+'util/ccfacultad/cargar_facultad',
			type:"POST",
			success:function(data){
				switch (tipo){
					case 2:
					$('#new_tesis #facultad_tesis').html(data);
					break;
					case 1:
					$('#new_exportar #facultad').html(data);
					break;
					case 3:
					$('#new_monografia #facultad').html(data);
					break;
				}	
				$('#select_man_facultad').change(function(){
					idFacultad= $('#new_exportar #select_man_facultad option:selected').attr('value');
					//console.info($("#new_exportar form [name='escuela']").is(':checked'));
					if($("#new_exportar form [name='escuela']").is(':checked')){
						cargar_escuela(1, idFacultad);
					};
				});
			}
		});
	}

	function cargar_escuela(tipo,idFacultad)
	{
		$.ajax({
			url:base_url+'util/ccescuela/cargar_escuela',
			data:'idFacultad='+idFacultad,
			type:"POST",
			success:function(data){
			switch (tipo){
					case 2:
						$('#new_tesis #escuela_tesis').html(data);
					break;
					case 1:
						$('#new_exportar #escuela').html(data);
					break;
					case 3:
						$('#new_monografia #escuela').html(data);
					break;
				}		
			}
		});
	}
	function buscar_asesor()
	{	$.ajax({
			url:base_url+'user/ccrequestrecord/buscar_asesor',
			type:"POST",
			dataType:"json",
			success:function(data){
				var asesor=[];
				$.each(data,function(a,b){
					asesor.push(b.docente);
					asesores.push([b.id_docente,b.docente]);
				});
				if($('#mod_request_record').is(':visible')){
					$('#input_man_asesor').typeahead().data('typeahead').source = asesor;
				}
				
				if($('#module_tesis').is(':visible')){
					$('#module_tesis #asesor').typeahead({
						source: asesor,
						items:4
					});
				}
				$('#new_exportar #input_export_asesor').typeahead().data('typeahead').source = asesor;
					
			}
		});
	}
	function buscar_sujeto()
	{
		$.ajax({
			url:base_url+'manager/ccusuario/buscar_sujeto',
			type:"POST",
			dataType:"json",
			success:function(data){
				var sujeto=[];
				$.each(data,function(a,b){
					sujeto.push(b.sujeto);
					sujetos.push([b.id_sujeto,b.sujeto]);
				});
				$('#input_adm_sujeto').typeahead().data('typeahead').source = sujeto;
			}
		});
	}

	function buscar_oficina()
	{
		$.ajax({
			url:base_url+'manager/cccomponente/buscar_oficina',
			type:"POST",
			dataType:"json",
			success:function(data){
				var oficina=[];
				$.each(data,function(a,b){
					oficina.push(b.oficina);
					oficinas.push([b.id_oficina,b.oficina]);
				});
				$('#input_comp_oficina').typeahead().data('typeahead').source = oficina;
			}
		});
	}

	var autores_acom=[];
	function buscar_autor_acompa()
	{
		var id_sujeto=$("#id_sujeto_login").attr('value');;
		$.ajax({
			url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/buscar_autor_tesis',
			data:'id_sujeto='+id_sujeto,
			type:"POST",
			dataType:"json",
			success:function(data){
				var autor_acom=[];
				$.each(data,function(a,b){
					autor_acom.push(b.alumno);
					autores_acom.push([b.id_autor_interno,b.alumno]);
				});
				$('#mod_request_record #input_man_acompaniante').typeahead({
					source:autor_acom,
					items:4
				});

			}
		});
	}
	function buscar_rol_componente()
	{
		$.ajax({
			url:base_url+'manager/ccrol/buscar_rol',
			type:"POST",
			dataType:"json",
			success:function(data){
				var componente_rol=[];
				$.each(data,function(a,b){
				
					componente_rol.push(b.rol);
					
				});
				$('#input_comp_asig').typeahead().data('typeahead').source = componente_rol;
			}
		});	
		
		
	}
	function validar_contrasenia_man(){
		$('#input_adm_confir_contra').keyup(function() {
			var contrasenia=$('#manager_user #input_adm_contra').val();
			  var confirmar_contrasenia=$('#manager_user #input_adm_confir_contra').val();
			  if((confirmar_contrasenia==contrasenia)&&confirmar_contrasenia!=""&&contrasenia!="")
			  {		class_contrasenia_valida();		
			  }
			  else
			  {		class_contrasenia_invalida();
			  }
		});
		$('#input_adm_contra').keyup(function() {
			var contrasenia=$('#manager_user #input_adm_contra').val();
			  var confirmar_contrasenia=$('#manager_user #input_adm_confir_contra').val();
			  if((confirmar_contrasenia==contrasenia)&&confirmar_contrasenia!=""&&contrasenia!="")
			  {		class_contrasenia_valida();
			  }
			  else
			  {		class_contrasenia_invalida();
			  }
		});
	}
	function class_contrasenia_valida()
	{	$('#manager_user .confirm_contra_igual').removeClass("icon-remove");
	  	$('#manager_user .confirm_contra').addClass("icon-ok");
	  	$('#manager_user .confirm_contra_igual').addClass("icon-ok");
	}
	function class_contrasenia_invalida()
	{	$('#manager_user .confirm_contra').removeClass("icon-ok");
	  	$('#manager_user .confirm_contra_igual').addClass("icon-remove");
	}
	function retorno_contrasenia_valido()
	{	var resultado=false;
		var contrasenia=$('#manager_user #input_adm_contra').val();
		var confirmar_contrasenia=$('#manager_user #input_adm_confir_contra').val();
		if(confirmar_contrasenia==contrasenia)
		{	resultado=true;
		}
		else{
			resultado=false;
		}
		return resultado;
	}
	function cancelar_usuario_()
	{
		
		$("#manager_user #input_adm_sujeto").attr('disabled',false);
		$("#manager_user #input_adm_sujeto").attr('value','').css({'cursor':''});
		$("#manager_user input[name='id_usuario_man']").attr('value','');
		$("#manager_user input[name='id_sujeto_man']").attr('value','');
		$('#manager_user .cancelar').attr('disabled',true).css({'cursor':'no-drop'});;
		$('#manager_user .modificar').attr('disabled',true).css({'cursor':'no-drop'});;
		$("#manager_user form")[0].reset();
		$("#manager_user input[name='m_user']").attr('value','');
		$("#manager_user input[name='m_contra']").attr('value','');
		$("#manager_user #input_adm_confir_contra").attr('value','');
		$('#manager_user form .agregar').attr('disabled',false).css({'cursor':''});
	}
	function cancelar_rol()
	{
		$('#mod_rol .cancelar').attr('disabled',true).css({'cursor':'no-drop'});
		$('#mod_rol .modificar').attr('disabled',true).css({'cursor':'no-drop'});
		$("#mod_rol form")[0].reset();
		$("#mod_rol input[name='rol']").attr('value','');
		$("#mod_rol input[name='id-rol']").attr('value','');
		$('#mod_rol form .agregar').attr('disabled',false).css({'cursor':''});
	}
	function cancelar_accion()
	{	
		$('#mod_accion .cancelar').attr('disabled',true).css('cursor','no-drop');
		$('#mod_accion .modificar').attr('disabled',true).css('cursor','no-drop');
		$("#mod_accion form")[0].reset();
		$("#mod_accion input[name='accion']").attr('value','');
		$("#mod_accion input[name='id_acc']").attr('value','');
		$('#mod_accion form .agregar').attr('disabled',false).css('cursor','');
	}
	function cancelar_componente(){
		$('#mod_componente .cancelar').attr('disabled',true).css({'cursor':'no-drop'});
		$('#mod_componente .modificar').attr('disabled',true).css({'cursor':'no-drop'});
		$("#mod_componente form")[0].reset();
		$("#mod_componente input[name='componente']").attr('value','');
		$("#mod_componente input[name='id_comp']").attr('value','');
		$('#mod_componente form .agregar').attr('disabled',false).css({'cursor':''});
	}

	function cancelar_oficina(){
		$('#mod_oficina .cancelar').attr('disabled',true).css({'cursor':'no-drop'});
		$('#mod_oficina .modificar').attr('disabled',true).css({'cursor':'no-drop'});
		$("#mod_oficina form")[0].reset();
		$("#mod_oficina input[name='oficina']").attr('value','');
		$("#mod_oficina input[name='id_oficina']").attr('value','');
		$('#mod_oficina form .agregar').attr('disabled',false).css({'cursor':''});
	}

	function close_msg(id)
	{	$(id).delay(1000).fadeOut();
	}