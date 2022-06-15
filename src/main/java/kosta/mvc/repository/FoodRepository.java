package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import kosta.mvc.domain.Food;

@Repository
public interface FoodRepository extends JpaRepository<Food, String>, QuerydslPredicateExecutor<Food> {

	List<Food> findByFoodCodeEquals(String foodCode);
	
	List<Food> findAll();
	
}
