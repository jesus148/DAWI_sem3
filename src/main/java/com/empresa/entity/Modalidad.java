package com.empresa.entity;



import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.Entity;



@Getter
@Setter
@Entity
@Table(name = "modalidad")
public class Modalidad {
	
	//recordar los atributos deben ser iguales
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idModalidad;
	private String nombre;
	private int numHombres;
	private int numMujeres;
	private int edadMaxima;
	private int edadMinima;
	private String sede;
	
	
	//join column : especifica la columna
	//@ManyToOne : indicar la relacion
	
	@ManyToOne
	@JoinColumn(name = "idDeporte")
	private Deporte deporte;
	
	

}
