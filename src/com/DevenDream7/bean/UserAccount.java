package com.DevenDream7.bean;

public class UserAccount {
Double balance;
int level;

public UserAccount() {
	balance = 0.0;
	level = 0;
}

public UserAccount(Double balance, int level) {
	super();
	this.balance = balance;
	this.level = level;
}

public Double getBalance() {
	return balance;
}

public void setBalance(Double balance) {
	this.balance = balance;
}

public int getLevel() {
	return level;
}

public void setLevel(int level) {
	this.level = level;
}

@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}

@Override
	public String toString() {
		return "[Balance : "+this.getBalance()+" , Level :"+this.getLevel()+"]";
	}
}
