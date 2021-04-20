package com.telusko.demorest.services;

import java.util.ArrayList;
import java.sql.*;
import java.util.List;

import com.telusko.demorest.model.UserCardModel;
import com.telusko.demorest.model.UserModel;

public class UserRepository {
	
	List<UserModel> users;
	Connection conn=null;
	
	public UserRepository() {
		
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
	
	public List<UserModel> getUsers() throws SQLException {
		
		List<UserModel> users=new ArrayList<>();
		String query="select * from user";
			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while (rs.next()) {
				UserModel a=new UserModel();
				a.setId(rs.getInt(1));
				a.setFirst_name(rs.getString(2));
				a.setLast_name(rs.getString(3));
				a.setDate_of_birth(rs.getString(4));
				a.setAddress(rs.getString(5));
				a.setTelephone_no(rs.getString(6));
				a.setUsername(rs.getString(7));
				a.setPassword(rs.getString(8));
				a.setEmail(rs.getString(9));
				a.setUser_type(rs.getString(10));
				users.add(a);
			}
			
		

		return users;
	}
	
	public UserModel getUser(int id) throws SQLException {
	
		UserModel a=new UserModel();
		String query="select * from user where id="+id;

			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			if (rs.next()) {
				
				a.setId(rs.getInt(1));
				a.setFirst_name(rs.getString(2));
				a.setLast_name(rs.getString(3));
				a.setDate_of_birth(rs.getString(4));
				a.setAddress(rs.getString(5));
				a.setTelephone_no(rs.getString(6));
				a.setUsername(rs.getString(7));
				a.setPassword(rs.getString(8));
				a.setEmail(rs.getString(9));
				a.setUser_type(rs.getString(10));
				a.setImgPath(rs.getString(11));

				
			}
			

		return a;
		
	}
	
	public String deleteUser(int id) throws SQLException {
		
		UserModel a=new UserModel();
		String query="delete from user where id="+id;

			
		PreparedStatement st=conn.prepareStatement(query);
		st.executeUpdate();
			

		return "Successed !";
	}
	
	public UserCardModel getUserCard(int id) throws SQLException {
		
		UserCardModel a=new UserCardModel();
		String query="select * from userCardDetails where userId="+id;

			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			if (rs.next()) {
				
				a.setId(rs.getInt(1));
				a.setUserId(rs.getInt(2));
				a.setCardNumber(rs.getString(3));
				a.setBank(rs.getString(4));
				a.setCardType(rs.getString(5));
			}
			

		return a;
		
	}
	
	public void updateUser(UserModel a) throws SQLException {
			
			String query="update user set first_name=? ,last_name=?,date_of_birth=?,address=?,telephone_no=?,username=?,password=?,email=?,user_type=? where id=?";
				
				PreparedStatement st=conn.prepareStatement(query);

				st.setString(1, a.getFirst_name());
				st.setString(2, a.getLast_name());
				st.setString(3, a.getDate_of_birth());
				st.setString(4, a.getAddress());
				st.setString(5, a.getTelephone_no());
				st.setString(6, a.getUsername());
				st.setString(7, a.getPassword());
				st.setString(8, a.getEmail());
				st.setString(9, a.getUser_type());
				st.setInt(10, a.getId());
				st.executeUpdate();

			
	}
	
	public void updateUserCard(UserCardModel a) throws SQLException {
		
		String query="update userCardDetails set cardNumber=? ,bank=?,cardType=? where userId=?";
			
			PreparedStatement st=conn.prepareStatement(query);

			st.setString(1, a.getCardNumber());
			st.setString(2, a.getBank());
			st.setString(3, a.getCardType());
			st.setInt(4, a.getUserId());
			st.executeUpdate();

		
}
	
	public void updateUserImg(int id,String imgPath) throws SQLException {
		
		String query="update user set imgPath=? where id=?";
			
			PreparedStatement st=conn.prepareStatement(query);

			st.setString(1, imgPath);
			st.setInt(2, id);
			st.executeUpdate();

		
}

}
