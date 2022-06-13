package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

import kosta.mvc.domain.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie, String>, QuerydslPredicateExecutor<Movie> {

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
	//@Query("select count(m) from Movie m where m.movieCode=?1 and m.timeDate<sysdate group by m.isBooked Having m.isBooked=1")
	//int selectByCount(String movieCode);
	
	
	
	/**
	 * 상영 종료 영화
	 * */
	@Query("select m from Movie m where m.movieEnddate < sysdate")
	List<Movie> pastMovie();
	
	/**
	 * 상영 예정 영화
	 * */
	@Query("select m from Movie m where m.movieStartdate > sysdate")
	List<Movie> futureMovie();
	
	/**
	 * 상영 중 영화 중 최신
	 * */
	@Query("select m from Movie m where m.movieStartdate < sysdate and m.movieEnddate > sysdate order by m.movieStartdate desc")
	List<Movie> nowMovie();
	
	List<Movie> findByMovieCodeEquals(String movieCode);
	
	List<Movie> findAll();

}
