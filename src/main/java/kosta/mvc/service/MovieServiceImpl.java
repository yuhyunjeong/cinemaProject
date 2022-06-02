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
		// TODO Auto-generated method stub

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
