package com.bbty.session;

import java.util.List;

public class GoodTypeTree {

	private String text;
	private String tags;
	private List<GoodTypeTree> nodes;
	
	public GoodTypeTree() {
		super();
	}
	
	public GoodTypeTree(String text, String tags, List<GoodTypeTree> nodes) {
		super();
		this.text = text;
		this.tags = tags;
		this.nodes = nodes;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<GoodTypeTree> getNodes() {
		return nodes;
	}
	public void setNodes(List<GoodTypeTree> nodes) {
		this.nodes = nodes;
	}
	
	
}
