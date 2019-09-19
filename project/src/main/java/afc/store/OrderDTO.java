package afc.store;

import java.sql.Date;

public class OrderDTO {
	String or_num;
	String id;	
	String or_name;
	int count;
	int price;
	int totalPrice;
	String or_size;
	//String or_date;
	Date or_date;
	String or_phone;
	String or_postcode;
	String or_roadaddr;
	String or_detailaddr;
	String or_content;
	String or_payment;
	
	public OrderDTO() {
				
	}

	public OrderDTO(String or_num, String id, String or_name, int count, int price, int totalPrice, String or_size,
			Date or_date, String or_phone, String or_postcode, String or_roadaddr, String or_detailaddr,
			String or_content, String or_payment) {
		super();
		this.or_num = or_num;
		this.id = id;
		this.or_name = or_name;
		this.count = count;
		this.price = price;
		this.totalPrice = totalPrice;
		this.or_size = or_size;
		this.or_date = or_date;
		this.or_phone = or_phone;
		this.or_postcode = or_postcode;
		this.or_roadaddr = or_roadaddr;
		this.or_detailaddr = or_detailaddr;
		this.or_content = or_content;
		this.or_payment = or_payment;
	}

	public String getOr_num() {
		return or_num;
	}

	public void setOr_num(String or_num) {
		this.or_num = or_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOr_name() {
		return or_name;
	}

	public void setOr_name(String or_name) {
		this.or_name = or_name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOr_size() {
		return or_size;
	}

	public void setOr_size(String or_size) {
		this.or_size = or_size;
	}

	public Date getOr_date() {
		return or_date;
	}

	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}

	public String getOr_phone() {
		return or_phone;
	}

	public void setOr_phone(String or_phone) {
		this.or_phone = or_phone;
	}

	public String getOr_postcode() {
		return or_postcode;
	}

	public void setOr_postcode(String or_postcode) {
		this.or_postcode = or_postcode;
	}

	public String getOr_roadaddr() {
		return or_roadaddr;
	}

	public void setOr_roadaddr(String or_roadaddr) {
		this.or_roadaddr = or_roadaddr;
	}

	public String getOr_detailaddr() {
		return or_detailaddr;
	}

	public void setOr_detailaddr(String or_detailaddr) {
		this.or_detailaddr = or_detailaddr;
	}

	public String getOr_content() {
		return or_content;
	}

	public void setOr_content(String or_content) {
		this.or_content = or_content;
	}

	public String getOr_payment() {
		return or_payment;
	}

	public void setOr_payment(String or_payment) {
		this.or_payment = or_payment;
	}

	@Override
	public String toString() {
		return "OrderDTO [or_num=" + or_num + ", id=" + id + ", or_name=" + or_name + ", count=" + count + ", price="
				+ price + ", totalPrice=" + totalPrice + ", or_size=" + or_size + ", or_date=" + or_date + ", or_phone="
				+ or_phone + ", or_postcode=" + or_postcode + ", or_roadaddr=" + or_roadaddr + ", or_detailaddr="
				+ or_detailaddr + ", or_content=" + or_content + ", or_payment=" + or_payment + "]";
	}

	

	
	
}
