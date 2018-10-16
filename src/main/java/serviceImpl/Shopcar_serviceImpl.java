package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Shopcar_dao;
import entity.Shopcar;
import service.Shopcar_service;
import util.Ids;

@Service
public class Shopcar_serviceImpl implements Shopcar_service {
@Autowired
Shopcar_dao dao;

	public void insert(Shopcar s) {
    dao.insert(s);		
	}
	public void update(Shopcar s) {
		dao.update(s);
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public List<Shopcar> getById(int id) {
		return dao.getById(id);
	}
	public List<Shopcar> select1(Ids ids) {
		return dao.select1(ids);
	}
	public void deleteids(Ids ids) {
		dao.deleteids(ids);
	}

	public List<Shopcar> select(Ids ids) {
		return dao.select(ids);
	}

	public Shopcar addcount(Shopcar sho) {
		return dao.addcount(sho);
	}
	public List<Shopcar> selectproductid(Ids ids) {
		// TODO Auto-generated method stub
		return dao.selectproductid(ids);
	}


}
