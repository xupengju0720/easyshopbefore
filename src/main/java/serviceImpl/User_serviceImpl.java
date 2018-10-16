package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.Operator;
import org.springframework.stereotype.Service;

import dao.User_dao;
import entity.User;
import entity.pass;
import service.User_service;
import util.SearchInfo;
@Service
public class User_serviceImpl implements User_service{
   @Autowired
   User_dao dao;
	public List<User> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(User ops) {
       dao.insert(ops);		
	}
	public void update(User ops) {
		  dao.update(ops);
	}
	public void delete(int id) {
		 dao.delete(id);
	}
	public User getById(int id) {
		return dao.getById(id);
	}
	public int select1(SearchInfo info) {
		return dao.select1(info);
	}
	public void update1(pass p) {
		dao.update1(p);
	}



}
