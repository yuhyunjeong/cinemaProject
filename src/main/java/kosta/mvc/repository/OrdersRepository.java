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
			+ "    TO_CHAR(ORDER_DATE, 'YYYY-MM') as MONTHLYDATA,\r\n"
			+ "    sum(TOTAL_PRICE) as TOTAL_PRICE\r\n"
			+ "FROM\r\n"
			+ "  orders \r\n"
			+ "WHERE 1=1\r\n"
			+ "  and ORDER_DATE>='20220101' and ORDER_DATE<'20220701'\r\n"
			+ "GROUP BY TO_CHAR(ORDER_DATE, 'YYYY-MM')\r\n"
			+ "ORDER BY MONTHLYDATA"
			, nativeQuery=true)
	List<SalesDTOInterface> selectMonthlySalesList();
	
	/**
	 * 연도별 매출
	 * */
	//@Query("select sum(total_price) from orders where order_date> ?1 and order_date< ?2")
	//int selectTotalByYear(int startYear, int endYear);
}
