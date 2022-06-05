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
			new RuntimeException("상세보기 오류가 발생했습니다.");
		}
		
		return movie;
	}
	
	@Override
	public Movie update(Movie movie) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String movieCode) {
		// TODO Auto-generated method stub

	}




}
