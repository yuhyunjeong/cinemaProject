package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Food;

public interface FoodRepository extends JpaRepository<Food, String> {

}
