package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Type_dao;
import entity.Product;
import entity.Type;
import service.Type_service;
import util.SearchInfo;

@Service
public class Type_serviceImpl implements Type_service {
	@Autowired
	Type_dao dao;

	public List<Type> select(SearchInfo info) {
		return dao.select(info);
	}

	public void insert(Type t) {
		dao.insert(t);
	}

	public void update(Type t) {
		dao.update(t); 
	}

	public void delete(int id) {
		dao.delete(id);
	}



	public int select1(SearchInfo info) {
		return dao.select1(info);
	}

	public List<Type> getById(int id) {
		return dao.getById(id);
	}
	public List<Product> producttype(int id) {
		return dao.producttype(id);
	}

	public List<Product> producttype1(int id) {
		return dao.producttype1(id);
	}



	
}
