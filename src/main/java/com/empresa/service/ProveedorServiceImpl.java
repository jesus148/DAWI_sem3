package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Proveedor;

import com.empresa.repository.ProveedorRepository;


@Service
public class ProveedorServiceImpl implements ProveedorService {

	
	
	 //CONEXION AL REPOSITORIO

	@Autowired
	private ProveedorRepository repository;
	
	
	
	
	
	//METODOS DE LA INTERFACE
	
	
	
	
	//metodo para insertar y del repo elige el metodo
	@Override
	public Proveedor insertaProveedor(Proveedor obj) {
		return repository.save(obj);
		
	}





	
	//metodo para buscar y no repetir proveedor
	@Override
	public List<Proveedor> buscarPorNombre(String nombre) {
		
		
		return repository.findByNombreIgnoreCase(nombre);
	}



	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
