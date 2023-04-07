package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.so.domain.ReturnDetail;
import com.yeonoo.so.repository.ReturnDetailRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReturnDetailServiceImpl implements ReturnDetailService {

	@Autowired
	ReturnDetailRepository returnDetailRepository;
	
	//입고번호로 세부항목 조회
	public List<ReturnDetail> getReturnDetail(String returnNumber) throws Exception{
		return returnDetailRepository.getReturnDetail(returnNumber);
		
	}
	
	//저장
	public void insertDetailAdd(List<Map<String, Object>> createRows) throws Exception {
        log.info("Saving create rows: {}", createRows);
    	for (Map<String, Object> row : createRows) {
    		returnDetailRepository.insertDetailAdd(row);
        }
    }
    
    //수정
    public void updateDetailAdd(List<Map<String, Object>> updateRows) throws Exception {
        log.info("Saving update rows: {}", updateRows);
    	for (Map<String, Object> row : updateRows) {
    		returnDetailRepository.updateDetailAdd(row);
        }
    }
    
    //삭제
    public void deleteReturnDetail(List<Integer> sorder) {
    	log.info("Deleting return details with sorders: {}", sorder);
        returnDetailRepository.deleteReturnDetail(sorder);
    }
	
}
