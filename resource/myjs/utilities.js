$(document).ready(function(){
	//var a=$('#consult_related table tbody').width()
	
	$('#search_asesor').click(function(){
		active_consult('.consult_asesor', '.consult_student');
	});
    
    $("input01").keyup(function () {
    	var valor = $(this).val();
    	var rex = /^[a-z]$/;
    	if (rex.test(valor)) {
    		$('input01').addClass('invalid');
    	};
    }).keyup();
    
            
});
