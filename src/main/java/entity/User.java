package entity;

public class User {
	public  static String [] levels = {"等级一","等级二","等级三","等级四","等级五","等级六","等级七","等级八"};
	public  static String [] statuss = {"冻结","可用"};
int id;
String email;
String password;
String tel;
int level;
int status;
Double amount;
String comments;

public String getStatus_Name() {
	return statuss[status];
}
public String getLevel_Name() {
	return levels[level];
}


public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getTel() {
	return tel;
}

public void setTel(String tel) {
	this.tel = tel;
}

public int getLevel() {
	return level;
}

public void setLevel(int level) {
	this.level = level;
}

public int getStatus() {
	return status;
}

public void setStatus(int status) {
	this.status = status;
}

public Double getAmount() {
	return amount;
}

public void setAmount(Double amount) {
	this.amount = amount;
}

public String getComments() {
	return comments;
}

public void setComments(String comments) {
	this.comments = comments;
}

public String getMd5() {
	return MD5.MD5(password);
}
}
