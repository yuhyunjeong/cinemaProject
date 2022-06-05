package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Gift;

public interface GiftService {
	
	/**
	 * 사은품 전체검색 
	 */
	List<Gift> selectAll();
	
	/**
	 * 사은품 전체검색 - paging처리 
	 */
	Page<Gift> selectAll(Pageable pageable);
	
	/**
	 * 사은품 등록하기 
	 */
	void insert(Gift gift);
	
	/**
	 * 사은품 수정하기 
	 */
	Gift update(Gift gift);
	
	/**
	 * 사은품 삭제하기 
	 */
	void delete(Gift gift);

}
