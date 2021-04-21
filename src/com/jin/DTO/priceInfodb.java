package com.jin.DTO;

//상품정보(주영서) 
public class priceInfodb {

 // 상품명 
 private String prizename;

 // 상품가격 
 private Integer prizeprice;

 // 상품이미지 
 private String prizeimage;

 public String getPrizename() {
     return prizename;
 }

 public void setPrizename(String prizename) {
     this.prizename = prizename;
 }

 public Integer getPrizeprice() {
     return prizeprice;
 }

 public void setPrizeprice(Integer prizeprice) {
     this.prizeprice = prizeprice;
 }

 public String getPrizeimage() {
     return prizeimage;
 	}
}