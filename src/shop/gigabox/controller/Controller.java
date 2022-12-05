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
		String realPath = request.getServletContext().getRealPath("/upload/movie/images");
		session.setAttribute("realPath", realPath);
		
		String cmd = request.getParameter("cmd");
		String path = "";

		boolean forwardCheck = false;
		
		MVService mvservice = new MVServiceImpl();
		List<MVVO> mvList = new ArrayList<MVVO>();
		
		switch (cmd) {
		case "mainPage":
			mvList = mvservice.getRecentListFour();
			request.setAttribute("mvList", mvList);
			
			forwardCheck = true;
			path="pages/main.jsp";
			break;

		default:
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
