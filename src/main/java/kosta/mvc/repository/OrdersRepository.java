package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesDTOInterface;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

	/**
	 * 월별 매출
	 * */
	@Query(value = "SELECT \r\n"
			+ "    COUNT(*) as COUNT, \r\n"
			+ "    TO_CHAR(ORDER_DATE, 'YYYY-MM') as DATEDATA,\r\n"
			+ "    NVL(sum(sum_price),0) as food_price,\r\n"
			+ "    NVL(sum(TOTAL_PRICE) -sum(sum_price),0) as movie_price,\r\n"
			+ "    NVL(sum(TOTAL_PRICE),0) as TOTAL_PRICE\r\n"
			+ "FROM\r\n"
			+ "  orders\r\n"
			+ "  left outer join\r\n"
			+ "  food_orderline\r\n"
			+ "  using(order_code)\r\n"
			+ "WHERE 1=1\r\n"
			+ "  and ORDER_DATE>=to_char(sysdate - interval '1' year) and ORDER_DATE<to_char(sysdate)\r\n"
			+ "GROUP BY TO_CHAR(ORDER_DATE, 'YYYY-MM')\r\n"
			+ "ORDER BY DATEDATA"
			, nativeQuery=true)
	List<SalesDTOInterface> selectMonthlySalesList();

	
	
	/**
	 * 연도별 매출
	 * */
	@Query(value = "SELECT \r\n"
			+ "    COUNT(*) as COUNT, \r\n"
			+ "    TO_CHAR(ORDER_DATE, 'YYYY') as DATEDATA,\r\n"
			+ "    NVL(sum(sum_price),0) as food_price,\r\n"
			+ "    NVL(sum(TOTAL_PRICE) -sum(sum_price),0) as movie_price,\r\n"
			+ "    NVL(sum(TOTAL_PRICE),0) as TOTAL_PRICE\r\n"
			+ "FROM\r\n"
			+ "  orders\r\n"
			+ "  left outer join\r\n"
			+ "  food_orderline\r\n"
			+ "  using(order_code)\r\n"
			+ "WHERE 1=1\r\n"
			+ "  and ORDER_DATE>='20180101' and ORDER_DATE<to_char(sysdate)\r\n"
			+ "GROUP BY TO_CHAR(ORDER_DATE, 'YYYY')\r\n"
			+ "ORDER BY DATEDATA"
			, nativeQuery=true)
	List<SalesDTOInterface> selectYearlySalesList();
}
