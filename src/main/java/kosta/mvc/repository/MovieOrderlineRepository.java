package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.MovieOrderline;

public interface MovieOrderlineRepository extends JpaRepository<MovieOrderline, Long> {

}
