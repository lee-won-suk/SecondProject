package com.jin.DTO;

//����� ������ �Ĵ�(�̿���) 
public class Userdietdb {

 // id 
 private String id;

 // ���� 
 private String day;

 // �ð��� 
 private String time;

 // �޴�Ű���� 
 private String menukeyword;

 // �Ĵ�1 
 private String resname1;

 // �Ĵ�2 
 private String resname2;

 // �Ĵ�3 
 private String resname3;

 // �޴�Ű���� Į�θ� 
 private Integer menukeywordkcal;

 // �޴�Ű���忹�� 
 private Integer menukeywordbudget;

 public String getId() {
     return id;
 }

 public void setId(String id) {
     this.id = id;
 }

 public String getDay() {
     return day;
 }

 public void setDay(String day) {
     this.day = day;
 }

 public String getTime() {
     return time;
 }

 public void setTime(String time) {
     this.time = time;
 }

 public String getMenukeyword() {
     return menukeyword;
 }

 public void setMenukeyword(String menukeyword) {
     this.menukeyword = menukeyword;
 }

 public String getResname1() {
     return resname1;
 }

 public void setResname1(String resname1) {
     this.resname1 = resname1;
 }

 public String getResname2() {
     return resname2;
 }

 public void setResname2(String resname2) {
     this.resname2 = resname2;
 }

 public String getResname3() {
     return resname3;
 }

 public void setResname3(String resname3) {
     this.resname3 = resname3;
 }

 public Integer getMenukeywordkcal() {
     return menukeywordkcal;
 }

 public void setMenukeywordkcal(Integer menukeywordkcal) {
     this.menukeywordkcal = menukeywordkcal;
 }

 public Integer getMenukeywordbudget() {
     return menukeywordbudget;
 }

 public void setMenukeywordbudget(Integer menukeywordbudget) {
     this.menukeywordbudget = menukeywordbudget;
 }

}