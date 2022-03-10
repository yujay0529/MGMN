package com.group7.MGMN.service;

import com.group7.MGMN.model.PetVO;

public interface IPetService {
	void insertPetInfo(PetVO petVO);		// 펫 정보 등록
	void updatePetInfo(PetVO petVO);		// 펫 정보 수정
	void deletePetInfo(int petNo);			// 펫 정보 삭제
	PetVO detailPetInfo(String userId);			// 펫 정보 조회
}
