package jeju.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewPageDto {
    private int currentPage;
    private int totalPages;
    private int pageSize;
}
