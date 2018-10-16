package service;

import java.util.List;

import entity.Shopcar;
import util.Ids;
import util.SearchInfo;
public interface Shopcar_service {
	public List<Shopcar> select(Ids ids);
	public void insert(Shopcar s);
	public void update(Shopcar s);
	public void delete(int id);
	public List<Shopcar> getById(int id);
	public  List<Shopcar> select1(Ids ids);
	public void deleteids(Ids ids);
	public  Shopcar addcount(Shopcar sho);
	public List<Shopcar> selectproductid(Ids ids);
}