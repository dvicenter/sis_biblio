var row_componente_total;
var componentes_accion=[];
$(document).ready(function(){
	if($('#mod_role_component_action').is(':visible')){
		$("#mod_role_component_action #input_acc_asig").focus();
        $('#mod_role_component_action input[name="check_accion"]').attr('disabled',true);
        $('#mod_role_component_action input[name="check_accion_detail"]').attr('disabled',true);
		buscar_componente_accion();
		evento_btn_asignacion(true,true,true,true,'no-drop');
		
		$('#mod_role_component_action .cancel').click(function(){
			evento_btn_asignacion(true,true,true,true,'no-drop');
			$("#mod_role_component_action #input_acc_asig").attr('disabled',false);
			$("#mod_role_component_action form")[0].reset();
			$("#mod_role_component_action #input_acc_asig").focus();
			 var trs=$("#mod_role_component_action .acciones_de_componente tr").length;
	            if(trs>0)
	            {	$("#mod_role_component_action .acciones_de_componente tr").remove();
	            }
	        $('#mod_role_component_action input[name="check_componente_accion"]').attr('disabled',true);
	        $('#mod_role_component_action input[name="check_accion"]').attr('disabled',true);
	        $('#mod_role_component_action input[name="check_accion_detail"]').attr('disabled',true);
	        $('#mod_role_component_action input[name="check_componente_accion"]').attr('checked',false);
	        $('#mod_role_component_action input[name="check_accion"]').attr('checked',false);
	        $('#mod_role_component_action input[name="check_accion_detail"]').attr('checked',false);
		});
		
		$('#mod_role_component_action .save').click(function(){
			var row_componente_actual=$('#mod_role_component_action table tbody.acciones_de_componente tr').length;
			var id_componente=$("#mod_role_component_action [name='id_componente']").attr('value');
			var ids=[];
			var total_row=row_componente_total;
			total_row++;
			while(total_row<=row_componente_actual)
			{	var id=$("#mod_role_component_action table tbody.acciones_de_componente tr:nth-child("+total_row+") td:eq(0) [name='check_componente_accion_detail']").attr('value');
				ids.push(id);
				total_row++;
			}
			console.info(ids);
			$.ajax({
				url:base_url+'manager/ccaccion/insert_new_componente_accion',
				data:'ids='+ids+'&id_componente='+id_componente,
				type:'post',
				dataType:'json',
				success:function(data){
					$.each(data,function(a,b){
						total_row--;
						$("#mod_role_component_action tbody.acciones_de_componente tr:nth-child("+total_row+") [name='check_componente_accion_detail']").attr('value',b.id_componente_accion);
					});
					row_componente_total=$('#mod_role_component_action table tbody.acciones_de_componente tr').length;
					acciones_asignado_componente();
					$('#mod_role_component_action .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>Accion(es) asignado con &eacute;xito</strong></div>");
					evento_btn_asignacion(true, true, true, false, 'no-drop');
			        /*$('#mod_role_component_action input[name="check_componente_accion"]').attr('disabled',true);
			        $('#mod_role_component_action input[name="check_accion"]').attr('disabled',true);
			        $('#mod_role_component_action input[name="check_accion_detail"]').attr('disabled',true);*/
			        $('#mod_role_component_action input[name="check_componente_accion"]').attr('checked',false);
			        $('#mod_role_component_action input[name="check_accion_detail"]').attr('checked',false);
			        $('#mod_role_component_action input[name="check_rol_detail"]').attr('checked',false);
				},
				error:function(data){
					$('#mod_role_component_action .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Oh no!</strong> se pudo guardar</div>");
				}
			});
		});
	}
	$.ajax({
		url:base_url+'manager/ccaccion/accion',
		success:function(data){
			$('#mod_role_component_action table tbody.accion').html(data);
			$('#mod_role_component_action input[name="check_accion_detail"]').attr('disabled',true);
			var field;
			field=$("[name='check_accion_detail']");
	    	var checkflag = "false";
			$('#mod_role_component_action input[name="check_accion"]').click(function(){
				if($(this).is(":checked"))
				    {	evento_btn_asignacion(false, true, true, false, '');
						for (i = 0; i < field.length; i++) {
							var sele=$("#mod_role_component_action tbody.accion tr:eq("+i+") [name='check_accion_detail']").attr('disabled');
							if(sele!='disabled'){
								field[i].checked = true;
							}
			        	  }
			        	  checkflag = "true";
	        		   }
			        else{	evento_btn_asignacion(true, true, true, false, '');
			        	for (i = 0; i < field.length; i++) {
		        		  field[i].checked = false; }
		        		  checkflag = "false";
			        	}
			    });
			$('#mod_role_component_action tbody.accion input[name="check_accion_detail"]').click(function(){
				evento_btn_asignacion(false, true, true, false, '');
				var tr=$('#mod_role_component_action table tbody.accion tr');
				$.each(tr,function(index,value){
					if($('#mod_role_component_action table tbody.accion tr input[name="check_accion_detail"]').is(':checked')==false){
						evento_btn_asignacion(true, true, true, false, '');
						$('#mod_role_component_action input[name="check_accion"]').attr('checked',false);
					}
		        });
			});
		}
	});
	$('#mod_role_component_action form').submit(function(evento){
		var componente=$('#input_acc_asig').val();
		evento.preventDefault();
		if(validar_componente_existente(componente)){
		$('#mod_role_component_action .response').html('');
		$('#mod_role_component_action input[name="check_componente_accion"]').attr('disabled',false);
		$("#mod_role_component_action #input_acc_asig").attr('disabled',true);
        $('#mod_role_component_action input[name="check_accion"]').attr('disabled',false);
        $('#mod_role_component_action input[name="check_accion_detail"]').attr('disabled',false);
		evento_btn_asignacion(true, true, true, false,'');
		
		var id_componente;
	$.each(componentes_accion,function(a,b){ 
		if (componente==b[1]){
			id_componente =b[0];
			$("#mod_role_component_action [name='id_componente']").attr('value',id_componente);
		}
		});
	$.ajax({
		url:base_url+'manager/ccaccion/buscar_acciones_componentes',
		data:'id_componente='+id_componente,
		type:'post', 
		success: function(data){
			$('#mod_role_component_action .acciones_de_componente').html(data);
			row_componente_total=$('#mod_role_component_action table tbody.acciones_de_componente tr').length;
			var field;
			field=$("[name='check_componente_accion_detail']");
			var checkflag = "false";
			acciones_asignado_componente();
			$('#mod_role_component_action input[name="check_componente_accion"]').click(function(){
				if($(this).is(":checked"))
					{	evento_btn_asignacion(true, false, true, false, '');	
						for (i = 0; i < field.length; i++) {
								field[i].checked = true;
							}
						checkflag = "true";
			        }
					else{evento_btn_asignacion(true, true, true, false, '');
						$('#mod_role_component_action .delete').attr('disabled',true).css('cursor','no-drop');
						for (i = 0; i < field.length; i++) {
				        	field[i].checked = false; 
				        }
					checkflag = "false";
					}
				});
			$('#mod_role_component_action tbody.acciones_de_componente input[name="check_componente_accion_detail"]').click(function(){
				evento_btn_asignacion(true, false, true, false, '');
				var tr=$('#mod_role_component_action table tbody.acciones_de_componente tr');
				$.each(tr,function(index,value){
					if($('#mod_role_component_action table tbody.acciones_de_componente tr input[name="check_componente_accion_detail"]').is(':checked')==false){
						evento_btn_asignacion(true, true, true, false, '');
						$('#mod_role_component_action input[name="check_componente_accion"]').attr('checked',false);
					}
		        });
			});
		}
	});}
		else{
			$('#mod_role_component_action .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Componente incorrecto</strong></div>");
		}
	});
	$('#mod_role_component_action .left').click(function(){
		evento_btn_asignacion(true, true, false, false, '');
		var ids = $('#mod_role_component_action input:[name="check_accion_detail"]:checked');
		var tr=$('#mod_role_component_action table tbody.accion tr');
		row_rol_total=$('#mod_role_component_action table tbody.acciones_de_componente tr').length;
		$.each(tr,function(index,value){
			if($('#mod_role_component_action table tbody.accion tr:eq('+index+') input[name="check_accion_detail"]').is(':checked')==true)
			{	var id=$('#mod_role_component_action table tbody.accion tr:eq('+index+') input[name="check_accion_detail"]').val();
				var componente=$('#mod_role_component_action table tbody.accion tr:eq('+index+') td:eq(1)').html();
				var tds = '<tr>';							
				tds += "<td class='check_table'><input type='checkbox' name='check_componente_accion_detail' value="+id+">"+'</td>';
				tds += "<td>"+componente+"</td>";
				tds += "<td style='display:none;'>"+id+"</td>";
				tds += '</tr>';
				$("#mod_role_component_action table tbody.acciones_de_componente").append(tds).click(function(){
					evento_btn_asignacion(true, false, true, false, '');
				});
			}
        });
	});
	$('#mod_role_component_action .delete').click(function(){
		var msg = confirm("Desea eliminar el accion asignado anteriormente?");
		if(msg){
			$('.delete').attr('disabled',true).css('cursor','no-drop');
			var ides='';
			var conjuntoides='';
			var ids = $('#mod_role_component_action input:[name="check_componente_accion_detail"]:checked');
			$.each(ids,function(index, value){
				  ides=ids[index].value;
				  conjuntoides=ides +','+conjuntoides;
				});
			conjuntoides+=0;
			$.ajax({
				type:'POST',
				url:base_url+'manager/ccaccion/eliminar_componente_accion',
				data :"ids="+conjuntoides,
				success: function(response)
					{	$.each(ids,function(index, value){
							 ides=ids[index].value;
							$(ids).parent().parent().fadeOut('fast',function(){
								$(this).remove();
								$('#mod_role_component_action input[name="check_accion_detail"]').attr('disabled',false);
								acciones_asignado_componente();
							});
						});
					
					evento_btn_asignacion(true, true, true, false, '');
					row_rol_total=$('#mod_role_component_action table tbody.acciones_de_componente tr').length;
					row_rol_total--;
					$('#mod_role_component_action .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>Componente eliminado con &eacute;xito</strong></div>");
				    }
				});	
		}
	});
	function buscar_componente_accion()
	{	$.ajax({
			url:base_url+'manager/ccaccion/buscar_componente_accion',
			type:"POST",
			dataType:"json",
			success:function(data){
				var componente_accion=[];
				$.each(data,function(a,b){
				componente_accion.push(b.componente);
				componentes_accion.push([b.id_componente,b.componente]);
				});
				$('#input_acc_asig').typeahead().data('typeahead').source = componente_accion;
			}
		});
	}
	function acciones_asignado_componente()
	{
		var tr_accion_componete=$('#mod_role_component_action table tbody.acciones_de_componente tr');
		var tr_componentes=$('#mod_role_component_action table tbody.accion tr');
		var ids_acciones_asignados;
		var ids_acciones=[];
		$.each(tr_accion_componete,function(a,b){
			ids_acciones_asignados=$('#mod_role_component_action table tbody.acciones_de_componente tr:eq('+a+') td:eq(2)').html();
			$.each(tr_componentes,function(c,d){
				ids_acciones=$('#mod_role_component_action table tbody.accion tr:eq('+c+') [name="check_accion_detail"]').attr('value');
				if(ids_acciones==ids_acciones_asignados){
					$('#mod_role_component_action table tbody.accion tr:eq('+c+') [name="check_accion_detail"]').attr('disabled',true);
				}
			});
		});
		
	}
});
function evento_btn_asignacion(izquierda,eliminar,guardar,cancelar,css)
{
	if(izquierda==true){$('.left').attr('disabled',izquierda).css('cursor','no-drop');}else{$('.left').attr('disabled',izquierda).css('cursor','');}
	if(eliminar==true){$('.delete').attr('disabled',eliminar).css('cursor','no-drop');}else{$('.delete').attr('disabled',eliminar).css('cursor','');}
	if(guardar==true){$('.save').attr('disabled',guardar).css('cursor','no-drop');}else{$('.save').attr('disabled',guardar).css('cursor','');}
	$('.cancel').attr('disabled',cancelar).css('cursor',css);
}
function validar_componente_existente(componente)
{	var resultado=false;
	$.each(componentes_accion,function(a,b){
		
		if(b[1]==componente)
		{	resultado=true;
		}
	});
	return resultado;
}