package com.bbty.session;

import java.util.List;

public class GoodTypeTree {

	private String text;
	
	private String tags;
	
	/**
	 * 0-goodType
	 * 1-goodInfo
	 */
	private String type;
	
	/**
	 * 1-有子类别或者子商品
	 * 0-无
	 */
	private String isLeaf;
	
	private List<GoodTypeTree> nodes;
	
	public GoodTypeTree() {
		super();
	}
	
	public String getIsLeaf() {
		return isLeaf;
	}

	public GoodTypeTree(String text, String tags, String type, String isLeaf, List<GoodTypeTree> nodes) {
		super();
		this.text = text;
		this.tags = tags;
		this.type = type;
		this.isLeaf = isLeaf;
		this.nodes = nodes;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
