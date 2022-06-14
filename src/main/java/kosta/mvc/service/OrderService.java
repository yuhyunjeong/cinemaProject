package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesTotalDTO;

public interface OrderService {
	
	List<Orders> selectAll();

	Orders selectByOrderCode(Long orderCode);

	List<SalesTotalDTO> selectMonthlySalesList();

	List<SalesTotalDTO> selectYearlySalesList();
}
