package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Orders;
import entity.Orders_status;
import entity.Ordersview;
import util.SearchInfo;

@Repository
public interface Orders_dao {

@Select("select product.fullname product_fullname,product.pics product_pics,product.nowprice simpleprice,p.* from(select orders.code,orders.date,orders.status,oredrs_details.* from orders inner join oredrs_details on orders.id=oredrs_details.orders_id  where orders.user_id=#{id}) p INNER JOIN product  on p.product_id=product.id")
public List<Ordersview>  select(int id);
@Select("select*from orders where user_id =#{id}")
public List<Orders>  selectpp(int id);
@Update("update orders set status=6 where id=#{id}")
public void delete(int id);
@Update("update orders set status=3 where id=#{id}")
public void takegoods(int id);
@Update("update orders set status=1 where id=#{id}")
public void buyproduct(int id);
@Update("update orders set comments='payattion' where id=#{id}")
public void payattion(int id);
@Select("select*from orders where id=#{id}")
public Orders getById(int id);
@Select("select count(id) count from orders ${where}")
public int  select1(SearchInfo info);
@Update("update orders set status=#{dest_status} where id=#{orders_id}")
public void update1(Orders_status ops);
@Insert("insert into Orders(date,code,amount,nowamount,address_id,user_id,status,assessstatus,comments) values(#{date},#{code},#{amount},#{nowamount},#{address_id},#{user_id},#{status},#{assessstatus},#{comments})")
public void insert(Orders ord);
@Select("select max(id) from orders where user_id=#{id}")
public int getMaxid(int id);
@Update("update orders set date=#{date},address_id=#{address_id},status=#{status}")
public void update(Orders ord);
@Select("select oo.product_id from orders inner join oredrs_details oo on orders.id=oo.orders_id  where orders.id = #{id}")
public ArrayList<Integer> onlyids(int id);
}
