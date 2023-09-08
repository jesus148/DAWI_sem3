package com.empresa.service;

import com.empresa.entity.Modalidad;
import com.empresa.repository.ModalidadRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ModalidadServiceImpl implements ModalidadService{

	
	
	
	
	@Autowired
	private ModalidadRepository repository;
	
	
	
	@Override
	public Modalidad insertaModalidad(Modalidad obj) {
		
	
		return repository.save(obj);
	}



	@Override
	public List<Modalidad> buscarPorNombre(String nombre) {
	
		return repository.findByNombreIgnoreCase(nombre);
		
	}

	
	
	
	
	
}
