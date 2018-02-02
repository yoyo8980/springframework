package com.example.demo.entity;

public class GuestVo {

	private String id,name;
	
	public GuestVo() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "GuestVo [id=" + id + ", name=" + name + "]";
	}

	public GuestVo(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
}
