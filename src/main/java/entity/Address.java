package entity;

public class Address {
 int id;
 int user_id;
 String zone;
 String addr;
String name;
 String tel;
 int status;
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
public String getZone() {
	return zone;
}
public void setZone(String zone) {
	this.zone = zone;
}
public String getAddr() {
	return addr;
}

public void setAddr(String addr) {
	this.addr = addr;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getAddress_Name(){
	return zone+addr ;
}
}
