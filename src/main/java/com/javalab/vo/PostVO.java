package com.javalab.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 과제
 * 게시판 관련 VO
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PostVO {
	private String pno;
	private String title;
	private String content;
	private String memberId2;
	private int hitNo;
	private String regDate;
}
