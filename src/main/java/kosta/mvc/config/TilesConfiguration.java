package kosta.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration // 어노테이션 기반의 환경설정을 돕는 annotation이다. 이클립스 내부에 @Bean을 선언한 메소드가 리턴하는 객체를 bean으로 등록해준다. 
public class TilesConfiguration {
	
	/**
	 * Tiles 관련 bean 등록 
	 */
	@Bean
	public UrlBasedViewResolver viewResolver() {
		
		UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
		urlBasedViewResolver.setOrder(0);
		urlBasedViewResolver.setViewClass(TilesView.class);
		
		System.out.println("TilesConfiguration의 viewResolver() 호출됨...");
		
		return urlBasedViewResolver;
	
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		
		TilesConfigurer tiles = new TilesConfigurer();
		tiles.setDefinitions(new String[] {"/WEB-INF/tiles/tiles.xml"});
		
		return tiles;
	}
}
