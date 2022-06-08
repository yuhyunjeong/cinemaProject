package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kosta.mvc.domain.Movie;
import kosta.mvc.domain.Time;

@Repository
public interface MovieRepository extends JpaRepository<Movie, String> {


}
