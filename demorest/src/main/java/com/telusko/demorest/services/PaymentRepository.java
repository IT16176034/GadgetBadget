package com.telusko.demorest.services;

import java.util.ArrayList;
import java.sql.*;
import java.util.List;

import com.telusko.demorest.model.PaymentModel;


public class PaymentRepository {
	
	List<PaymentModel> payments;
	Connection conn=null;
	
	public PaymentRepository() {
		
		String url="jdbc:mysql://localhost:3306/gadgetbadget";
		String usrName="root";
		String pw="root123";
	
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(url,usrName,pw);
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e);
			}
	}
	
	public List<PaymentModel> getPayments(int id) throws SQLException {
		
		List<PaymentModel> payments=new ArrayList<>();
		String query="select * from payment where user_id="+id;
			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while (rs.next()) {
				PaymentModel a=new PaymentModel();
				a.setPayment_id(rs.getInt(1));
				a.setUser_id(rs.getInt(2));
				a.setMethod(rs.getString(3));
				a.setStatus(rs.getString(4));
				a.setAmount(rs.getFloat(5));
				a.setDate(rs.getString(6));
				a.setDescription(rs.getString(7));
				payments.add(a);
			}
			
		

		return payments;
	}
	
	
	public void createPayment(PaymentModel a) throws SQLException {
		
		String query="insert into payment (user_id,method,status,amount,date,description) values(?,?,?,?,?,?)";
			
			PreparedStatement st=conn.prepareStatement(query);
			st.setInt(1, a.getUser_id());
			st.setString(2, a.getMethod());
			st.setString(3, a.getStatus());
			st.setFloat(4, a.getAmount());
			st.setString(5,a.getDate());
			st.setString(6, a.getDescription());
			st.execute();

		
	}

	public void deletePayment(int id) throws SQLException {
		
		String query="Delete from payment where payment_id="+id;
		
		PreparedStatement st=conn.prepareStatement(query);
		st.execute();
	}

}
