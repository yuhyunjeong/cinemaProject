package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Food;
import kosta.mvc.repository.FoodRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class FoodServiceImpl implements FoodService {

	private final FoodRepository foodRepo;
	
	@Override
	public List<Food> selectAll() {
		
		return foodRepo.findAll();
	}

	@Override
	public Page<Food> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Food food) {
		// TODO Auto-generated method stub

	}

	@Override
	public Food update(Food food) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String foodCode) {
		// TODO Auto-generated method stub

	}

}
