$(document).ready(function(){
	
	$('#tesis').click(function(){
		load_module('module/tesis/manager_tesis', '#tesis', '#tesis_top');
	});
	$('#tesis_top').click(function(){
		load_module('module/tesis/manager_tesis', '#tesis', '#tesis_top');
	});
	$('#constancia').click(function(){
		load_module('module/constancia/manager_constancia', '#constancia', '#constancia_top');
	});
	$('#constancia_top').click(function(){
		load_module('module/constancia/manager_constancia', '#constancia', '#constancia_top');
	});
	$('#user').click(function(){
		load_module('module/manager/manager_user', '#user', 'null');
	});
	$('#role_assignment').click(function(){
		load_module('module/role_assignment/role_assignment', '#role_assignment', 'null');
	});
	$('#request_record').click(function(){
		load_module('module/user/request_record', '#request_record', 'null');
	});
	$('#tesis_consultation').click(function(){
		load_module('module/user/tesis_consultation', '#tesis_consultation', 'null');
	});
	$('#role_assignment_component').click(function(){
		load_module('module/role_assignment_component/role_assignment_component', '#role_assignment_component', 'null');
	});
	$('#role_component_action').click(function(){
		load_module('module/role_component_action/role_component_action', '#role_component_action', 'null');
	});
	$('#rol').click(function(){
		load_module('module/rol/rol_user', '#rol_user', 'null');
	});
	$('#componente').click(function(){
		load_module('module/componente/componente_user', '#componente_user', 'null');
	});
	$('#accion').click(function(){
		load_module('module/accion/accion_user', '#accion_user', 'null');
	});
	$('#load_voucher').click(function(){
		load_module('module/voucher/voucher', '#load_voucher', 'null');
	});
	function active(selector,selector_top)
	{
		$('.nav-list > li').removeClass('active');
		$('.nav > li').removeClass('active');
		$($(selector).parent()).addClass('active');
		if(($(selector).parent()).find('.import')){
			$($(selector_top).parent()).addClass('active');
		}
	}
	function load_module(url,id_nav_left,id_nav_top)
	{
		$.ajax({
			url:url,
			beforeSend:function(data){
				$('#module_content').html('<div class="loading"><img src="resource/img/utilities/gif/loading.gif"/></div>');
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

