package com.javalab.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 응답 객체
 * - 데이터베이스의 처리 결과를 담아서 클라이언트에게 제공된다.
 * - isExist : 처리 결과 true/false
 * - msg : 처리 결과, 예) 아이디가 존재합니다. 등
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@ToString
public class ResponseVO {
	private boolean isExist;
	private String msg;
}
