package dao;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.User;
import entity.pass;
import util.SearchInfo;

@Repository
public interface User_dao {

@Select("select*from user ${where} ${limit}")
public List<User>  select(SearchInfo info);
@Insert("insert into user(email,password,tel,level,amount,status,comments) values(#{email},#{md5},#{tel},#{level},#{amount},#{status},#{comments})")
public void insert(User ops);
@Update("update user set email=#{email},password=#{password},level=#{level},status=#{status},amount=#{amount},tel=#{tel},comments=#{comments} where id=#{id}")
public void update(User ops);
@Delete("delete from user where id=#{id}")
public void delete(int id);
@Select("select*from user where id=#{id}")
public User getById(int id);
@Select("select count(id) count from user ${where}")
public int  select1(SearchInfo info);
@Update("update user set password=#{md5} where id=#{id}")
public void update1(pass p);
}
