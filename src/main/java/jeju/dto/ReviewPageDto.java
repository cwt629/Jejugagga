package jeju.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewPageDto {
    private int currentPage; // 현재 페이지 번호
    private int totalPages; // 전체 페이지 수
    private int pageSize; // 페이지당 항목 수
}
