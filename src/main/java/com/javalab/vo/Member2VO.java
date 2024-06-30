package com.javalab.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 과제
 * 회원 관련 VO
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member2VO {
	private String mno;
	private String memberId;
	private String password;
	private String name;
	private String email;
}
