package com.empresa.entity;



import java.util.Date;

import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import jakarta.persistence.Entity;



@Getter
@Setter
@Entity
@Table(name = "proveedor")
public class Proveedor {
	
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idProveedor;
	private String nombre;
	private String dni;
	

	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date  fechaRegistro;

	
	
	//PARA EL COMBO 
	//join column : especifica la columna
	//@ManyToOne : indicar la relacion
	
	@ManyToOne
	@JoinColumn(name = "idTipo")
	private Tipo tipo;
	
	private String pais;
	
	

}
