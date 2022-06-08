package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Movie;
import kosta.mvc.repository.MovieRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MovieServiceImpl implements MovieService {

	private final MovieRepository movieRepo;

	
	@Override
	public List<Movie> selectAll() {
		return movieRepo.findAll();
	}
	
	@Override
	public Page<Movie> selectAll(Pageable pageable) {
	
		return null;
	}

	@Override
	public void insert(Movie movie) {
		Movie saveMovie = movieRepo.save(movie);
		System.out.println("saveMovie : " + saveMovie);

	}

	@Override
	public Movie selectBy(String movieCode) {
		
		Movie movie = movieRepo.findById(movieCode).orElse(null);
		if(movie.equals(null)) {
			throw new RuntimeException("상세보기 오류가 발생했습니다.");
		}
		
		return movie;
	}
	
	@Override
	public Movie update(Movie movie) {
		
		Movie dbMovie = movieRepo.findById(movie.getMovieCode()).orElse(null);
		if(dbMovie == null) {
			throw new RuntimeException("영화코드 오류로 수정할 수 없습니다.");
		}
		
		// 수정완료
		dbMovie.setMovieName(movie.getMovieName());
		dbMovie.setMovieSummary(movie.getMovieSummary());
		dbMovie.setMovieRunningtime(movie.getMovieRunningtime());
		dbMovie.setMovieStartdate(movie.getMovieStartdate());
		dbMovie.setMovieEnddate(movie.getMovieEnddate());
		dbMovie.setMovieAge(movie.getMovieAge());
		dbMovie.setMovieGenre(movie.getMovieGenre());
		dbMovie.setMovieImage(movie.getMovieImage());
		
		return dbMovie;
	}

	@Override
	public void delete(String movieCode) {
		
		Movie dbMovie = movieRepo.findById(movieCode).orElse(null);
		if(dbMovie == null) {
			throw new RuntimeException("영화코드 오류로 삭제할 수 없습니다.");
		}
		
		movieRepo.deleteById(movieCode);

	}




}
