package kosta.mvc.service;

import java.util.Date;
import java.util.List;

import kosta.mvc.domain.Time;


public interface TimeService {
    
    /**
     * 무비코드로 검색 (moviecode)
     */
    List<Time> selectBy(String movieCode);
 
    /**
     * 시간 부분검색
     * */
    Time selectBy(long timeCode);
   
    List<Time> selectByTime(Date timeDateconvert, String movieCode);

}