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
public interface Product_dao {
@Select("select product.*,type.name t_name,type.parentid t_parentid from product inner join type on product.type_id=type .id ${where}")
public List<Product> select(SearchInfo info);
@Insert("insert into product(fullname,type_id,activity,tip,sale,info,price,nowprice,salecount,collectcount,priority,status,pics,comments) values(#{fullname},#{type_id},#{activity},#{tip},#{sale},#{info},#{price},#{nowprice},#{salecount},#{collectcount},#{priority},#{status},#{pics},#{comments})")
public void insert(Product p);
@Update("update product set fullname=#{fullname},type_id=#{type_id},activity=#{activity},tip=#{tip},sale=#{sale},info=#{info},price=#{price},nowprice=#{nowprice},salecount=#{salecount},collectcount=#{collectcount},priority=#{priority},status=#{status},pics=#{pics},comments=#{comments} where id=#{id}")
public void update(Product p);
@Delete("delete from product where id=#{id}")
public void delete(int id);
@Select("select product.*,type.name t_name from product inner join type on product.type_id=type.id  where product.id=#{id}")
public Product getById(int id);
@Select("select count(id) count from product ${where}")
public int  select1(SearchInfo info);
@Select("select*from type where parentid=#{id}")
public List<Product>  product(int id);
@Update("update product set salecount=#{salecount} where id = #{id}")
public void updatecount(Product pro);
}
