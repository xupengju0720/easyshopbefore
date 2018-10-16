package service;

import java.util.ArrayList;
import java.util.List;
import entity.Orders;
import entity.Orders_status;
import entity.Ordersview;
import entity.Shopcar;
import util.SearchInfo;

public interface Orders_service {
	public List<Ordersview>  select(int id);
	public List<Orders>  selectpp(int id);
	public void delete(int id);
	public void buyproduct(int id);
	public void payattion(int id);
	public void takegoods(int id);
	public Orders getById(int id);
	public int  select1(SearchInfo info);
	public void update1(Orders_status ops);
	public void insert(Orders ord);
	public int getMaxid(int id);
	public void update(Orders ord);
	public ArrayList<Integer> onlyids(int id);
}
