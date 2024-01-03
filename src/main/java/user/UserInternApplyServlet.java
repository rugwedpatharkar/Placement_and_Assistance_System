package user;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserInternApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	InputStream inputStream = null;
	OutputStream outputStream = null;
	RequestDispatcher dispatcher = null;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));

		int intern_id = Integer.parseInt(request.getParameter("intern_id"));

		try {

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/placementcell?allowPublicKeyRetrieval=true&useSSL=false";
			String username = "root";
			String password = "password";
			conn = DriverManager.getConnection(url, username, password);

			String selectSql = "SELECT uid, u_name, u_email, u_resume FROM user WHERE uid=?";
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, uid);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String u_name = rs.getString("u_name");
				String u_email = rs.getString("u_email");
				inputStream = rs.getBinaryStream("u_resume");

				String updateSql = "UPDATE internship SET uid=?, u_name=?, u_email=?, u_resume=? WHERE intern_id=?";
				pstmt = conn.prepareStatement(updateSql);
				pstmt.setString(1, u_name);
				pstmt.setString(2, u_email);
				pstmt.setInt(3, uid);
				pstmt.setBinaryStream(4, inputStream);
				pstmt.setInt(5, intern_id);
				pstmt.executeUpdate();
				request.setAttribute("status", "applied");
				dispatcher = request.getRequestDispatcher("user_internship.jsp");
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}

		}

	}
}
