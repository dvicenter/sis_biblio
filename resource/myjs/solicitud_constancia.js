$(document).ready(function(){
	$('#actual_tesis #search_student').click(function(){
		active_consult('.consult_student', '.consult_asesor');
		var id_plan_tesis=$("#actual_tesis input[name='id_plan_tesis_form']").attr('value');
		var id_alumno=$("#actual_tesis input[name='id_alumno_form']").attr('value');
		$.ajax({
			url:'/sis_biblio/oficina_biblioteca_central/ccoficina_biblioteca_central/informe_practica',
			data:'id_plan_tesis='+id_plan_tesis+'id_alumno='+id_alumno,
			success:function(){
				
			}
		});
	});
	$('#actual_tesis #search_asesor').click(function(){
		active_consult('.consult_asesor', '.consult_student');
	});
	$('#consult_related .close').click(function(){
		$('.consult_student').removeClass('active_consult');
		$('.consult_asesor').removeClass('active_consult');
	});
	$('#module_constancia #solicitud_constancia .comparation').click(function(){
		var pos_=$('#module_constancia #solicitud_constancia td .comparation').index(this);
		var pos=pos_+1;
		var id_plan_tesis=$('#module_constancia #solicitud_constancia tbody tr:nth-child('+pos+') td:nth-child(2)').html();
		$.ajax({
			url:'/sis_biblio/oficina_biblioteca_central/ccoficina_biblioteca_central/buscar_plan_tesis',
			data:'id_plan_tesis='+id_plan_tesis,
			dataType:'json',
			success:function(data){
				$('#consult_related').modal('show');
				$.each(data,function(a,b){
					$("#actual_tesis input[name='id_plan_tesis_form']").attr('value',b.id_plan_tesis);
					$("#actual_tesis input[name='id_alumno_form']").attr('value',b.id_alumno);
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
});

function active_consult(active,desactive)
{	$(active).addClass('active_consult');
	$(desactive).removeClass('active_consult');
}