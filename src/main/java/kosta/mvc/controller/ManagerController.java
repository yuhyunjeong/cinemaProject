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
	
	@RequestMapping("/payment")
	public void payment() {}
	
	@RequestMapping("/paymentComplete")
	public void paymentComplete() {}
}
