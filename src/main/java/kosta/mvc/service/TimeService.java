package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Time;


public interface TimeService {
    
    /**
     * 시간 전체검색 
     */
    List<Time> selectAll(String movieCode);

}