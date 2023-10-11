package com.team3web.shop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3web.shop.dao.ProductDAO;
import com.team3web.shop.vo.ProductVO;
@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	ProductDAO productDao;
	@Override
	public void getAllProudct(ProductVO product) {
		productDao.getAllProudct(product);
	}

	@Override
	public void addProduct(ProductVO product) {
		productDao.addProduct(product);
	}

	@Override
	public void productModify(ProductVO vo) {
	}

	@Override
	public void productDelete(int productId) {
	}

}
