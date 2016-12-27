package com.bbty.session;

public class RoleJson {

	private String id;
	private String text;
	
	public RoleJson() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RoleJson(String id, String text) {
		super();
		this.id = id;
		this.text = text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
