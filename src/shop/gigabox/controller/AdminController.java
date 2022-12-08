package shop.gigabox.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.sql.DATE;
import shop.gigabox.service.MVService;
import shop.gigabox.service.MVServiceImpl;
import shop.gigabox.service.SCService;
import shop.gigabox.service.SCServiceImpl;
import shop.gigabox.service.SeatService;
import shop.gigabox.service.SeatServiceImpl;
import shop.gigabox.service.THService;
import shop.gigabox.service.THServiceImpl;
import shop.gigabox.vo.MVVO;
import shop.gigabox.vo.SCVO;
import shop.gigabox.vo.SEATVO;
import shop.gigabox.vo.THVO;

/**
 * Servlet implementation class MovieController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String realPath = request.getServletContext().getRealPath("/upload/movie/images");
		
		MultipartRequest mr = null;
		String cmd = request.getParameter("cmd");
		int result;
		MVVO mvvo = null;
		MVService mvservice = new MVServiceImpl();
		
		THVO thvo = null;
		THService thservice = new THServiceImpl();
		
		SEATVO seatvo = null;
		SeatService seatservice = new SeatServiceImpl();
		
		SCVO scvo = null;
		SCService scservice = new SCServiceImpl();
		
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
		case "movie_insert_page":
			path="pages/admin/movie_insert_page.jsp";
			break;
			
		case "theater_insert_page":
			path="pages/admin/theater_insert_page.jsp";
			break;
			
		case "schedule_insert_page":
			List<MVVO> mvList = mvservice.getMovieList();
			request.setAttribute("mvList", mvList);
			
			List<THVO> thList = thservice.getTheaterList();
			request.setAttribute("thList", thList);
			
			forwardCheck = true;
			path="pages/admin/schedule_insert_page.jsp";
			break;
		
		case "insert_movie":
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
			
		case "insert_theater":
			String th_name= request.getParameter("th_name"); 
			String[] seat = request.getParameterValues("seat");
			int price = Integer.parseInt(request.getParameter("price"));
			
			thvo = new THVO();
			thvo.setTh_name(th_name);
			
			result = thservice.insert(thvo);
			if (result > 0) {
				thvo = thservice.selectByName(th_name);
			}
			
			seatvo = new SEATVO();
			for (String s : seat) {
				String[] rowcol = s.split(",");
				seatvo.setTh_idx(thvo.getTh_idx());
				seatvo.setTh_row(rowcol[0]);
				seatvo.setTh_col(Integer.parseInt(rowcol[1]));
				seatvo.setPrice(price);
				seatservice.insert(seatvo);
			}
			
			path = "pages/admin/theater_insert_done.jsp";
			break;
			
		case "insert_schedule":
			scvo = new SCVO();
			scvo.setScreen_date(request.getParameter("sc_date") + " " + request.getParameter("sc_time"));
			scvo.setMv_idx(Integer.parseInt(request.getParameter("mv_idx")));
			scvo.setTh_idx(Integer.parseInt(request.getParameter("th_idx")));
			
			List<SEATVO> seatList = seatservice.getSeatList(scvo.getTh_idx());
			System.out.println(seatList.size());
			for (SEATVO s : seatList) {
				System.out.println(s.getTh_col());
				System.out.println(s.getTh_row());
				scvo.setTh_col(s.getTh_col());
				scvo.setTh_row(s.getTh_row());
				scservice.insertSchedule(scvo);
			}
			
			path = "/Gigabox/AdminController?cmd=schedule_insert_page";
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
