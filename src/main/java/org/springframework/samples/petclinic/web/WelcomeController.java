package org.springframework.samples.petclinic.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.samples.petclinic.model.Person;
import org.springframework.samples.petclinic.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class WelcomeController {
	
	
	  @GetMapping({"/","/welcome"})
	  public String welcome(Map<String, Object> model) {	    
		  
		  List<Person> personas = new ArrayList<Person>();
		  
		  Person gonzalo = new Person();
		  gonzalo.setFirstName("Gonzalo");
		  gonzalo.setLastName("Rodriguez Terron");
		  
		  Person rodrigo = new Person();
		  rodrigo.setFirstName("Rodrigo");
		  rodrigo.setLastName("Sanchez Gonzalez");
		  
		  Person francisco = new Person();
		  francisco.setFirstName("Francisco Jose");
		  francisco.setLastName("Brenes Lozano");
		  
		  Person ismael = new Person();
		  ismael.setFirstName("Ismael");
		  ismael.setLastName("Luna Atienza");
		  
		  Person roberto = new Person();
		  roberto.setFirstName("Roberto");
		  roberto.setLastName("Paz Ribera");
		  
		  Person dani = new Person();
		  dani.setFirstName("Daniel");
		  dani.setLastName("Rico Ostos");
		  
		  model.put("persons", personas);
		  model.put("title", "Pizzeria");
		  model.put("group", "G3-07");
		  

	    return "welcome";
	  }
}
