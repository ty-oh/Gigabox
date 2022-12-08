package shop.gigabox.controller;

import java.io.IOException;
import java.util.ArrayList;
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
		int result;
		boolean forwardCheck = false;
		
		RService rservice = new RServiceImpl();
		List<RVO> rList = null;
		RVO rvo = null;
		int r_idx;

		MVService mvservice = new MVServiceImpl();
		List<MVVO> mvList = null;
		MVVO mvvo = null;
		int mv_idx;
		
		MVO mvo = null;
		int m_idx;
		
		switch(cmd) {
		case "review_main_page":
			m_idx = ((MVO)session.getAttribute("user")).getM_idx();
			rList = rservice.getReviewListByUser(m_idx);
			
			mvList = new ArrayList<MVVO>();
			for (RVO r : rList) {
				mvvo = mvservice.getMovieInfo(r.getMv_idx());
				mvList.add(mvvo);
			}
			
			request.setAttribute("mvList", mvList);
			request.setAttribute("rList", rList);
			forwardCheck = true;
			path="pages/review_list.jsp";
			break;
		
		case "review_insert_page":
			mv_idx = Integer.parseInt(request.getParameter("mv_idx"));
			m_idx = ((MVO)session.getAttribute("user")).getM_idx();
			mvvo = (MVVO)mvservice.getMovieInfo(mv_idx);
			
			rvo = new RVO();
			rvo.setMv_idx(mv_idx);
			rvo.setM_idx(m_idx);
			result = rservice.checkReview(rvo);
			
			if (result == 0) {
				session.setAttribute("mv", mvvo);
				path="pages/review_insert_page.jsp";
				
			} else {
				path="pages/review_fail.jsp?msg=not_empty";
			}
			break;
		
		case "review_update_page":
			r_idx = Integer.parseInt(request.getParameter("r_idx"));
			
			rvo = rservice.getReviewByIdx(r_idx);
			mvvo = mvservice.getMovieInfo(rvo.getMv_idx());
			
			request.setAttribute("r", rvo);
			request.setAttribute("mv", mvvo);
			forwardCheck=true;
			path="pages/review_update_page.jsp";
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
			path="/Gigabox/ReviewController?cmd=review_main_page";
			break;
		
		case "update_review":
			rvo = new RVO();
			rvo.setR_idx(Integer.parseInt(request.getParameter("r_idx")));
			rvo.setR_content(request.getParameter("r_content"));
			rvo.setR_score(Integer.parseInt(request.getParameter("r_score")));
			
			rservice.updateReview(rvo);
			path="/Gigabox/ReviewController?cmd=review_main_page";
			break;
		
		case "delete_review":
			r_idx = Integer.parseInt(request.getParameter("r_idx"));
			
			rservice.deleteReview(r_idx);
			path="/Gigabox/ReviewController?cmd=review_main_page";
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
