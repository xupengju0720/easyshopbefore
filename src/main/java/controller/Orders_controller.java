package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.weaver.reflect.DeferredResolvedPointcutDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.groovy.GroovyBeanDefinitionReader;
import org.springframework.jdbc.core.ParameterMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Address;
import entity.Orders;
import entity.Orders_details;
import entity.Orders_status;
import entity.Product;
import entity.Shopcar;
import entity.User;
import service.Address_service;
import service.Orders_details_service;
import service.Orders_service;
import service.Orders_status_service;
import service.Product_service;
import service.Shopcar_service;
import util.Ids;
import util.SearchInfo;
import util.jsonInfo;
import util.serialnumber;;
@Controller
public class Orders_controller {
@Autowired
Orders_service service1;
@Autowired
Orders_status_service service2;
@Autowired
Orders_details_service service3;
@Autowired
Shopcar_service service4;
@Autowired
Address_service service5;
@Autowired
Product_service service6;
serialnumber pp = new serialnumber();
@RequestMapping("fukuan") //购物车结算
public String fukuan(Address add,HttpSession session,Integer addressid,Ids ids,int ordersid) {
	Double amount=0.0;
	Double nowamount=0.0;
	Orders_details ordd =new Orders_details();
	Orders_status ords = new Orders_status();
	Orders ord =new Orders();
	
	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
     String date = formatter.format(new Date());
     User user =(User) session.getAttribute("sdetail");//获取用户信息
    Integer userid =user.getId();			//获取用户id
	List<Shopcar> aa = service4.select1(ids);  //查出购物车  和商品价格 
    ArrayList<Integer> reids =new ArrayList<Integer>();
	 for (int i = 0; i < aa.size(); i++) {
		 amount+=(Double)(aa.get(i).getCount()*aa.get(i).getProduct_price());
		 nowamount+=(Double)(aa.get(i).getCount()*aa.get(i).getProduct_nowprice());
		 reids.add(aa.get(i).getId());
	}
	ord.setAddress_id(addressid);
	ord.setDate(date);
	ord.setStatus(1);
	service1.update(ord);        //修改订单

	ords.setOrders_id(ordersid);
	ords.setDate(date);
	ords.setDest_status(1);
	ords.setInfo("已付款");
	ords.setNum(0);
    ords.setAmount(amount);	
	ords.setComments("0");
	service2.insert(ords);     //加入订单状态
	
	ordd.setComments("已付款");  //修改订单详情
    service3.commentupdate(ordersid); 
	Product product = new Product();
	 for (int i = 0; i < aa.size(); i++) {
    Integer  sproductid = aa.get(i).getProduct_id();
    Integer  scount = service6.getById(sproductid).getSalecount()+aa.get(i).getCount(); 
    product.setId(sproductid);
    product.setSalecount(scount);
    service6.updatecount(product);   //对应商品  数量增加
	}
	 String  pids = reids.toString().substring(1,reids.toString().length()-1);
return "redirect:ShoppingCardelete?ids="+pids;
}
@RequestMapping("Ordersselect")
public  String  Ordersselect(ModelMap m,HttpSession session) {
	User user = (User) session.getAttribute("sdetail");
	int id =user.getId();
	m.put("orderslistdetail",service1.select(id));
	m.put("orderslistsimple", service1.selectpp(id));
	return "Orderview/index";
}
@RequestMapping("deleteorders")   //改订单状态为10  客户看不见  
public @ResponseBody jsonInfo deleteorders(int id) {
	
    	service1.delete(id);//改订单状态为6
    	Orders_status ords=new Orders_status();
    	ords.setOrders_id(id);
    	ords.setDate(pp.Getnum());
    	ords.setDest_status(6);
    	ords.setInfo("此订单已被用户删除");
    	ords.setNum(0);
        ords.setAmount(0.0);	
    	ords.setComments("0");
    	service2.insert(ords);
    	service3.delete(id);//改订单详情表的 备注为  客户取消订单
	return new jsonInfo(1,"");
}
@RequestMapping("buyproduct")     // 这是针对有定单状态为0未付款  购买商品  改订单状态为1  并且修改订单状态表  时间和状态
public @ResponseBody jsonInfo buyproduct(int id) {
	service1.buyproduct(id);
	Orders_status odes = new Orders_status();
	 odes.setDate( serialnumber.getStringDate());
	 odes.setDest_status(1);
return new jsonInfo(1,"");
}
@RequestMapping("takegoods")     //确认收货  改订单状态为3已收货 并且新增订单状态表  时间和状态
public @ResponseBody jsonInfo takegoods(int id) {
	 service1.takegoods(id);     
	 Orders_status odes = new Orders_status();
	 SimpleDateFormat d1 = new SimpleDateFormat("yyyy-MM-dd");
	String date =d1.format(new Date());
	 odes.setDate(date);
	 odes.setDest_status(3);
	 odes.setOrders_id(id);
	 odes.setNum(0);
	 odes.setInfo("已经收货");
	 odes.setAmount(0.0);
	 odes.setComments("0");
	 service2.insert(odes);
	return new jsonInfo(1,"");
}
@RequestMapping("payattion")     //客户提醒发货   改订单备注
public @ResponseBody jsonInfo payattion(int id) {
	service1.payattion(id);
	return new jsonInfo(1,"");
}
@RequestMapping("orderscancel")     //订单取消申请  改订单表状态为4  并且在订单详情表加入
public String  orderscancel(int id,ModelMap m) {
	 SimpleDateFormat d1 = new SimpleDateFormat("yyyy-MM-dd");
		String date =d1.format(new Date());
	m.put("orders_id", id);
	m.put("dest_status", 4);
	m.put("date",date );
	m.put("info", "退货申请");
	m.put("nowamount",service1.getById(id).getNowamount());
	return "Orderview/edit2";
}
@RequestMapping("insertstatus")
protected @ResponseBody jsonInfo insertstatus(Orders_status ords) { 
	service1.update1(ords);
	service2.insert(ords);
	return new jsonInfo(1,"");
}
}
