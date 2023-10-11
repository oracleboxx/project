package com.team3web.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.team3web.shop.mapper.ProductMapper;
import com.team3web.shop.vo.ProductVO;
@Repository
public class ProductImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;
	@Override
	public void getAllProudct(ProductVO product) {
		sqlSession.getMapper(ProductMapper.class).getAllProducts();
	}
	@Override
	public void addProduct(ProductVO product) {

		 sqlSession.getMapper(ProductMapper.class).addProduct(product);
	}

	@Override
	public void productModify(ProductVO vo) {
	}

	@Override
	public void productDelete(int productId) {
	}

	

}
