package com.vo;

public class DeptVO {
	private int	   deptno =0;// 
	private String  dname  ="";// 
	private String  loc    ="";// 
	public DeptVO(){
		 
	}
	public DeptVO(int deptno, String dname, String loc){
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}
	//getter�޼ҵ� - �б�
	public int getDeptno() {
		return deptno;
	}
	//setter�޼ҵ� - ����, ����
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}

}
