package Dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Review implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2691316226657416366L;
	
	
	private Integer id;
	
	private String formUserId;
	
	private String formUserName;
	
	private String toUserId;
	
	private String toUserName;
	
	private Integer parentId;
	
	private String content;
	
	private Date createTime;
	
	private String createTimeStr;
	
	private List<Review> childList;

	public Review() {
		
	}
	
	
	public Review(Integer id,  String formUserName,  String toUserName,
			 String content, String createTimeStr) {
		super();
		this.id = id;
		this.formUserName = formUserName;
		this.toUserName = toUserName;
		this.content = content;
		this.createTimeStr = createTimeStr;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFormUserId() {
		return formUserId;
	}

	public void setFormUserId(String formUserId) {
		this.formUserId = formUserId;
	}

	public String getFormUserName() {
		return formUserName;
	}

	public void setFormUserName(String formUserName) {
		this.formUserName = formUserName;
	}

	public String getToUserId() {
		return toUserId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Review> getChildList() {
		return childList;
	}

	public void setChildList(List<Review> childList) {
		this.childList = childList;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	

	public String getCreateTimeStr() {
		return createTimeStr;
	}

	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", formUserId=" + formUserId + ", formUserName=" + formUserName + ", toUserId="
				+ toUserId + ", toUserName=" + toUserName + ", parentId=" + parentId + ", content=" + content
				+ ", createTime=" + createTime + ", childList=" + childList + "]";
	}
	
	

	
	
	
	
	
  
}
