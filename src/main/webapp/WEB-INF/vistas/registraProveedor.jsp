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
			
			
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_fechaRegistro">Fecha de registro</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="date" id="id_fechaRegistro" name="fechaRegistro" placeholder="Ingrese la fecha" maxlength="100">
		 		</div>
			</div>
		
		
		    <div class="form-group col-md-3">
					<label class="control-label" for="id_tipo">Tipo</label>
					<select id="id_tipo" name="tipo.idTipo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>		
			    </div>
		      </div>
		      
		
		
		
		
		      
		      		<div class="row" style="margin-top: 0%">
		      		
		      		
		      			<div class="row" style="margin-top: 0%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_pais">pais</label>
				</div>
				<div class="col-sm-4">
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
		$("#id_tipo").append("<option value="+item.idTipo +">"+ item.descripcion +"</option>");
	});
});






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


function limpiarFormulario(){
	$('#id_nombre').val('');
	$('#id_dni').val('');
	$('#id_correo').val('');
	$('#id_fecha').val('');
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
                fechaRegistro:{
                    selector: "#id_fechaRegistro",
                    validators:{
                        notEmpty: {
                             message: 'la fecha es obligatoria'
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




