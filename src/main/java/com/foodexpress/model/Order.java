package com.foodexpress.model;

import java.sql.Timestamp;

public class Order {

	private int orderId;
	private int userId;
	private int restaurantId;
	private String restaurantName;
	private double totalAmount;
	private String status;
	private String paymentMethod;
	private Timestamp orderDate;
	
	
	
	
	private String fullName;
	private String phone;
	private String address;
	private String city;
	private String pincode;

	public Order() {
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	
	
	
	public String getFullName() {
	    return fullName;
	}

	public void setFullName(String fullName) {
	    this.fullName = fullName;
	}

	public String getPhone() {
	    return phone;
	}

	public void setPhone(String phone) {
	    this.phone = phone;
	}

	public String getAddress() {
	    return address;
	}

	public void setAddress(String address) {
	    this.address = address;
	}

	public String getCity() {
	    return city;
	}

	public void setCity(String city) {
	    this.city = city;
	}

	public String getPincode() {
	    return pincode;
	}

	public void setPincode(String pincode) {
	    this.pincode = pincode;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}






















