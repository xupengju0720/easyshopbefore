package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Product;
import entity.Type;
import util.SearchInfo;
@Repository
public interface Type_dao {
@Select("select type.*,t.name t_name from type left join type t on  t.id=type.parentid ${where}")
public List<Type> select(SearchInfo info);
@Insert("insert into type(id,name,parentid) values(#{id},#{name},#{parentid})")
public void insert(Type t);
@Update("update type set id=#{id},name=#{name},parentid=#{parentid}")
public void update(Type t);
@Delete("delete from type where id=#{id}")
public void delete(int id);
@Select("select*from type where user_id=#{id}")
public List<Type> getById(int id);
@Select("select count(id) count from type ${where}")
public int  select1(SearchInfo info);
@Select("select product.*from type inner join product on type.id=product.type_id where type.id=#{id}")
public List<Product>  producttype(int id);
@Select("select product.*from type inner join product on type.id=product.type_id where type.parentid=#{id}")
public List<Product>  producttype1(int id);
}
