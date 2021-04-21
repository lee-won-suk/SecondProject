package com.jin.DTO;

public class JoinMember {
	// 아이디 
	private String id;
	
	// 비밀번호 
    private String pw;

    // 전화번호 
    private Integer tel;

    // 요일 
    private String userday;

    // 시간대 
    private String usertime;

    // 목표칼로리 
    private Integer kcallimit;

    // 예산 
    private Integer budget;

    // 선호장르 
    private String genre;

    // 레벨 
    private Integer lvl;

    // 포인트 
    private Integer point;

    // 경험치 
    private Integer exp;

    // 연령대 
    private String age;

    // 성별 
    private String gender;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Integer getTel() {
		return tel;
	}

	public void setTel(Integer tel) {
		this.tel = tel;
	}

	public String getUserday() {
		return userday;
	}

	public void setUserday(String userday) {
		this.userday = userday;
	}

	public String getUsertime() {
		return usertime;
	}

	public void setUsertime(String usertime) {
		this.usertime = usertime;
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

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Integer getLvl() {
		return lvl;
	}

	public void setLvl(Integer lvl) {
		this.lvl = lvl;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getExp() {
		return exp;
	}

	public void setExp(Integer exp) {
		this.exp = exp;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
    
}
