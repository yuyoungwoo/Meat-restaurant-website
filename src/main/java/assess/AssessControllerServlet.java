package assess;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AssessControllerServlet")
public class AssessControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String memberUserId = request.getParameter("memberUserId");

        if ("like".equals(action) || "dislike".equals(action)) {
            // 여기에서 AssessDAO를 활용하여 좋아요 또는 싫어요 처리 로직을 작성합니다.
            // 해당 사용자(memberUserId)의 카운트를 업데이트하고 성공 여부에 따라 응답합니다.
            boolean success = updateAssessCount(memberUserId, action);
            if (success) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error");
            }
        } else {
            response.getWriter().write("invalid action");
        }
    }

    private boolean updateAssessCount(String memberUserId, String action) {
        // 여기에서 AssessDAO를 사용하여 좋아요 또는 싫어요 카운트를 업데이트하는 로직을 작성합니다.
        // 반환값으로 성공 여부를 전달합니다.
        // 이 부분은 AssessDAO에 해당 로직이 구현되어 있어야 합니다.
        // 성공 시 true, 실패 시 false를 반환하도록 작성하세요.
        // AssessDAO의 메서드명 및 사용 방법은 실제 DAO에 따라 달라질 수 있습니다.
        AssessDAO assessDAO = AssessDAO.getInstance();
        int updatedCount = assessDAO.updateAssessCount(memberUserId, action);
        return updatedCount > 0; // 성공 시 1 이상의 값이 반환될 것으로 가정
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
