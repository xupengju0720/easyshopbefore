package service;

import java.util.List;


import entity.Address;

public interface Address_service {
	public List<Address>  select();
	public Address getById(int id);
	public void update1(Address ops);
	public void Insert(Address ops);
	public List<Address> addressall(int id);
	public  void  addressdelete(int id);
}
