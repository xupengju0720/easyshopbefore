package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Orders_details_dao;
import entity.Orders_details;
import entity.Orders_status;
import service.Orders_details_service;

@Service
public class Orders_details_serviceImpl implements Orders_details_service{
     @Autowired
     Orders_details_dao dao;
	public List<Orders_details> select() {
		// TODO Auto-generated method stub
		return dao.select();
	}

	public void update(Orders_details ops) {
        dao.update(ops);		
	}

	public Orders_details getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	public void update1(Orders_status ops) {
           dao.update1(ops);		
	}

	public void insert(Orders_details ops) {
   dao.insert(ops);		
	}

	public void delete(int id) {
dao.delete(id);		
	}

	public void commentupdate(int id) {
         dao.commentupdate(id);		
	}

}
