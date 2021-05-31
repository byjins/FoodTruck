package com.java.db.dto;

public class PaginationDto {

	private int listSize = 5; // 초기값으로 목록개수를 5으로 셋팅
	private int rangeSize = 10; // 초기값으로 페이지범위를 10으로 셋팅
	private int page; //현재 페이지 번호
	private int range; //각 페이지 범위 시작 번호
	private int listCnt; //전체 개시물 개수
	private int pageCnt; //전체 페이지 범위 개수
	private int startPage; //각 페이지 범위 시작 번호
	private int startList; 
	private int endPage; //각 페이지 범위의 끝 번호
	private int test;
	private boolean prev; //이전 페이지 여부
	private boolean next; //다음 페이지 여부

	
	public PaginationDto() {
		
	}

	//page는 현재 페이지, range 현재 페이지 범위 정보, listCnt 게시물의 총 갯수
	public void pageInfo(int page, int range, int listCnt) {
		
		
		this.page = (page - 1) * 5;
		this.range = range;
		this.listCnt = listCnt;
		
		
		// 전체 페이지수 :  전체 개시물 개수 / 한 페이지당 목록 개수 = 전체 페이지 개수
		this.pageCnt = (int) Math.ceil((double)listCnt /(double)listSize);
		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;
		// 끝 페이지
		this.endPage = range * rangeSize;
		// 게시판 시작번호
		this.startList = (page - 1) * listSize;
		
		//이전 버튼 상태 = 1번 페이지에서는 이전 버튼 없어도 
		//되서 페이지 범위가 1이면 이전
		//버튼의 상태가 false이고 2번 페이지 부터는 true
		this.prev = range == 1 ? false : true;
		
		// 다음 버튼 상태 = 현재 페이지의 마지막 페이지 번호 (현재 3페이지면 마지막 페이지가 10)
		//전체 페이지 개수 보다 크면 다음버튼 활성
		this.next = endPage > pageCnt ? false : true;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
			
		
		}
		
	}

	
	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getRangeSize() {
		return rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getStartList() {
		return startList;
	}

}
