package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Orders;
import kosta.mvc.repository.OrdersRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrdersRepository orderRepo;
	
	@Override
	public List<Orders> selectAll() {
		return orderRepo.findAll();
	}

}
