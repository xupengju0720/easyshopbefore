package entity;

public class Shopcar {
int id;
int user_id;
int product_id;
int count;
double product_price;
double product_nowprice;
String product_fullname;
String product_pics;

public String getPic() {
	if(product_pics.length()<5)return null;
	String [] pic=product_pics.split(",");
	if(pic.length>0)
	return pic[0];
	else return null;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public double getProduct_price() {
	return product_price;
}
public void setProduct_price(double product_price) {
	this.product_price = product_price;
}
public double getProduct_nowprice() {
	return product_nowprice;
}
public void setProduct_nowprice(double product_nowprice) {
	this.product_nowprice = product_nowprice;
}
public String getProduct_fullname() {
	return product_fullname;
}
public void setProduct_fullname(String product_fullname) {
	this.product_fullname = product_fullname;
}
public String getProduct_pics() {
	return product_pics;
}
public void setProduct_pics(String product_pics) {
	this.product_pics = product_pics;
}
}
