package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Address_dao;
import entity.Address;
import service.Address_service;

@Service
public class Address_serviceImpl implements Address_service{
    @Autowired
    Address_dao dao;
	public List<Address> select() {
		return dao.select();
	}

	public Address getById(int id) {
		return dao.getById(id);
	}

	public void update1(Address ops) {
       dao.update1(ops);		
	}

	public void Insert(Address ops) {
		dao.Insert(ops);
	}

	public List<Address> addressall(int id) {
		// TODO Auto-generated method stub
		return dao.addressall(id);
	}

	public void addressdelete(int id) {
		dao.addressdelete(id);
	}

}
