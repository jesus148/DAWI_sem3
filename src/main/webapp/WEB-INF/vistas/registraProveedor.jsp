<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h3>Registra Proveedor</h3>


<!--    registra la tabla proveedor (agregando validacion al nombre , e insertando con la tabla foranea y agregando un nuevo campo ) -->

	<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
				</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_dni">DNI</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el dni" maxlength="8">
		 		</div>
			</div>
		</div>
		
		
		<div class="row" style="margin-top: 0%">
			

		
		
<!-- 		recordar que para los campos foraneos como los combos , primero ingresa a la clase guia q lo contiene luego al atributo
   tanto para registrar como , para llenar el combo -->
		    <div class="form-group col-sm-6">
		    <div class="col-sm-4">
					<label class="control-label" for="id_tipo">Tipo</label>
					</div>	
					 <div class="col-sm-8">
					<select id="id_tipo" name="tipo.idTipo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>	
						</div>	
			    </div>
		      </div>
		      
		
		
		
		
		      
		      		<div class="row" style="margin-top: 0%">
		      		
		      		
		      			
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_pais">pais</label>
				</div>
				<div class="col-sm-8">
				  <select name="pais" id="id_pais" class="form-control"  >
                    <option value=" ">Seleccione </option>
                    <option value="peru">peru</option>
                    <option value="alemania"> alemania</option>
                      <option value="inglaterra"> inglaterra</option>
                    <option value="francia"> francia</option>
                </select>
				</div>
			</div>
		
	
		
		
		      </div>
		      
		      
		      
		     
		     
		     
		     
		     
		     
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Crea Proveedor</button>
		</div>	
	</form>
</div>












<script type="text/javascript">




//eso se carga automaticamente al inciar el jsp o al entrar aqui 
$.getJSON("listaTipo", {}, function(data){
	$.each(data, function(index,item){
		$("#id_tipo").append("<option value="+ item.idTipo +">"+ item.descripcion +"</option>");
	});
});






//cuando das click en el boton
$("#id_registrar").click(function (){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
    //Pregunta si es valido el formulario(Si no tiene errores)
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraProveedor", 
            data: $('#id_form').serialize(),
            success: function(data){
            	//obtiene la data del controller de regreso
            	mostrarMensaje(data.MENSAJE);
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(data.MSG_ERROR);
            }
    	});
	}   
    	
	
});

//limpiar las cajas
function limpiarFormulario(){
	$('#id_nombre').val('');
	$('#id_dni').val('');
	$('#id_tipo').val('');
	$('#id_pais').val('');
}




$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	
        	//nombre: es el name del input = a la clase guia 
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                        //esto es el controller pa buscar el nombre
                        //delay:Retraso para mostrar y ocultar la información Si se proporciona un número, se aplica un retraso para ocultar ambos.
                        //Número de milisegundos que se deben esperar antes de mostrar un error en un campo de formulario.
                        //OJO : cuando escribas en el input escribe la palabra o el valor completo = ala bd ahi verifica si existe
                        remote :{
                    	    delay: 1000,
                    	 	url: 'buscaPorProveedor', //el url en controller debe ser =
                    	 	message: 'El proveedor ya existe ya existe'
                     	}
                    }
                },
                dni:{
                    selector: "#id_dni",
                    validators:{
                        notEmpty: {
                             message: 'El dni es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]{8}$/,
                            message: 'el dni es 8 dígitos'
                        }
                    }
                },
                  
             
               
                tipo: {
            		selector : '#id_tipo',
                    validators: {
                        notEmpty: {
                            message: 'La sede es un campo obligatorio'
                        },
                      
                    }
                },
                
            
                
                pais: {
            		selector : '#id_pais',
                    validators: {
                        notEmpty: {
                            message: 'el pais es obligatorio'
                        },
                      
                    }
                }
                
                
                
                
                
                
        }   
    });

    
});
</script>

</body>
</html>




