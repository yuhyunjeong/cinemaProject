package kosta.mvc.service;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.Tuple;

import kosta.mvc.domain.Movie;
//import kosta.mvc.domain.QMovie;
import kosta.mvc.repository.MovieRepository;
import kosta.mvc.repository.OrdersRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MovieServiceImpl implements MovieService {

	private final MovieRepository movieRepo;
	private final OrdersRepository orderRepo;
	
	@Override
	public List<Movie> selectAll() {
		return movieRepo.findAll();
	}
	
	@Override
	public Page<Movie> selectAllByPage(Pageable pageable) {
	
		return movieRepo.findAll(pageable);
	}

	@Override
	public void insert(Movie movie, MultipartFile file) throws Exception {
		
		String path = System.getProperty("user.dir") + "/src/main/resources/static/img/movie";
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + file.getOriginalFilename();
		File saveFile = new File(path, fileName);
		file.transferTo(saveFile);
		movie.setMovieImage(fileName);
		movie.setMoviePath("img/movie/" + fileName);
		movieRepo.save(movie);

//		Movie saveMovie = movieRepo.save(movie);
//		System.out.println("saveMovie : " + saveMovie);

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
		dbMovie.setActorList(movie.getActorList());
		
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

	@Override
	public List<Movie> selectMovie(String optionsRadios, String flexCheckDefault) {
		//QMovie movie = QMovie.movie;
		//BooleanBuilder builder = new BooleanBuilder();
		//Tuple tuple = 
		
		//LocalDate now = LocalDate.now();
		
		//builder.and(movie.movieStartdate.lt(now))
		
		if(!(flexCheckDefault==null)) {
			
			if(optionsRadios.equals("option1")) {
				
				List<Movie> movieFind = movieRepo.selectByDate();
				
				Date now = new Date();	
				List<Movie> list = new ArrayList<Movie>();
				for(Movie m : movieFind) {
								
					if(m.getMovieEnddate().after(now) && m.getMovieStartdate().before(now)) {
						Movie mo = new Movie(m.getMovieCode(), m.getMovieName(), m.getMovieSummary(), m.getMovieRunningtime(), m.getMovieStartdate(), m.getMovieEnddate(), 
									m.getMovieGenre(), m.getMovieAge(), m.getMovieImage(), m.getActorList(), 
									m.getGift(), m.getTimeList(), m.getMoviePath());
						list.add(mo);
					}	
					
				}
				
				return list;
				
			}else if(optionsRadios.equals("option2")){
				
				List<String> movieList = movieRepo.selectByCount();
				System.out.println(movieList);			
				
				List<Movie> movieFind = movieRepo.findAllById(movieList);
				System.out.println(movieFind);  
				
				Date now = new Date();	
				List<Movie> list = new ArrayList<Movie>();
				for(Movie m : movieFind) {
								
					if(m.getMovieEnddate().after(now) && m.getMovieStartdate().before(now)) {
						Movie mo = new Movie(m.getMovieCode(), m.getMovieName(), m.getMovieSummary(), m.getMovieRunningtime(), m.getMovieStartdate(), m.getMovieEnddate(), 
								m.getMovieGenre(), m.getMovieAge(), m.getMovieImage(), m.getActorList(), 
								m.getGift(), m.getTimeList(), m.getMoviePath());
						list.add(mo);
					}	
					
				}
				
				return list;
				
			}else if(optionsRadios.equals("option3")){
		
				List<Movie> movieFind = movieRepo.selectByStar();
				System.out.println(movieFind);  
				
				Date now = new Date();	
				List<Movie> list = new ArrayList<Movie>();
				for(Movie m : movieFind) {
								
					if(m.getMovieEnddate().after(now) && m.getMovieStartdate().before(now)) {
						Movie mo = new Movie(m.getMovieCode(), m.getMovieName(), m.getMovieSummary(), m.getMovieRunningtime(), m.getMovieStartdate(), m.getMovieEnddate(), 
								m.getMovieGenre(), m.getMovieAge(), m.getMovieImage(), m.getActorList(), 
								m.getGift(), m.getTimeList(), m.getMoviePath());
						list.add(mo);
					}	
					
				}
				
				return list;
			}
		
			
		}else {
			if(optionsRadios.equals("option1")) {
				
				return movieRepo.selectByDate();
				
			}else if(optionsRadios.equals("option2")){
				
				List<String> movieList = movieRepo.selectByCount();
				System.out.println(movieList);			
				
				List<Movie> movieFind = movieRepo.findAllById(movieList);
				System.out.println(movieFind);  
				
				return movieFind;
				
			}else if(optionsRadios.equals("option3")){
			
				List<Movie> movieFind = movieRepo.selectByStar();
				System.out.println(movieFind);  
				
				return movieFind;
			}
			
		}
		
		
		
		return movieRepo.selectByDate();
		
	}
	
//	private Sort sortByCountDesc() {
//		return new Sort(Sort.Direction.DESC, "count(*)");
//	}

	@Override
	public List<Movie> nowMovie() {
		
		return movieRepo.nowMovie();
	}

	


}
