package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Time;

public interface TimeRepository extends JpaRepository<Time, Long> {

}
