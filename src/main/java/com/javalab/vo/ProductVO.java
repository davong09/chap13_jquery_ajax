package com.javalab.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/**
 * 상품 클래스
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@ToString
public class ProductVO {
	private String productId;
	private String productName;
	private String price;
}
