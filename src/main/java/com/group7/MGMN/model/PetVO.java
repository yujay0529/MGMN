package com.group7.MGMN.model;

public class PetVO {
	private int petNo;
	private String petName;
	private String petBreed;
	private int petAge;
	private String petGender;
	private String userId;
	
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetBreed() {
		return petBreed;
	}
	public void setPetBreed(String petBreed) {
		this.petBreed = petBreed;
	}
	public int getPetAge() {
		return petAge;
	}
	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "PetVO [petNo=" + petNo + ", petName=" + petName + ", petBreed=" + petBreed + ", petAge=" + petAge
				+ ", petGender=" + petGender + ", userId=" + userId + "]";
	}
	
	

}
