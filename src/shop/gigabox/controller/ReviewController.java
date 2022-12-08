package shop.gigabox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.gigabox.service.MVService;
import shop.gigabox.service.MVServiceImpl;
import shop.gigabox.service.RService;
import shop.gigabox.service.RServiceImpl;
import shop.gigabox.vo.MVO;
import shop.gigabox.vo.MVVO;
import shop.gigabox.vo.RVO;

@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String cmd = request.getParameter("cmd");
		String path = "";
		boolean forwardCheck = false;
		
		RService rservice = new RServiceImpl();
		List<RVO> rList = null;
		RVO rvo = null;

		MVService mvservice = new MVServiceImpl();
		List<MVVO> mvList = null;
		MVVO mvvo = null;
		int mv_idx;
		
		MVO mvo = null;
		int m_idx;
		
		switch(cmd) {
		case "review_insert_page":
			mv_idx = Integer.parseInt(request.getParameter("mv_idx"));
			mvvo = (MVVO)mvservice.getMovieInfo(mv_idx);
			
			session.setAttribute("mv", mvvo);
			path="pages/review_insert_page.jsp";
			break;
			
		case "insert_review":
			mv_idx = ((MVVO)session.getAttribute("mv")).getMv_idx();
			m_idx = ((MVO)session.getAttribute("user")).getM_idx();
			
			rvo = new RVO();
			rvo.setM_idx(m_idx);
			rvo.setMv_idx(mv_idx);
			rvo.setR_content(request.getParameter("r_content"));
			rvo.setR_score(Integer.parseInt(request.getParameter("r_score")));
			
			rservice.insertReview(rvo);
			break;
		}
		
		if (forwardCheck) {
			request.getRequestDispatcher(path).forward(request, response);
		} else {
			response.sendRedirect(path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
