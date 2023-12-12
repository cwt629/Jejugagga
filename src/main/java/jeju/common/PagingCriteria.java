package jeju.common;

import lombok.Getter;

@Getter
public class PagingCriteria {
    private int page;
    private int perPageNum;

    /* 페이징 처리 0이 1부터 시작, 5번부터 끊기*/
    public PagingCriteria() {
        this.page = 0;
        this.perPageNum = 5;
    }

    /* */
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

