package org.springframework.samples.petclinic.web;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Pedido;
import org.springframework.samples.petclinic.service.PedidoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pedidos")
public class PedidoController {
	
		private static final String VIEWS_PEDIDO_CREATE_OR_UPDATE_FORM = "pedidos/createOrUpdatePedidoForm";
		private PedidoService pedidoService;
		
		@Autowired
		public PedidoController(PedidoService pedidoService) {
			this.pedidoService = pedidoService;
		}
	
		@GetMapping()
		public String listadoPedidos(ModelMap modelMap) {
			String vista = "pedidos/listadoPedidos";
			Iterable<Pedido> pedidos = pedidoService.findAll();
			modelMap.addAttribute("pedidos", pedidos);
			return vista;
		}
		
		@GetMapping(value = "/new")
		public String initCreationForm(Map<String, Object> model) {
			Pedido pedido = new Pedido();
			model.put("pedidos", pedido);
			return VIEWS_PEDIDO_CREATE_OR_UPDATE_FORM;
		}
		
		@PostMapping(value = "/new")
		public String processCreationForm(@Valid Pedido pedido, BindingResult result) {
			if (result.hasErrors()) {
				return VIEWS_PEDIDO_CREATE_OR_UPDATE_FORM;
			}
			else {
				//creating owner, user and authorities
				pedido.setFecha(LocalDateTime.now());
				this.pedidoService.savePedido(pedido);
				return "redirect:/pedidos";
			}
		}
		
		@GetMapping(value="/delete/{pedidoID}")
		public String borrarPedido(@PathVariable("pedidoID") int pedidoID, ModelMap modelMap) {
			Optional<Pedido> pedido = pedidoService.findPedidoById(pedidoID);
			if(pedido.isPresent()) {
				pedidoService.deletePedido(pedido.get());
				modelMap.addAttribute("message", "Pedido borrado correctamente");
			} else {
				modelMap.addAttribute("message", "Pedido no encontrado");
			}
			return "redirect:/pedidos";
		}

}
