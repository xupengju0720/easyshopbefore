package service;

import java.util.List;

import entity.User;
import entity.pass;
import util.SearchInfo;

public interface User_service {
	public List<User>  select(SearchInfo info);
	public void insert(User ops);
	public void update(User ops);
	public void delete(int id);
	public User getById(int id);
	public int  select1(SearchInfo info);
	public void update1(pass p);
}
