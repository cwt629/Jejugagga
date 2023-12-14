package jeju.boardfree_utils;

import lombok.Getter;

@Getter
public class BoardFreePagingCriteria {
    private int page;
    private int perPageNum;

    /* 페이징 처리 0이 1부터 시작, 5번부터 끊기*/
    public BoardFreePagingCriteria() {
        this.page = 1;
        this.perPageNum = 5;
    }

    /* 0을 넘기면 1로 돼서 페이지로 등록이 된다. */
    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 20) {
            this.perPageNum = 5;
            return;
        }
        this.perPageNum = perPageNum;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }
}

