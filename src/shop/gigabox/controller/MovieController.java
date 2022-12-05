package shop.gigabox.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shop.gigabox.service.MVService;
import shop.gigabox.service.MVServiceImpl;
import shop.gigabox.vo.MVVO;

/**
 * Servlet implementation class MovieController
 */
@WebServlet("/MovieController")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String realPath = request.getServletContext().getRealPath("/upload/movie/images");
		
		MultipartRequest mr = null;
		String cmd = request.getParameter("cmd");
		MVVO mvvo = null;
		MVService mvservice = new MVServiceImpl();
		
		if (cmd == null) {
			mr = new MultipartRequest(
					request,
					realPath,
					1024*1024*10,
					"utf-8",
					new DefaultFileRenamePolicy());
			cmd = mr.getParameter("cmd");
		}
		
		boolean forwardCheck = false;
		String path = "";
		
		switch (cmd) {
		case "insert":
			mvvo = new MVVO();
			mvvo.setTitle(mr.getParameter("title"));
			mvvo.setTitle_eng(mr.getParameter("title_eng"));
			mvvo.setSummary(mr.getParameter("summary"));
			
			if (mr.getFile("image_main") != null) {
				mvvo.setMv_image_main(mr.getFilesystemName("image_main"));
			} else {
				mvvo.setMv_image_main("");
			}
			
			if (mr.getFile("image_1") != null) {
				mvvo.setMv_image_1(mr.getFilesystemName("image_1"));
			} else {
				mvvo.setMv_image_1("");
			}
			
			if (mr.getFile("image_2") != null) {
				mvvo.setMv_image_2(mr.getFilesystemName("image_2"));
			} else {
				mvvo.setMv_image_2("");
			}
			
			mvservice.insert(mvvo);
			path = "pages/main.jsp";
			break;
		}
		
		if(forwardCheck) {
			request.getRequestDispatcher(path).forward(request, response);
		}else {
			response.sendRedirect(path);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
