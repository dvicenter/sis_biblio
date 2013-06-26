;(function( $ ) {

	$.fn.validCampo = function(regex,form,mensaje) {
		var id = '#'+$(this).attr('id');
		var envio = true;
		if($(id).focus()){

	   //  	$(id).keyup(function () {
		  //   	var _this = $(this);
		  //   	var valor = $(this).val();
		  //   	var rex = regex;
		  //   	if (!rex.test(valor))
		  //   	{
		  //   		_this.css({
		  //   			'color':'#b94a48',
		  //   			'border-color':'#e9322d',
		  //   			'box-shadow':'0px 0px 6px #f8b9b7'
		  //   		});

		    		

				// _this.attr('data-content',mensaje);
			 //    _this.popover('show');

			 //    	envio = false;

		  //   	}
		  //   	else
		  //   	{
		  //   		_this.css({
		  //   			'color':'black',
		  //   			'border-color': 'rgba(82, 168, 236, 0.8)',
				// 		'outline': '0',
				// 		'outline': 'thin dotted \9',
				// 		  /* IE6-9 */
				// 		'box-shadow': 'inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6)'
		  //   		});

			 //    	_this.popover('hide');

			 //    	envio = true;
		  //   	}
	   //  	}).keyup();
		};

		$(form).submit(function(){
			var _this = $(this);
		    	var valor = $(this).val();
		    	var rex = regex;
		    	if (!rex.test(valor))
		    	{
		    		_this.css({
		    			'color':'#b94a48',
		    			'border-color':'#e9322d',
		    			'box-shadow':'0px 0px 6px #f8b9b7'
		    		});

		    		

				_this.attr('data-content',mensaje);
			    _this.popover('show');

			    	envio = false;

		    	}
		    	else
		    	{
		    		_this.css({
		    			'color':'black',
		    			'border-color': 'rgba(82, 168, 236, 0.8)',
						'outline': '0',
						'outline': 'thin dotted \9',
						  /* IE6-9 */
						'box-shadow': 'inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6)'
		    		});

			    	_this.popover('hide');

			    	envio = true;
		    	}
		});

	};
})( jQuery );