package com.project.heyyo.content.model;

public class Content {
	private int id; // 사용자 고유 아이디값
	private int num; // 게시글 순번
	private String subject; // 게시글 제목
	private String talent; // 필요 또는 요청 재능
	private String c_date; // 글작성일
	private String s_day; // 요청일
	private String address; // 주소
	private String location; // 좌표
	private int personnel; // 필요인원
	private String gender; // 성별
	private String content; // 본문 내용
	private String closed; // 마감 구분
	private String type; // 게시글 구분

	public Content() {
		super();
	}

	public Content(int id, int num, String subject, String talent,
			String c_date, String s_day, String address, String location,
			int personnel, String gender, String content, String closed,
			String type) {
		super();
		this.id = id;
		this.num = num;
		this.subject = subject;
		this.talent = talent;
		this.c_date = c_date;
		this.s_day = s_day;
		this.address = address;
		this.location = location;
		this.personnel = personnel;
		this.gender = gender;
		this.content = content;
		this.closed = closed;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTalent() {
		return talent;
	}

	public void setTalent(String talent) {
		this.talent = talent;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public String getS_day() {
		return s_day;
	}

	public void setS_day(String s_day) {
		this.s_day = s_day;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getClosed() {
		return closed;
	}

	public void setClosed(String closed) {
		this.closed = closed;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
