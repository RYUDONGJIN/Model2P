package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;

@WebServlet("/Mproc2.do")
public class MemberJoinProc2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberBean bean = new MemberBean();
		bean.setId(request.getParameter("id"));
		bean.setPw(request.getParameter("pw"));
		bean.setEmail(request.getParameter("email"));
		bean.setTel(request.getParameter("tel"));
		bean.setAddress(request.getParameter("address"));
		
		//request객체에 bean클래스를 추가
		request.setAttribute("bean", bean);
		
		RequestDispatcher dis = request.getRequestDispatcher("MemberView.jsp");
		dis.forward(request, response);
	}
}
