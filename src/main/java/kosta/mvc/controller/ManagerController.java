package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@RequestMapping("/managerMain")
	public void main() {}
	
	@RequestMapping("/product")
	public void product() {}
	
	@RequestMapping("/productDetail")
	public void productDetail() {}
	
	@RequestMapping("/productUpdate")
	public void productUpdate() {}
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
	
	@RequestMapping("/tickets")
	public void tickets() {}
	
	@RequestMapping("/sales")
	public void sales() {}
	
	@RequestMapping("/members")
	public void members() {}
	
}
