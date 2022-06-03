package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Orders;

public interface OrderService {
	
	List<Orders> selectAll();
}
