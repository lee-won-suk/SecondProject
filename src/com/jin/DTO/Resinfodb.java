package com.jin.DTO;

//식당 정보(이원석) 
public class Resinfodb {

 // 식당이름 
 private String resname;

 // x좌표 
 private Float x;

 // y좌표 
 private Float y;

 // 업소인증메뉴 
 private String menuname;

 // 메뉴키워드 
 private String menukeyword;

 // 음식종류 
 private String genre;

 // 제휴식당여부 
 private Integer partnerres;

 // 주소 
 private String address;

 public String getResname() {
     return resname;
 }

 public void setResname(String resname) {
     this.resname = resname;
 }

 public Float getX() {
     return x;
 }

 public void setX(Float x) {
     this.x = x;
 }

 public Float getY() {
     return y;
 }

 public void setY(Float y) {
     this.y = y;
 }

 public String getMenuname() {
     return menuname;
 }

 public void setMenuname(String menuname) {
     this.menuname = menuname;
 }

 public String getMenukeyword() {
     return menukeyword;
 }

 public void setMenukeyword(String menukeyword) {
     this.menukeyword = menukeyword;
 }

 public String getGenre() {
     return genre;
 }

 public void setGenre(String genre) {
     this.genre = genre;
 }

 public Integer getPartnerres() {
     return partnerres;
 }

 public void setPartnerres(Integer partnerres) {
     this.partnerres = partnerres;
 }

 public String getAddress() {
     return address;
 }

 public void setAddress(String address) {
     this.address = address;
 }


 
 
}
