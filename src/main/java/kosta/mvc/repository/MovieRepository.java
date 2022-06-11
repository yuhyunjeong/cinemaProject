package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kosta.mvc.domain.Movie;
import kosta.mvc.domain.Time;

@Repository
public interface MovieRepository extends JpaRepository<Movie, String> {

	/**
	 * 최신순
	 * */
	@Query("select m from Movie m order by m.movieStartdate desc")
	List<Movie> selectByDate();
	
	/**
	 * 예매율순
	 * */
	
	
	/**
	 * 관람객순
	 * */
	//@Query("select m from Movie m order by ")
}
