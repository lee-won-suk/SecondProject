package com.jin.DTO;

//별점(이원석) 
public class Stardb {

 // id 
 private String id;

 // 식당명 
 private String resname;

 // 별점 
 private Float starvalue;

 // 최종방문일 
 private String lastvisit;

 // 사용자칼로리 
 private Integer kcallimit;

 // 사용자예산 
 private Integer budget;

 // 메뉴키워드 
 private String menukeyword;

 public String getId() {
     return id;
 }

 public void setId(String id) {
     this.id = id;
 }

 public String getResname() {
     return resname;
 }

 public void setResname(String resname) {
     this.resname = resname;
 }

 public Float getStarvalue() {
     return starvalue;
 }

 public void setStarvalue(Float starvalue) {
     this.starvalue = starvalue;
 }

 public String getLastvisit() {
     return lastvisit;
 }

 public void setLastvisit(String lastvisit) {
     this.lastvisit = lastvisit;
 }

 public Integer getKcallimit() {
     return kcallimit;
 }

 public void setKcallimit(Integer kcallimit) {
     this.kcallimit = kcallimit;
 }

 public Integer getBudget() {
     return budget;
 }

 public void setBudget(Integer budget) {
     this.budget = budget;
 }

 public String getMenukeyword() {
     return menukeyword;
 }

 public void setMenukeyword(String menukeyword) {
     this.menukeyword = menukeyword;
 }


}
