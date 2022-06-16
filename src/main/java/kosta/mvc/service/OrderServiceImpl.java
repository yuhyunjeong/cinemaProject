package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesByMovieDTO;
import kosta.mvc.dto.SalesTotalDTO;
import kosta.mvc.repository.OrdersRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrdersRepository orderRepo;
	
	@Override
	public Page<Orders> selectAll(Pageable page) {
		return orderRepo.findAll(page);
	}

	@Override
	public Orders selectByOrderCode(Long orderCode) {
		Orders order = orderRepo.findById(orderCode).orElse(null);
		if(order==null) throw new RuntimeException("예매 내역 상세정보를 불러올 수 없습니다.");
		return order;
	}

	@Override
	public List<SalesTotalDTO> selectMonthlySalesList() {
		List<SalesTotalDTO> monthlySalesList = orderRepo.selectMonthlySalesList();
		return monthlySalesList;
	}

	@Override
	public List<SalesTotalDTO> selectYearlySalesList() {
		List<SalesTotalDTO> yearlySalesList = orderRepo.selectYearlySalesList();
		return yearlySalesList;
	}

	@Override
	public List<SalesByMovieDTO> selectSalesMonthlyByMovieList() {
		List<SalesByMovieDTO> list = orderRepo.selectSalesMonthlyByMovieList();
		return list;
	}

}
