package com.empresa.service;


import java.util.List;


import com.empresa.entity.Proveedor;

public interface ProveedorService {

	
	
	
	
	//METODOS 

	
	//metodo para registrar 
	public abstract Proveedor insertaProveedor(Proveedor obj);
	

	//metodo para buscar el nombre si ya se encuentra
	public abstract List<Proveedor> buscarPorNombre(String nombre);
	
	
	
}
