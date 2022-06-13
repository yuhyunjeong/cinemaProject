package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesDTOInterface;

public interface OrderService {
	
	List<Orders> selectAll();

	Orders selectByOrderCode(Long orderCode);

	List<SalesDTOInterface> selectMonthlySalesList();
}
