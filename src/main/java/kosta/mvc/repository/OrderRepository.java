package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
