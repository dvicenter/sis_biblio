$(document).ready(function(){
	//var a=$('#consult_related table tbody').width()
	$('#module_constancia').click(function(){
		alert('da');console.info('j');
		active_consult('.consult_student', '.consult_asesor');
	});
	$('#search_asesor').click(function(){
		active_consult('.consult_asesor', '.consult_student');
	});
	function active_consult(active,desactive)
	{	$(active).addClass('active_consult');
		$(desactive).removeClass('active_consult');
	}
	 
});
