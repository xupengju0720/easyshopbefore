package serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Orders_dao;
import entity.Orders;
import entity.Orders_status;
import entity.Ordersview;
import service.Orders_service;
import util.SearchInfo;

@Service
public class Orders_serviceImpl implements Orders_service{
	@Autowired
     Orders_dao dao;
	
	
	
	public Orders getById(int id) {
		return dao.getById(id);
	}

	public int select1(SearchInfo info) {
		return dao.select1(info);
	}



	public void update1(Orders_status ops) {
		dao.update1(ops);
	}



	public void insert(Orders ord) {
      dao.insert(ord);
	}



	public int getMaxid(int id) {
		return dao.getMaxid(id);
	}

	public List<Ordersview> select(int id) {
		// TODO Auto-generated method stub
		return dao.select(id);
	}

	public List<Orders> selectpp(int id) {
		// TODO Auto-generated method stub
		return dao.selectpp(id);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public void buyproduct(int id) {
          dao.buyproduct(id);		
	}

	public void payattion(int id) {
     dao.payattion(id);		
	}

	public void takegoods(int id) {
     dao.takegoods(id);		
	}

	public void update(Orders ord) {
       dao.update(ord);		
	}

	public ArrayList<Integer> onlyids(int id) {
		// TODO Auto-generated method stub
		return dao.onlyids(id);
	}
}
