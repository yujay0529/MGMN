package com.group7.MGMN.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.dao.IPetDAO;
import com.group7.MGMN.model.PetVO;

@Service
public class PetService implements IPetService {
	
	@Autowired
	@Qualifier("IPetDAO")
	IPetDAO dao;

	@Override
	public void insertPetInfo(PetVO petVO) {
		dao.insertPetInfo(petVO);

	}

	@Override
	public void updatePetInfo(PetVO petVO) {
		dao.updatePetInfo(petVO);

	}

	@Override
	public void deletePetInfo(int petNo) {
		dao.deletePetInfo(petNo);

	}

	@Override
	public PetVO detailPetInfo(int petNo) {
		return dao.detailPetInfo(petNo);
	}

}
