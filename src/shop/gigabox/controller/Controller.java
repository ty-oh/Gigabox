package shop.gigabox.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.gigabox.service.MService;
import shop.gigabox.service.MServiceImpl;
import shop.gigabox.service.MVService;
import shop.gigabox.service.MVServiceImpl;
import shop.gigabox.vo.MVO;
import shop.gigabox.vo.MVVO;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String cmd = request.getParameter("cmd");
		String path = "";
		
		boolean forwardCheck = false;
		int result = 0;
		
		MService mservice = new MServiceImpl();
		MVO mvo = null;
		
		MVService mvservice = new MVServiceImpl();
		List<MVVO> mvList = null;
		int mv_idx = 0;
		MVVO mvvo = null;
		
		switch (cmd) {
		case "login_page":
			path="pages/login_page.jsp";
			break;
		
		case "join_page":
			path="pages/join_page.jsp";
			break;
			
		case "main_page":
			mvList = mvservice.getRecentListFour();
			request.setAttribute("mvList", mvList);
			
			forwardCheck = true;
			path="pages/main.jsp";
			break;

		case "movie_page":
			mv_idx = Integer.parseInt(request.getParameter("mv_idx"));
			mvvo = mvservice.getMovieInfo(mv_idx);
			request.setAttribute("mvvo", mvvo);
			
			forwardCheck = true;
			path="pages/movie_page.jsp";
			break;
			
		case "movie_list":
			mvList = mvservice.getMovieList();
			request.setAttribute("mvList", mvList);
			
			forwardCheck = true;
			path="pages/movie_list.jsp";
			break;
			
		case "login":
			mvo = new MVO();
			mvo.setM_id(request.getParameter("id"));
			mvo.setM_pw(request.getParameter("pw"));
			
			MVO user = mservice.login(mvo);
			if (user != null) {
				session.setAttribute("user", user);
				path="/Gigabox/Controller?cmd=main_page";
				
			} else {
				path="pages/login_fail.jsp";
			}
			break;
			
		case "logout":
			session.removeAttribute("user");
			path="/Gigabox/Controller?cmd=main_page";
			break;
			
		case "join":
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");				
			String email = request.getParameter("email");
			
			mvo = new MVO();
			mvo.setM_id(id);
			mvo.setM_pw(pw);
			mvo.setM_name(name);
			mvo.setM_phone(phone);
			mvo.setM_email(email);
			
			result = mservice.joinMember(mvo);
			path="/Gigabox/Controller?cmd=login_page";
			break;
		}
		
		if(forwardCheck) {
			request.getRequestDispatcher(path).forward(request, response);
		} else {
			response.sendRedirect(path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
