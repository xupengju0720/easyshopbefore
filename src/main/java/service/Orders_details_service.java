package service;

import java.util.List;

import entity.Orders_details;
import entity.Orders_status;

public interface Orders_details_service {
	public List<Orders_details>  select();
	public void update(Orders_details ops);
	public Orders_details getById(int id);
	public void update1(Orders_status ops);
	public void insert(Orders_details ops);
	public void delete(int id);
	public void commentupdate(int id);
}
