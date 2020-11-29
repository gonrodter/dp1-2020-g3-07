package org.springframework.samples.petclinic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
@Entity
@Table(name = "dependientes")
public class Dependiente extends Empleados{

	@Column(name = "usuario")
    @NotEmpty
	String usuario;
	
	@Column(name = "contrasena")
    @NotEmpty
	String contrasena;
	
}
