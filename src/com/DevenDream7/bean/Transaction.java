package com.DevenDream7.bean;

import java.util.Date;

public class Transaction {
	
	private String uid;
	private String depositedBy;
	private double amount;
	private Date date;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getDepositedBy() {
		return depositedBy;
	}
	public void setDepositedBy(String depositedBy) {
		this.depositedBy = depositedBy;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Transaction(String uid, String depositedBy, double amount, Date date) {
		super();
		this.uid = uid;
		this.depositedBy = depositedBy;
		this.amount = amount;
		this.date = date;
	}
	
	
	

}
