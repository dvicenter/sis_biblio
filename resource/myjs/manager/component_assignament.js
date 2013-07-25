var row_component_total;
var roles_componente=[];
$(document).ready(function(){
	if($('#mod_role_assignment_component').is(':visible')){
		$("#mod_role_assignment_component #input_comp_asig").focus();
        $('#mod_role_assignment_component input[name="check_comp"]').attr('disabled',true);
        $('#mod_role_assignment_component input[name="check_comp_detail"]').attr('disabled',true);
		buscar_rol_componente();
		evento_btn_asignacion(true,true,true,true,'no-drop');
		
		$('#mod_role_assignment_component .cancel').click(function(){
			evento_btn_asignacion(true,true,true,true,'no-drop');
			$("#mod_role_assignment_component #input_comp_asig").attr('disabled',false);
			$("#mod_role_assignment_component form")[0].reset();
			$("#mod_role_assignment_component #input_comp_asig").focus();
			 var trs=$("#mod_role_assignment_component .componente_de_rol tr").length;
	            if(trs>0)
	            {	$("#mod_role_assignment_component .componente_de_rol tr").remove();
	            }
	        $('#mod_role_assignment_component input[name="check_comp_rol"]').attr('disabled',true);
	        $('#mod_role_assignment_component input[name="check_comp"]').attr('disabled',true);
	        $('#mod_role_assignment_component input[name="check_comp_detail"]').attr('disabled',true);
	        $('#mod_role_assignment_component input[name="check_comp_rol"]').attr('checked',false);
	        $('#mod_role_assignment_component input[name="check_comp"]').attr('checked',false);
	        $('#mod_role_assignment_component input[name="check_comp_detail"]').attr('checked',false);
		});
		
		$('#mod_role_assignment_component .save').click(function(){
			var row_comp_actual=$('#mod_role_assignment_component table tbody.componente_de_rol tr').length;
			var id_componente=$("#mod_role_assignment_component [name='id_comp']").attr('value');
			var ids=[];
			var total_row=row_component_total;
			total_row++;
			while(total_row<=row_comp_actual)
			{	var id=$("#mod_role_assignment_component table tbody.componente_de_rol tr:nth-child("+total_row+") td:eq(0) [name='ckeck_rol_comp_detail']").attr('value');
				ids.push(id);
				total_row++;
			}
			console.info(ids);
			$.ajax({
				url:base_url+'manager/cccomponente/insert_new_rol_componente_accion',
				data:'ids='+ids+'&id_componente='+id_componente,
				type:'post',
				dataType:'json',
				success:function(data){
					$.each(data,function(a,b){
						total_row--;
						$("#mod_role_assignment_component tbody.componente_de_rol tr:nth-child("+total_row+") [name='ckeck_rol_comp_detail']").attr('value',b.id_rol_componente_accion);
					});
					row_component_total=$('#mod_role_assignment_component table tbody.componente_de_rol tr').length;
					componentes_asignado_rol();
					$('#mod_role_assignment_component .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>Componente(s) asignado con &eacute;xito</strong></div>");
					close_msg('#mod_role_assignment_component .response');
					evento_btn_asignacion(true, true, true, false, 'no-drop');
			        /*$('#mod_role_assignment_component input[name="check_comp_rol"]').attr('disabled',true);
			        $('#mod_role_assignment_component input[name="check_comp"]').attr('disabled',true);
			        $('#mod_role_assignment_component input[name="check_comp_detail"]').attr('disabled',true);*/
			        $('#mod_role_assignment_component input[name="check_comp_rol"]').attr('checked',false);
			        $('#mod_role_assignment_component input[name="check_comp"]').attr('checked',false);
			        $('#mod_role_assignment_component input[name="check_comp_detail"]').attr('checked',false);
				},
				error:function(data){
					$('#mod_role_assignment_component .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Oh no!</strong> se pudo guardar</div>");
					close_msg('#mod_role_assignment_component .response');
				}
			});
		});
	}
	
	$.ajax({
		url:base_url+'manager/cccomponente/componente',
		success:function(data){
			$('#mod_role_assignment_component table tbody.componente').html(data);
			$('#mod_role_assignment_component input[name="check_comp_detail"]').attr('disabled',true);
			var field;
			field=$("[name='check_comp_detail']");
	    	var checkflag = "false";
			$('#mod_role_assignment_component input[name="check_comp"]').click(function(){
				if($(this).is(":checked"))
				    {	evento_btn_asignacion(false, true, true, false, '');
						for (i = 0; i < field.length; i++) {
							var sele=$("#mod_role_assignment_component tbody.componente tr:eq("+i+") [name='check_comp_detail']").attr('disabled');
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
			$('#mod_role_assignment_component tbody.componente input[name="check_comp_detail"]').click(function(){
				evento_btn_asignacion(false, true, true, false, '');
				var tr=$('#mod_role_assignment_component table tbody.componente tr');
				$.each(tr,function(index,value){
					if($('#mod_role_assignment_component table tbody.componente tr input[name="check_comp_detail"]').is(':checked')==false){
						evento_btn_asignacion(true, true, true, false, '');
						$('#mod_role_assignment_component input[name="check_comp"]').attr('checked',false);
					}
		        });
			});
		}
	});
	$('#mod_role_assignment_component .delete').click(function(){
		var msg = confirm("Desea eliminar el rol asignado anteriormente?");
		if(msg){
			$('.delete').attr('disabled',true).css('cursor','no-drop');
			var ides='';
			var conjuntoides='';
			var ids = $('#mod_role_assignment_component input:[name="ckeck_rol_comp_detail"]:checked');
			$.each(ids,function(index, value){
				  ides=ids[index].value;
				  conjuntoides=ides +','+conjuntoides;
				});
			conjuntoides+=0;
			$.ajax({
				type:'POST',
				url:base_url+'manager/cccomponente/eliminar_rol_componente_accion',
				data :"ids="+conjuntoides,
				success: function(response)
					{	$.each(ids,function(index, value){
							 ides=ids[index].value;
							$(ids).parent().parent().fadeOut('fast',function(){
								$(this).remove();
								$('#mod_role_assignment_component input[name="check_comp_detail"]').attr('disabled',false);
								componentes_asignado_rol();
							});
						});
					
					evento_btn_asignacion(true, true, true, false, '');
					row_component_total=$('#mod_role_assignment_component table tbody.componente_de_rol tr').length;
					row_component_total--;
					$('#mod_role_assignment_component .response').html("<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a><strong>Componente eliminado con &eacute;xito</strong></div>");
					close_msg('#mod_role_assignment_component .response');
				    }
				});	
		}
	});
	$('#mod_role_assignment_component .left').click(function(){
		evento_btn_asignacion(true, true, false, false, '');
		var ids = $('#mod_role_assignment_component input:[name="check_comp_detail"]:checked');
		var tr=$('#mod_role_assignment_component table tbody.componente tr');
		row_component_total=$('#mod_role_assignment_component table tbody.componente_de_rol tr').length;
		$.each(tr,function(index,value){
			if($('#mod_role_assignment_component table tbody.componente tr:eq('+index+') input[name="check_comp_detail"]').is(':checked')==true)
			{	var id=$('#mod_role_assignment_component table tbody.componente tr:eq('+index+') input[name="check_comp_detail"]').val();
				var componente=$('#mod_role_assignment_component table tbody.componente tr:eq('+index+') td:eq(1)').html();
				var accion=$('#mod_role_assignment_component table tbody.componente tr:eq('+index+') td:eq(2)').html();
				var tds = '<tr>';							
				tds += "<td class='check_table'><input type='checkbox' name='ckeck_rol_comp_detail' value="+id+">"+'</td>';
				tds += "<td>"+componente+"</td>";
				tds += "<td>"+accion+"</td>";
				tds += "<td style='display:none;'>"+id+"</td>";
				tds += '</tr>';
				$("#mod_role_assignment_component table tbody.componente_de_rol").append(tds).click(function(){
					evento_btn_asignacion(true, false, true, false, '');
				});
			}
        });
	});
	function buscar_rol_componente()
	{	$.ajax({
			url:base_url+'manager/cccomponente/buscar_rol_componente',
			type:"POST",
			dataType:"json",
			success:function(data){
				var rol_componente=[];
				$.each(data,function(a,b){
				rol_componente.push(b.rol);
				roles_componente.push([b.id_rol,b.rol]);
				});
				$('#input_comp_asig').typeahead().data('typeahead').source = rol_componente;
				
				$('#mod_role_assignment_component form').submit(function(evento){
					var rol=$('#input_comp_asig').val();
					evento.preventDefault();
					if(validar_rol_existente(rol)){
					$('#mod_role_assignment_component .response').html('');
					$('#mod_role_assignment_component input[name="check_comp_rol"]').attr('disabled',false);
					$("#mod_role_assignment_component #input_comp_asig").attr('disabled',true);
			        $('#mod_role_assignment_component input[name="check_comp"]').attr('disabled',false);
			        $('#mod_role_assignment_component input[name="check_comp_detail"]').attr('disabled',false);
					evento_btn_asignacion(true, true, true, false,'');
					
					var id_rol;
				$.each(roles_componente,function(a,b){ 
					if (rol==b[1]){
						id_rol =b[0];
						$("#mod_role_assignment_component [name='id_comp']").attr('value',id_rol);
					}
					});
				$.ajax({
					url:base_url+'manager/cccomponente/buscar_rol_componente_accion',
					data:'id_rol='+id_rol,
					type:'post', 
					success: function(data){
						$('#mod_role_assignment_component .componente_de_rol').html(data);
						row_component_total=$('#mod_role_assignment_component table tbody.componente_de_rol tr').length;
						var field;
						field=$("[name='ckeck_rol_comp_detail']");
						var checkflag = "false";
						componentes_asignado_rol();
						$('#mod_role_assignment_component input[name="check_comp_rol"]').click(function(){
							if($(this).is(":checked"))
								{	evento_btn_asignacion(true, false, true, false, '');	
									for (i = 0; i < field.length; i++) {
											field[i].checked = true;
										}
									checkflag = "true";
						        }
								else{evento_btn_asignacion(true, true, true, false, '');
									$('#mod_role_assignment_component .delete').attr('disabled',true).css('cursor','no-drop');
									for (i = 0; i < field.length; i++) {
							        	field[i].checked = false; 
							        }
								checkflag = "false";
								}
							});
						$('#mod_role_assignment_component tbody.componente_de_rol input[name="ckeck_rol_comp_detail"]').click(function(){
							evento_btn_asignacion(true, false, true, false, '');
							var tr=$('#mod_role_assignment_component table tbody.componente_de_rol tr');
							$.each(tr,function(index,value){
								if($('#mod_role_assignment_component table tbody.componente_de_rol tr input[name="ckeck_rol_comp_detail"]').is(':checked')==false){
									evento_btn_asignacion(true, true, true, false, '');
									$('#mod_role_assignment_component input[name="check_comp_rol"]').attr('checked',false);
								}
					        });
						});
					}
				});}
					else{
						$('#mod_role_assignment_component .response').html("<div class='alert alert-error'><a class='close' data-dismiss='alert'>x</a><strong>Rol incorrecto</strong></div>");
						close_msg('#mod_role_assignment_component .response');
					}
				});
			
			}
		});
	}
	function componentes_asignado_rol()
	{
		var tr_componente_asigando=$('#mod_role_assignment_component table tbody.componente_de_rol tr');
		var tr_componentes=$('#mod_role_assignment_component table tbody.componente tr');
		var ids_componente_asignados;
		var ids_componentes=[];
		$.each(tr_componente_asigando,function(a,b){
			ids_componente_asignados=$('#mod_role_assignment_component table tbody.componente_de_rol tr:eq('+a+') td:eq(3)').html();
			
			$.each(tr_componentes,function(c,d){
				ids_componentes=$('#mod_role_assignment_component table tbody.componente tr:eq('+c+') [name="check_comp_detail"]').attr('value');
				if(ids_componentes==ids_componente_asignados){
					$('#mod_role_assignment_component table tbody.componente tr:eq('+c+') [name="check_comp_detail"]').attr('disabled',true);
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
	function validar_rol_existente(rol)
	{	var resultado=false;
		$.each(roles_componente,function(a,b){
			if(b[1]==rol)
			{	resultado=true;
			}
		});
		return resultado;
	}
	function close_msg(id)
	{	$(id).delay(1000).fadeOut();
	}
