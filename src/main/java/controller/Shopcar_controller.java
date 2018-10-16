package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

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
import util.serialnumber;

@Controller
public class Shopcar_controller {
	
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
	@Autowired
	Shopcar_service service;
	@RequestMapping("ShoppingCarindex") //购物车商品罗列
	public String  index(ModelMap m,Integer id,SearchInfo info) {
	m.put("carlist", service.getById(id));
	List<Shopcar> tt = (List<Shopcar>) service.getById(id);
	 ArrayList<Product> pp = (ArrayList<Product>) service6.select(info);
	m.put("productlist", pp);
	return "ShoppingCar";
	}
	
	@RequestMapping("ShoppingCardel") //删除购物车
	public @ResponseBody jsonInfo ShoppingCardel(Shopcar sho){
		service.delete(sho.getId());
		return new jsonInfo(1,"");
		
	}
	@RequestMapping("changecount") //改变购物车数量
	public @ResponseBody jsonInfo changecount(Shopcar sho){
		service.update(sho);
		return new jsonInfo(1,"");
		
	}
	@RequestMapping("shoppingcaradd") //加入购物车
	public @ResponseBody jsonInfo ShoppingCaradd(Shopcar sho,HttpSession session){
		Shopcar ss = new Shopcar();
		User user =(User) session.getAttribute("sdetail");
		ss.setProduct_id(sho.getProduct_id());
		ss.setUser_id(user.getId());
		if (service.addcount(ss)==null) {
			sho.setUser_id(user.getId());
			service.insert(sho);
		}else {
			Integer pp = service.addcount(ss).getCount()+sho.getCount();
			ss.setCount(pp);
			service.update(ss);
		}
		return new jsonInfo(1,""); 
		
	}
	@RequestMapping("payorders")   //订单页 未支付的支付跳转  
	public String payorders(Ids i,int id,ModelMap m,HttpSession session) {
		User add = (User) session.getAttribute("sdetail");
		Integer k =add.getId();
		m.put("addlist",service5.addressall(k));
		m.put("orders_id", id);
		String  pids= service1.onlyids(id).toString().substring(1, service1.onlyids(id).toString().length()-1);
		i.setIds(pids);
		m.put("choicelist", service.selectproductid(i));  //根据商品id查
		return "Addresschoice/index";  
	}
	@RequestMapping("selectCar")   //从session中获取当前用户id  查出所有地址    并查出所选商品
	public String selectCar(Ids ids,ModelMap m,HttpSession session) {
	     m.put("choicelist", service.select(ids));   //根据购物车id查
		User add = (User) session.getAttribute("sdetail");
		Integer id =add.getId();
		m.put("addlist",service5.addressall(id));
		Double amount=0.0;
		Double nowamount=0.0;
		Orders_details ordd =new Orders_details();
		Orders_status ords = new Orders_status();
		Orders ord =new Orders();
		serialnumber pp = new serialnumber();
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
		ord.setUser_id(userid);
		ord.setAddress_id(0);
		ord.setAssessstatus(0);
		ord.setCode(pp.Getnum());
		ord.setDate(date);
		ord.setStatus(0);
		ord.setComments("备注");
		ord.setAmount(amount);
		ord.setNowamount(nowamount);
		service1.insert(ord);        //加入订单

		int orders_id= service1.getMaxid(userid);//获取指定用户的最大订单id
		m.put("orders_id", orders_id);
		ords.setOrders_id(orders_id);
		ords.setDate(date);
		ords.setDest_status(0);
		ords.setInfo("待付款");
		ords.setNum(0);
	    ords.setAmount(amount);	
		ords.setComments("0");
		service2.insert(ords);     //加入订单状态
		
		Product product = new Product();
		 for (int i = 0; i < aa.size(); i++) {
		Double damount=(Double)(aa.get(i).getCount()*aa.get(i).getProduct_price());
		Double dnowamount=(Double)(aa.get(i).getCount()*aa.get(i).getProduct_nowprice());
		ordd.setOrders_id(orders_id);
		ordd.setProduct_id(aa.get(i).getProduct_id());
		ordd.setCount(aa.get(i).getCount());
		ordd.setPrice(damount);
		ordd.setNowprice(dnowamount);
	    ordd.setComments("未付款");
	    service3.insert(ordd);     //加入订单详情
		}
		return "Addresschoice/index";
	}
	@RequestMapping("ShoppingCardelete")//加入订单后删除购物车中对应的商品
	public String ShoppingCardel(HttpSession session,Ids ids) {
		service.deleteids(ids);
		return "GR";
		
	}
	
}
