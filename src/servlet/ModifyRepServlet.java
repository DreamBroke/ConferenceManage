package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RepresentorDAO;
import models.Representor;

public class ModifyRepServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ModifyRepServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String position = request.getParameter("position");
		String professional = request.getParameter("professional");
		String taxpay = request.getParameter("taxpay");
		String company = request.getParameter("company");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String postcode = request.getParameter("postcode");
		String qq = request.getParameter("qq");
		String field = request.getParameter("field");
		String country = request.getParameter("country");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String no = request.getParameter("no");
		String IDnumber = request.getParameter("IDnumber");
		Representor rep = new Representor();
		rep.setRep_no(Integer.parseInt(no));
		rep.setRep_username(username);
		rep.setRep_name(name);
		rep.setRep_sex(sex);
		rep.setRep_position(position);
		rep.setRep_professional(Integer.parseInt(professional));
		rep.setRep_taxpay(taxpay);
		rep.setRep_company(company);
		rep.setRep_email(email);
		rep.setRep_tel(tel);
		rep.setRep_qq(qq);
		rep.setRep_field(field);
		rep.setRep_postcode(postcode);
		rep.setRep_country(country);
		rep.setRep_province(province);
		rep.setRep_city(city);
		rep.setRep_IDnumber(IDnumber);
		RepresentorDAO.modifyRepresentor(rep);
		HttpSession session = request.getSession();
		session.setAttribute("message", "success");
		response.sendRedirect("representor/index.jsp");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
