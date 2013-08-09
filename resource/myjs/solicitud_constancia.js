$(document).ready(function(){
	$('#consult_related .close__').click(function(){
		$('#consult_related').modal('hide');
	});
	$('#actual_tesis #search_student').click(function(){
		active_consult('.consult_student', '.consult_asesor');
		var id_plan_tesis=$("#actual_tesis input[name='id_plan_tesis_form']").attr('value');
		var id_alumno=$("#actual_tesis input[name='id_alumno_form']").attr('value');
		$.ajax({
			url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/informe_practica',
			dataType:'json',
			type:'post',
			data:'id_alumno='+id_alumno,
			success:function(data){console.info(data);
				$.each(data,function(a,b){
					$('#consult_student #input01').attr('value',b.titulo);
					$('#consult_student #input03').attr('value',b.docente);
					$("#consult_student textarea[name='introduccion']").attr('value',b.introduccion);
					$("#consult_student textarea[name='objetivo']").attr('value',b.objetivo);
					$("#consult_student textarea[name='resumen']").attr('value',b.resumen);
					$("#consult_student textarea[name='conclusion']").attr('value',b.conclusion);
				});
			}
		});
	});
	$('#actual_tesis #search_asesor').click(function(){
		active_consult('.consult_asesor', '.consult_student');
		var id_docente=$("#actual_tesis input[name='id_docente_form']").attr('value');
		$.ajax({
			url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/buscarXAsesor',
			type:'post',
			data:'id_docente='+id_docente,
			success:function(data){
				$('#consult_related .consult_asesor').html(data);
				$('#consult_asesor table tbody tr').click(function(){
					var pos=$('#consult_asesor table tbody tr').index(this);
					var intro=$('#consult_asesor table tbody tr:eq('+pos+') td:nth-child(2)').html();
					var obj=$('#consult_asesor table tbody tr:eq('+pos+') td:nth-child(3)').html();
					var resu=$('#consult_asesor table tbody tr:eq('+pos+') td:nth-child(4)').html();
					var conclu=$('#consult_asesor table tbody tr:eq('+pos+') td:nth-child(5)').html();
					$("#consult_asesor textarea[name='introduccion']").attr('value',intro);
					$("#consult_asesor textarea[name='objetivo']").attr('value',obj);
					$("#consult_asesor textarea[name='resumen']").attr('value',resu);
					$("#consult_asesor textarea[name='conclusion']").attr('value',conclu);
				});
				
			}
		});
	});
	$('#consult_related .desaprobar').click(function(){
		aprobacion_constancia(2);
		reporte_negatividad();
	});
	$('#consult_related .aprobar').click(function(){
		aprobacion_constancia(3);
		reporte_negatividad();
	});
	$('#consult_related .close').click(function(){
		$('.consult_student').removeClass('active_consult');
		$('.consult_asesor').removeClass('active_consult');
	});
	$('#module_constancia #solicitud_constancia .comparation').click(function(){
		var pos_=$('#module_constancia #solicitud_constancia td .comparation').index(this);
		var pos=pos_+1;
		var id_plan_tesis=$('#module_constancia #solicitud_constancia tbody tr:nth-child('+pos+') td:nth-child(1)').html();
		$.ajax({
			url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/buscar_plan_tesis',
			data:'id_plan_tesis='+id_plan_tesis,
			dataType:'json',
			success:function(data){
				$('#consult_related').modal('show');
				$.each(data,function(a,b){
					$("#actual_tesis input[name='id_plan_tesis_form']").attr('value',b.id_plan_tesis);
					$("#actual_tesis input[name='id_alumno_form']").attr('value',b.id_alumno);
					$("#actual_tesis input[name='id_docente_form']").attr('value',b.id_docente);
					$('#actual_tesis #input01').attr('value',b.titulo);
					$('#actual_tesis #input02').attr('value',b.tesista);
					$('#actual_tesis #input03').attr('value',b.asesor);
					$("#actual_tesis textarea[name='introduccion']").attr('value',b.introduccion);
					$("#actual_tesis textarea[name='objetivo']").attr('value',b.objetivo);
					$("#actual_tesis textarea[name='resumen']").attr('value',b.resumen);
					$("#actual_tesis textarea[name='conclusion']").attr('value',b.conclusion);
				});
			},
			error: function(data){
			}
		});
	});
	function aprobacion_constancia(aprobacion)
	{
		var id_plan_tesis=$("#actual_tesis input[name='id_plan_tesis_form']").attr('value');
		$.ajax({
			url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/aprobacion_constancia',
			type:'post',
			data:'id_plan_tesis='+id_plan_tesis+'&aprobacion='+aprobacion,
			success:function(data){
				$('#consult_related').modal('hide');
				$.ajax({
					url:base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/listar_solicitud',
					beforeSend:function()
						{	$('#module_content').html('<div class="loading"><img src="'+base_url+'resource/img/utilities/gif/loading.gif"/></div>');
						},
					success:function(data)
						{	$('#module_content').html(data);
						}
				});
			}
		});
	}
	function reporte_negatividad()
	{	var id_plan_tesis=$("#actual_tesis input[name='id_plan_tesis_form']").attr('value');
		window.open(base_url+'oficina_biblioteca_central/ccoficina_biblioteca_central/reporte_negatividad/'+id_plan_tesis,'',"width=900,height=500,s crollbars=NO","_blank");
			
	}
});

function active_consult(active,desactive)
{	$(active).addClass('active_consult');
	$(desactive).removeClass('active_consult');
}
