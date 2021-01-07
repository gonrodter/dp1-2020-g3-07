package org.springframework.samples.petclinic.web;

import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Producto;
import org.springframework.samples.petclinic.service.ProductoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/carta")
public class CartaController {
	
	private static final String VIEWS_CARTA_CREATE_OR_UPDATE_FORM = "carta/createOrUpdateCartaForm";
	private final ProductoService productoService;
	
	@Autowired
	public CartaController(ProductoService productoService) {
		this.productoService = productoService;
	}
	
	@GetMapping()
	public String listadoCartas(ModelMap modelMap) {
		String vista = "carta/listadoCarta";
		Iterable<Producto> productos = productoService.findAll();
		modelMap.addAttribute("carta", productos);
		return vista;
	}
	
//	@GetMapping(value = "/new")
//	public String initCreationForm(Map<String, Object> model) {
//		Producto producto = new Producto();
//		model.put("productos", producto);
//		return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
//	}
//
//	@PostMapping(value = "/new")
//	public String processCreationForm(@Valid Producto producto, BindingResult result) {
//		if (result.hasErrors()) {
//			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
//		}
//		else {
//			//creating owner, user and authorities
//			this.productoService.saveProducto(producto);
//			return "redirect:/productos";
//		}
//	}
//	
//	
//	@GetMapping(value="/delete/{productoID}")
//	public String borrarProducto(@PathVariable("productoID") int productoID, ModelMap modelMap) {
//		Optional<Producto> producto = productoService.findProductoById(productoID);
//		if(producto.isPresent()) {
//			productoService.deleteProducto(producto.get());
//			modelMap.addAttribute("message", "Producto borrado correctamente");
//		} else {
//			modelMap.addAttribute("message", "Producto no encontrado");
//		}
//		return "redirect:/productos";
//	}
//	
//	@GetMapping(value = "/save/{productoID}")
//	public String initUpdateForm(@PathVariable("productoID") int productoID, Model model) {
//		Optional<Producto> producto = this.productoService.findProductoById(productoID);
//		if(producto.isPresent()) {
//			model.addAttribute("productos", producto.get());
//			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
//		} else {
//			model.addAttribute("message", "Producto no encontrado");
//			return "redirect:/productos";
//		}
//	}
//
//	@PostMapping(value = "/save/{productoID}")
//	public String processUpdateForm(@Valid Producto producto, BindingResult result,
//			@PathVariable("productoID") int productoID) {
//		if (result.hasErrors()) {
//			return VIEWS_PRODUCTO_CREATE_OR_UPDATE_FORM;
//		}
//		else {
//			producto.setId(productoID);
//			this.productoService.saveProducto(producto);
//			return "redirect:/productos";
//		}
//	}

}