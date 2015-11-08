

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class add
 */
@WebServlet("/do.add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		BufferedWriter out = null; 
		try { 
			FileWriter writer = new FileWriter("/Users/macbookpro/Documents/workspace/hackShanghai/WebContent/txt/email.txt", true);
            writer.write(email + "\n");
            writer.close();
		} catch (IOException e) { 
		    System.out.println("no"); 
		} finally { 
		    if (out != null) { 
		         out.close(); 
		    } 
		}
		response.sendRedirect("index.html");
	}

}
