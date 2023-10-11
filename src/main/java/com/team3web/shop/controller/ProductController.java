package com.team3web.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team3web.shop.vo.ProductVO;

// 제품 관련 컨트롤러
@Controller
public class ProductController {
	 
	   private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	   
	 //남성 카테고리
	   @RequestMapping(value = "/mens", method = RequestMethod.GET)
	
	 
	    public String getMens() throws Exception {
	        logger.info("get mens()");
	    return "/category/men/mens";    
	   }
	   //셔츠
	   @RequestMapping(value = "/mens/shirts" ,method = RequestMethod.GET)
	   public String getShirts() throws Exception{
		   logger.info("get shirts");
		   return "/category/men/shirts";
		   
	   }
	   //바지
	   @RequestMapping(value ="/mens/pants", method = RequestMethod.GET)
	   public String getPants() throws Exception{
		   logger.info("get pants");
		   
		   return "/category/men/pants";
	   }
	   
	   @RequestMapping(value = "/womens", method = RequestMethod.GET)
	   public String getWomens() throws Exception{
		   logger.info("get women");
		   return "/category/women/womens";
	   }
	   
	   @RequestMapping(value = "/womens/dresses", method = RequestMethod.GET)
	   public String getDress() throws Exception{
		   logger.info("get dress");
		   return "/category/women/dresses";
	   }
	   
	   @RequestMapping(value = "/womens/skirts", method = RequestMethod.GET)
	   public String getSkirts() throws Exception{
		   logger.info("get skirts");
		   return "/category/women/skirts";
	   }
	   @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	   public String addProduct(@ModelAttribute ProductVO product, @RequestParam("uploadFile") MultipartFile file, Model model) throws IOException {
	       // 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
	       String savedFileName = "";
	       String externalUploadPath = "D:\\program\\imgUpload\\";

	       // 2. 원본 파일 이름 알아오기
	       String originalFileName = file.getOriginalFilename();
	       // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
	       UUID uuid = UUID.randomUUID();
	       savedFileName = uuid.toString();

	       // 5. 외부 저장소에 파일 생성 및 저장
	       File externalFile = new File(externalUploadPath + savedFileName);
	       file.transferTo(externalFile);

	       // 내부 저장소 관련 코드 삭제

	       product.setImageUrl(savedFileName);
	       product.setThumbImg(originalFileName);
	       productService.addProduct(product);
	       model.addAttribute("originalFileName", originalFileName);
	       logger.info("addProduct()" + product);
	       model.addAttribute("product", product);
	       return "redirect:/"; // 상품 목록 페이지로 리다이렉트
}

}