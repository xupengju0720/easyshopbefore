package entity;

public class Ordersview {
	public static String statuss[] = { "未支付", "已支付", "已发货", "已收货", "已退货", "已取消" };
	String product_fullname;
	String product_pics;
	String code;
	String date;
	int id;
	int orders_id;
	int product_id;
	int count;
	int status;
	double price;
	double nowprice;
	String comments;
	int simpleprice;

	public String getPic() {
		if (product_pics.length() < 5)
			return null;
		String[] pic = product_pics.split(",");

		if (pic.length > 0)
			return pic[0];
		else
			return null;
	}

	public String getStatus_Name() {
		return statuss[status];
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getProduct_pics() {
		return product_pics;
	}

	public void setProduct_pics(String product_pics) {
		this.product_pics = product_pics;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getNowprice() {
		return nowprice;
	}

	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getSimpleprice() {
		return simpleprice;
	}

	public void setSimpleprice(int simpleprice) {
		this.simpleprice = simpleprice;
	}

	public String getProduct_fullname() {
		return product_fullname;
	}

	public void setProduct_fullname(String product_fullname) {
		this.product_fullname = product_fullname;
	}

}
