package com.empresa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.util.CollectionUtils;


import com.empresa.entity.Proveedor;
import com.empresa.entity.Tipo;

import com.empresa.service.ProveedorService;
import com.empresa.service.TipoService;

@Controller
public class RegistraProveedorController {
	
	
	
	
	
	//para el combo
	@Autowired
	private TipoService tipoService;
	
	
	
	//para registrar
	@Autowired
	private ProveedorService proveedorService;
	
	
	
	
	
	
	//muestra el jsp regsitra proveedor
	@GetMapping(value = "/verRegistraProveedor" )
	public String verAlumno() {
		return "registraProveedor";
		}
	
	
	
	
	//carga el combo ejecuta el metodo y retorna la lista
	
	@GetMapping(value = "/listaTipo")
	@ResponseBody
	public List<Tipo> cargaDeporte() {
		return tipoService.listaTipo();
	}
	
	
	
	

	//PARA REGISTRAR
	@PostMapping("/registraProveedor")
	@ResponseBody
	public Map<?, ?> registra(Proveedor obj) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		//le agregamos la fecha al dato obtenido desde el jsp
		obj.setFechaRegistro(new Date());
		
		Proveedor objSalida = proveedorService.insertaProveedor(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		} else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	
	
	

	
	//PARA BUSCAR Y VERIFICAR QUE NO SE REPITAN LOS NOMBRE DE PROVEEDORES 
	@GetMapping("/buscaPorProveedor")
	@ResponseBody
	public String validaNombre(String nombre) {
		//pregunta si lo encuentra
		List<Proveedor> lstModalidad = proveedorService.buscarPorNombre(nombre);
		
		//si esta vacio y no lo encuentra ese nombre then sale true ,esta listo pa registrar
		if (CollectionUtils.isEmpty(lstModalidad)) {
			return "{\"valid\" : true }";  //retorna true listo para registrar
		} else {
			return "{\"valid\" : false }"; //retorna false ya se encuentra
		}
	}
	
	
	
	


	
	
	
	

	
	
	
	

}
