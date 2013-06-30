$(document).ready(function(){
	$('#actual_tesis #search_student').click(function(){
		active_consult('.consult_student', '.consult_asesor');
	});
	$('#actual_tesis #search_asesor').click(function(){
		active_consult('.consult_asesor', '.consult_student');
	});
	$('#consult_related .close').click(function(){
		$('.consult_student').removeClass('active_consult');
		$('.consult_asesor').removeClass('active_consult');
	});
});

function active_consult(active,desactive)
{	$(active).addClass('active_consult');
	$(desactive).removeClass('active_consult');
}