package entity;

public class Orders_details {
int id;
Double price;
Double nowprice;
int orders_id;
int product_id;
int count;
String comments;
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}
public Double getNowprice() {
	return nowprice;
}
public void setNowprice(Double nowprice) {
	this.nowprice = nowprice;
}
public int getOrders_id() {
	return orders_id;
}
public void setOrders_id(int orders_id) {
	this.orders_id = orders_id;
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
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}}
