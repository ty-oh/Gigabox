package shop.gigabox.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.gigabox.service.FService;
import shop.gigabox.service.FServiceImpl;
import shop.gigabox.service.MService;
import shop.gigabox.service.MServiceImpl;
import shop.gigabox.service.MVService;
import shop.gigabox.service.MVServiceImpl;
import shop.gigabox.service.RService;
import shop.gigabox.service.RServiceImpl;
import shop.gigabox.service.SCService;
import shop.gigabox.service.SCServiceImpl;
import shop.gigabox.service.THService;
import shop.gigabox.service.THServiceImpl;
import shop.gigabox.service.TService;
import shop.gigabox.service.TServiceImpl;
import shop.gigabox.vo.FVO;
import shop.gigabox.vo.MVO;
import shop.gigabox.vo.MVVO;
import shop.gigabox.vo.RVO;
import shop.gigabox.vo.SCVO;
import shop.gigabox.vo.SEATVO;
import shop.gigabox.vo.THVO;
import shop.gigabox.vo.TVO;

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
		List<MVO> mList = null;
		MVO mvo = null;
		int m_idx;
		
		MVService mvservice = new MVServiceImpl();
		List<MVVO> mvList = null;
		int mv_idx;
		MVVO mvvo = null;
		
		THService thservice = new THServiceImpl();
		List<THVO> thList = null;
		int th_idx;
		THVO thvo = null;
		
		SCService scservice = new SCServiceImpl();
		List<SCVO> scList = null;
		int sc_idx;
		SCVO scvo = null;
		
		List<SEATVO> seatList = null;
		SEATVO seatvo = null;
		
		TService tservice = new TServiceImpl();
		TVO tvo = null;
		List<TVO> tList = null;
		
		RService rservice = new RServiceImpl();
		List<RVO> rList = null;
		RVO rvo = null;
		
		FService fservice = new FServiceImpl();
		List<FVO> fList = null;
		FVO fvo = null;
		
		switch (cmd) {
		case "login_page":
			path="pages/login_page.jsp";
			break;
		
		case "join_page":
			path="pages/join_page.jsp";
			break;
			
		case "main_page":
			mvList = mvservice.getRecentListFour();
			List<Integer> fCntList = new ArrayList<Integer>();
			List<Boolean> fClickedList = new ArrayList<Boolean>();
			fvo = new FVO();
			fvo.setM_idx( session.getAttribute("user") != null
						  ? ((MVO)session.getAttribute("user")).getM_idx()
						  : 0
						);
			
			for (MVVO mv : mvList) {
				mv_idx = mv.getMv_idx();
				fvo.setMv_idx(mv_idx);
				
				fCntList.add(fservice.countFavorite(mv_idx));
				fClickedList.add(fservice.checkIsClicked(fvo) == 1);
			}
			
			request.setAttribute("fClickedList", fClickedList);
			request.setAttribute("fCntList", fCntList);
			request.setAttribute("mvList", mvList);
			forwardCheck = true;
			path="pages/main.jsp";
			break;

			
		//영화 상세 페이지
		case "movie_page":
			//영화 정보 불러오기
			mv_idx = Integer.parseInt(request.getParameter("mv_idx"));
			mvvo = mvservice.getMovieInfo(mv_idx);
			double rScoreAvg = rservice.getReviewScoreAvg(mv_idx);
			int fCnt = fservice.countFavorite(mv_idx);
			fvo = new FVO();
			fvo.setMv_idx(mv_idx);
			fvo.setM_idx( session.getAttribute("user") != null
					  ? ((MVO)session.getAttribute("user")).getM_idx()
					  : 0
					);
			boolean fClicked = fservice.checkIsClicked(fvo) == 1;
			
			//리뷰 불러오기
			rList = rservice.getReviewListByMovie(mv_idx);
			mList = new ArrayList<MVO>();
			for (RVO r : rList) {
				mvo = mservice.getMemberByIdx(r.getM_idx());
				mList.add(mvo);
			}
			
			
			request.setAttribute("fClicked", fClicked);
			request.setAttribute("fCnt", fCnt);
			request.setAttribute("mList", mList);
			request.setAttribute("rList", rList);
			request.setAttribute("rScoreAvg", rScoreAvg);
			request.setAttribute("mvvo", mvvo);
			forwardCheck = true;
			path="pages/movie_page.jsp";
			break;
		
		case "movie_list":
			mvList = mvservice.getMovieList();
			
			fvo = new FVO();
			fvo.setM_idx( session.getAttribute("user") != null
						  ? ((MVO)session.getAttribute("user")).getM_idx()
						  : 0
						);
			
			fCntList = new ArrayList<Integer>();
			fClickedList = new ArrayList<Boolean>();
			for (MVVO mv : mvList) {
				mv_idx = mv.getMv_idx();
				
				fvo.setMv_idx(mv_idx);
				fCntList.add(fservice.countFavorite(mv_idx));
				fClickedList.add(fservice.checkIsClicked(fvo) == 1);
			}
			
			request.setAttribute("fClickedList", fClickedList);
			request.setAttribute("fCntList", fCntList);
			request.setAttribute("mvList", mvList);
			forwardCheck = true;
			path="pages/movie_list.jsp";
			break;
		
		
		case "booking_select_movie":
			mvList = mvservice.getScreeningMV();
			
			request.setAttribute("mvList", mvList);
			forwardCheck = true;
			path="pages/booking_select_movie.jsp";
			break;
		
		case "booking_select_theater":
			mv_idx = Integer.parseInt(request.getParameter("mv_idx"));
			mvvo = mvservice.getMovieInfo(mv_idx);
			thList = thservice.getTheaterByScheduledMV(mv_idx);
			
			session.setAttribute("mv", mvvo);
			request.setAttribute("thList", thList);
			forwardCheck = true;
			path="pages/booking_select_theater.jsp";
			break;
		
		case "booking_select_date":
			mv_idx = ((MVVO)(session.getAttribute("mv"))).getMv_idx(); 
			th_idx = Integer.parseInt(request.getParameter("th_idx"));
			thvo = thservice.getTheaterByIdx(th_idx);
			Map<String, Integer> idxMap = new HashMap<>();
			idxMap.put("mv_idx", mv_idx);
			idxMap.put("th_idx", th_idx);
			
			scList = scservice.getScheduleByThMvIdx(idxMap);
			
			session.setAttribute("th", thvo);
			request.setAttribute("scList", scList);
			forwardCheck = true;
			path="pages/booking_select_schedule.jsp";
			break;
		
		case "booking_select_seat":
			mv_idx = ((MVVO)session.getAttribute("mv")).getMv_idx(); 
			th_idx = ((THVO)session.getAttribute("th")).getTh_idx();
			String screen_date = request.getParameter("screen_date");

			scvo = new SCVO();
			scvo.setMv_idx(mv_idx);
			scvo.setTh_idx(th_idx);
			scvo.setScreen_date(screen_date);
			scList = scservice.getScheduleByIdxDate(scvo);
			
			SCVO[][] seatMap = new SCVO[15][20];
			for (SCVO seat : scList) {
				int row = seat.getTh_row().charAt(0) - 65;
				int col = seat.getTh_col() - 1;
				
				seatMap[row][col] = seat;
			}
			
			request.setAttribute("seatMap", seatMap);
			session.setAttribute("screen_date", screen_date);
			forwardCheck = true;
			path="pages/booking_select_seat.jsp";
			break;
		
		case "booking_payment_page":
			String[] checkedSeat = request.getParameterValues("seat");
			
			int totalPrice = 0;
			seatList = new ArrayList<SEATVO>();
			for (String seat : checkedSeat) {
				seatvo = new SEATVO();
				String[] rowcol = seat.split(",");
				seatvo.setTh_row(rowcol[0]);
				seatvo.setTh_col(Integer.parseInt(rowcol[1]));
				seatvo.setPrice(12000);
				totalPrice += seatvo.getPrice();
				seatList.add(seatvo);
			}
			
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("seatList", seatList);
			forwardCheck = true;
			path="pages/booking_payment_page.jsp";
			break;
		
		case "booking_payment":
			path="pages/booking_payment.jsp";
			break;

		case "confirm_booking":
			m_idx = ((MVO)session.getAttribute("user")).getM_idx();
			mv_idx = ((MVVO)session.getAttribute("mv")).getMv_idx();
			th_idx = ((THVO)session.getAttribute("th")).getTh_idx();
			screen_date = (String)session.getAttribute("screen_date");
			seatList = (List<SEATVO>)session.getAttribute("seatList");				
			
			scList = new ArrayList<SCVO>();
			for (SEATVO seat : seatList) {
				scvo = new SCVO();
				scvo.setMv_idx(mv_idx);
				scvo.setTh_idx(th_idx);
				scvo.setScreen_date(screen_date);
				scvo.setTh_col(seat.getTh_col());
				scvo.setTh_row(seat.getTh_row());
				
				scvo = scservice.selectSchedule(scvo);
				System.out.println(scvo.getSc_idx());
				result = scservice.bookingSchedule(scvo.getSc_idx());
				
				if (result > 0) {
					tvo = new TVO();
					tvo.setM_idx(m_idx);
					tvo.setSc_idx(scvo.getSc_idx());
					tservice.confirmBooking(tvo);
				}
			}
			
			path="/Gigabox/Controller?cmd=my_ticket_page";
			break;
		
		case "cancel_ticket":
			sc_idx = Integer.parseInt(request.getParameter("sc_idx"));
			
			tservice.cancelTicket(sc_idx);
			scservice.cancelBooking(sc_idx);
			
			path="/Gigabox/Controller?cmd=my_ticket_page";
			break;

		case "my_ticket_page":
			m_idx = ((MVO)session.getAttribute("user")).getM_idx();
			
			tList = tservice.getTicketListByIdx(m_idx);
			scList = new ArrayList<SCVO>();
			mvList = new ArrayList<MVVO>();
			thList = new ArrayList<THVO>();
			for (TVO t : tList) {
				scvo = scservice.getSchedultByIdx(t.getSc_idx());
				mvvo = mvservice.getMovieInfo(scvo.getMv_idx());
				thvo = thservice.getTheaterByIdx(scvo.getTh_idx());
				
				scList.add(scvo);
				mvList.add(mvvo);
				thList.add(thvo);
			}
			
			session.setAttribute("scList", scList);
			session.setAttribute("mvList", mvList);
			session.setAttribute("thList", thList);
			
			forwardCheck = true;
			path="pages/my_ticket.jsp";
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
