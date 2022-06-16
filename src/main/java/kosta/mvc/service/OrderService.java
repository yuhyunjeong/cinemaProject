package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesByMovieDTO;
import kosta.mvc.dto.SalesTotalDTO;

public interface OrderService {
	
	Page<Orders> selectAll(Pageable page);

	Orders selectByOrderCode(Long orderCode);

	List<SalesTotalDTO> selectMonthlySalesList();

	List<SalesTotalDTO> selectYearlySalesList();

	List<SalesByMovieDTO> selectSalesMonthlyByMovieList();
}
