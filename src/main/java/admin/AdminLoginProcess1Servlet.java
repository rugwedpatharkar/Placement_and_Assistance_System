package admin;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminLoginProcess1Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String a_email = request.getParameter("a_email");
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();

		if (a_email != null || !a_email.equals("")) {
			Random rand = new Random();
			otpvalue = rand.nextInt(1255650);

			String to = a_email;
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("demo.mail23409@gmail.com", "qhqokmbkomaucjvj");
				}
			});
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(a_email));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Verification code");
				message.setText("Please use the verification code below to sign in. '" + otpvalue
						+ "'. If you didn’t request this, you can ignore this email.\r\n" + "\r\n" + "Thanks,\r\n"
						+ "Placement and Assistance System ");
				Transport.send(message);
				System.out.println("message sent successfully");
			}
			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("admin_signin2.jsp");
			request.setAttribute("message", "OTP is sent to your email id");
			mySession.setAttribute("otp", otpvalue);
			mySession.setAttribute("a_email", a_email);
			dispatcher.forward(request, response);
			request.setAttribute("status", "success");
		}
	}

}
