package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.Movie;

public interface MovieService {
	
	/**
	 * 영화 전체검색 
	 */
	List<Movie> selectAll();
	
	/**
	 * 영화 전체검색 - paging처리 
	 */
	Page<Movie> selectAllByPage(Pageable pageable);
	
	/**
	 * 영화 등록하기
	 */
	void insert(Movie movie, MultipartFile file) throws Exception;
	
	/**
	 * 코드번호 검색 
	 */
	Movie selectBy(String movieCode);
	
	/**
	 * 영화 수정하기  
	 */
	Movie update(Movie movie);
	
	/**
	 * 영화 삭제하기  
	 */
	void delete(String movieCode);
	
	/**
	 * 영화 조건별 출력
	 * */
	List<Movie> selectMovie(String optionsRadios 
			//, String flexCheckDefault
			);
	
	/**
	 * 상영 중 영화 가져오기
	 * */
	List<Movie> nowMovie();

}
