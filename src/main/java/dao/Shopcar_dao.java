package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Shopcar;
import util.Ids;
@Repository
public interface Shopcar_dao {
@Select("select shopcar.*,product.fullname product_fullname,product.pics product_pics from shopcar inner join product on shopcar.product_id=product.id where shopcar.id in(${ids})")
public List<Shopcar> select(Ids ids);
@Select("select shopcar.*,product.fullname product_fullname,product.pics product_pics from shopcar inner join product on shopcar.product_id=product.id where shopcar.product_id in(${ids})")
public List<Shopcar> selectproductid(Ids ids);
@Insert("insert into shopcar(count,product_id,user_id) values(#{count},#{product_id},#{user_id})")
public void insert(Shopcar s);
@Update("update shopcar set count=#{count} where user_id =#{user_id} and product_id =#{product_id}")
public void update(Shopcar s);
@Delete("delete from shopcar where id=#{id}")
public void delete(int id);
@Select("select*from shopcar where user_id=#{id}")
public List<Shopcar> getById(int id);
@Select("select shopcar.*,product.price product_price,product.nowprice product_nowprice from shopcar inner join product on shopcar.product_id =product.id where shopcar.id in (${ids})")
public  List<Shopcar> select1(Ids ids);
@Select("select*from shopcar shopcar where shopcar.product_id=#{product_id} and shopcar.user_id=#{user_id} ")
public  Shopcar addcount(Shopcar sho);
@Delete("delete from shopcar where id in(${ids})")
public void deleteids(Ids ids);
}
