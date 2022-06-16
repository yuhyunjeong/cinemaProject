package kosta.mvc.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.Food;
import kosta.mvc.repository.FoodRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class FoodServiceImpl implements FoodService {

	private final FoodRepository foodRepo;
	
	@Override
	public List<Food> selectAll() {
		
		return foodRepo.findAll();
	}

	@Override
	public Page<Food> selectAll(Pageable pageable) {
		
		return null;
	}

	@Override
	public void insert(Food food, MultipartFile file) throws Exception {
		
		String path = System.getProperty("user.dir") + "/src/main/resources/static/img/food";
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + file.getOriginalFilename();
		File saveFile = new File(path, fileName);
		file.transferTo(saveFile);
		food.setFoodImage(fileName);
		food.setFoodPath("img/food/" + fileName);
		foodRepo.save(food);
		
//		Food saveFood = foodRepo.save(food);
//		System.out.println("saveFood : " + saveFood);

	}
	
	@Override
	public Food selectBy(String foodCode) {
		
		Food food = foodRepo.findById(foodCode).orElse(null);
		if(food.equals(null)) {
			throw new RuntimeException("상세보기 오류가 발생했습니다.");
		}

		return food;
	}


	@Override
	public Food update(Food food) {
		
		Food dbFood = foodRepo.findById(food.getFoodCode()).orElse(null);
		if(dbFood == null) {
			throw new RuntimeException("먹거리코드 오류로 수정할 수 없습니다.");
		}
		
		// 수정완료 
		dbFood.setFoodName(food.getFoodName());
		dbFood.setFoodContent(food.getFoodContent());
		dbFood.setFoodPrice(food.getFoodPrice());
		dbFood.setFoodImage(food.getFoodImage());
		
		return dbFood;
	}

	@Override
	public void delete(String foodCode) {
		
		Food dbFood = foodRepo.findById(foodCode).orElse(null);
		if(dbFood == null) {
			throw new RuntimeException("먹거리코드 오류로 삭제할 수 없습니다.");
		}
		
		foodRepo.deleteById(foodCode);

	}


}
