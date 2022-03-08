package com.group7.MGMN.dao;

import com.group7.MGMN.model.PetVO;

public interface IPetDAO {
	void insertPetInfo(PetVO petVO);		// 펫 정보 등록
	void updatePetInfo(PetVO petVO);		// 펫 정보 수정
	void deletePetInfo(int petNo);			// 펫 정보 삭제
	PetVO detailPetInfo(int petNo);			// 펫 정보 조회
}
