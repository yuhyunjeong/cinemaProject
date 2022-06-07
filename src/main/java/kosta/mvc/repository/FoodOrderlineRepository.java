package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.FoodOrderline;

public interface FoodOrderlineRepository extends JpaRepository<FoodOrderline, Long> {

}
