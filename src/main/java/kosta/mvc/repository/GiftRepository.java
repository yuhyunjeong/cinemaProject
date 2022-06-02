package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Gift;

public interface GiftRepository extends JpaRepository<Gift, String> {

}
