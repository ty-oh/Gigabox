package shop.gigabox.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import shop.gigabox.service.FService;
import shop.gigabox.service.FServiceImpl;
import shop.gigabox.service.MService;
import shop.gigabox.service.MServiceImpl;
import shop.gigabox.vo.FVO;

@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String cmd = request.getParameter("cmd");
		
		MService mservice = new MServiceImpl();
		
		FService fservice = new FServiceImpl();
		FVO fvo = null;
		
		JSONObject jsonObj = new JSONObject(); 
		
		switch (cmd) {
		case "click_favorite":
			int m_idx = Integer.parseInt(request.getParameter("m_idx"));
			int mv_idx = Integer.parseInt(request.getParameter("mv_idx"));
			fvo = new FVO();
			fvo.setM_idx(m_idx);
			fvo.setMv_idx(mv_idx);
			
			boolean isClicked = fservice.checkIsClicked(fvo) == 1;
			if (isClicked) {
				fservice.removeFavorite(fvo);
			} else {
				fservice.addFavorite(fvo);
			}
			
			int fCnt = fservice.countFavorite(mv_idx);
			jsonObj.put("fCnt", fCnt);
			jsonObj.put("isClicked", isClicked);
			response.getWriter().print(jsonObj);
			break;
			
		case "id_duplicate_check":
			String id_value = request.getParameter("id_value");
			boolean isIdSame = mservice.checkIdSame(id_value);
			System.out.println(id_value);
			System.out.println(isIdSame);
			
			response.getWriter().print(isIdSame);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
