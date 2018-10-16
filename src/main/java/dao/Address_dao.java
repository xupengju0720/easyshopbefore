package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.Versioned;

import entity.Address;

@Repository
public interface Address_dao {

@Select("select*from Address ")
public List<Address>  select();
@Select("select*from orders where id=#{id}")
public Address getById(int id);
@Update("update address set zone=#{zone},addr=#{addr},name=#{name} where id=#{id}")
public void update1(Address ops);
@Insert("insert into address(zone,addr,name,user_id,status,tel) values(#{zone},#{addr},#{name},#{user_id},#{status},#{tel})")
public void Insert(Address ops);
@Select("select*from address where user_id=#{id}")
public List<Address> addressall(int id);
@Delete("delete from address where id=#{id}")
public  void  addressdelete(int id);
}
