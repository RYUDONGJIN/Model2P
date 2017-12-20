package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloWorld") 
//HelloWorld라고 주소 url에 표시해주어야 이 서블릿 클래스가 실행된다.(URL맵핑)
public class HelloWorld extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	//일괄 처리 즉, doget이던 dopost던 아래 reqPro메소드가 실행되게 해줌
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에 HelloWorld라고 출력을 하고싶다. jsp쪽으로 넘겨질 데이터를 설정
		String msg = "Hello World!!";
		Integer data = 12;
		//jsp쪽으로 데이터를 request에 부착하여 넘겨줌
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		//서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체를 선언
		RequestDispatcher dis = request.getRequestDispatcher("HelloWorld.jsp");//jsp파일명을 기술
		dis.forward(request, response);
		
	}
}










