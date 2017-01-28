package com.bbty.session;

public class SelectJson {

	private String id;
	private String text;
	
	public SelectJson() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SelectJson(String id, String text) {
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
