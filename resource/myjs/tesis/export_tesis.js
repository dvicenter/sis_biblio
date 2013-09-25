$(document).ready(function(){
	$('#new_exportar').on('shown',function(){
		$("#new_exportar .export").css('cursor','no-drop');
		$("#new_exportar form [name='facultad']").click(function(){
			if($(this).is(':checked')){
				$("#new_exportar [name='escuela']").attr('disabled',false);
				cargar_facultad(1);
			}
			else{
				$("#new_exportar [name='escuela']").attr('disabled',true);
			}
		});
		$("#new_exportar form [name='escuela']").click(function(){
			var id=$('#new_exportar #select_man_facultad option:selected').attr('value');
			cargar_escuela(1, id);
		});
		
		$("#new_exportar form [name='escuela']").click(function(){
			cargar_escuela(1,1);
		});
		$("#new_exportar form [name='asesor']").click(function(){
			buscar_asesor();
		});
		$("#new_exportar form.check_option .opcion input").click(function(){
			$("#new_exportar .export").attr('disabled',false);
			var tr=$('#new_exportar form.check_option .opcion input');
			$.each(tr,function(index,value){
				if(tr.is(':checked')==false){
					$("#new_exportar .export").attr('disabled',true);
				}
	        });
	
		});
	});

// Hasta aquí es e
	$('#new_exportar').on('hide',function(){
		$('#new_exportar form')[0].reset();
		$("#new_exportar form [name='escuela']").attr('disabled',true);
		$('#new_exportar .resultado li').css('display','none');
	});
});