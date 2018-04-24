package com.project.payroll.pojo;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

@Entity
public class Employee {

	private int id;
    
	private String campaign;
	
	
	@NotNull(message = "is required")
	private int sales;

	@NotNull(message = "is required")
	private double basicSalary;

	@NotNull(message = "is required")
	private int unpaidDays;

	@NotNull(message = "is required")
	private double blud;

	@NotNull(message = "is required")
	private int girnLate;

	@NotNull(message = "is required")
	private double commission;

	@NotNull(message = "is required")
	private double grossPay;

	@NotNull(message = "is required")
	private double payePlus;

	@NotNull(message = "is required")
	private double uif;

	@NotNull(message = "is required")
	private double netSalary;
    
	public Employee(int sales, double basicSalary, int unpaidDays, double blud, int girnLate, double commission,
			double grossPay, double payePlus, double uif, double netSalary) {
		this.sales = sales;
		this.basicSalary = basicSalary;
		this.unpaidDays = unpaidDays;
		this.blud = blud;
		this.girnLate = girnLate;
		this.commission = commission;
		this.grossPay = grossPay;
		this.payePlus = payePlus;
		this.uif = uif;
		this.netSalary = netSalary;
	}

	public Employee() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public double getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public int getUnpaidDays() {
		return unpaidDays;
	}

	public void setUnpaidDays(int unpaidDays) {
		this.unpaidDays = unpaidDays;
	}

	public double getBlud() {
		return blud;
	}

	public void setBlud(double blud) {
		this.blud = blud;
	}

	public int getGirnLate() {
		return girnLate;
	}

	public void setGirnLate(int girnLate) {
		this.girnLate = girnLate;
	}

	public double getCommission() {
		return commission;
	}

	public void setCommission(double commission) {
		this.commission = commission;
	}

	public double getGrossPay() {
		return grossPay;
	}

	public void setGrossPay(double grossPay) {
		this.grossPay = grossPay;
	}

	public double getPayePlus() {
		return payePlus;
	}

	public void setPayePlus(double payePlus) {
		this.payePlus = payePlus;
	}

	public double getUif() {
		return uif;
	}

	public void setUif(double uif) {
		this.uif = uif;
	}

	public double getNetSalary() {
		return netSalary;
	}

	public void setNetSalary(double netSalary) {
		this.netSalary = netSalary;
	}

	public String getCampaign() {
		return campaign;
	}

	public void setCampaign(String campaign) {
		this.campaign = campaign;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", sales=" + sales + ", basicSalary=" + basicSalary + ", unpaidDays=" + unpaidDays
				+ ", blud=" + blud + ", girnLate=" + girnLate + ", commission=" + commission + ", grossPay=" + grossPay
				+ ", payePlus=" + payePlus + ", uif=" + uif + ", netSalary=" + netSalary + "]";
	}

}
