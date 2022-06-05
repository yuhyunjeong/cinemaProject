package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Food;

public interface FoodService {
	
	/**
	 * 먹거리 전체검색 
	 */
	List<Food> selectAll();
	
	/**
	 * 먹거리 전체검색 - paging처리 
	 */
	Page<Food> selectAll(Pageable pageable);
	
	/**
	 * 먹거리 등록하기 
	 */
	void insert(Food food);
	
	/**
	 * 먹거리 수정하기 
	 */
	Food update(Food food);

	/**
	 * 먹거리 삭제하기 
	 */
	void delete(String foodCode);


}
