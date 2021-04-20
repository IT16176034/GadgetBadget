package com.telusko.demorest.services;

import java.util.ArrayList;
import java.sql.*;
import java.util.List;

import com.telusko.demorest.model.ProjectModel;
import com.telusko.demorest.model.ReviewModel;
import com.telusko.demorest.model.UserModel;

public class ProjectRepository {
	
	List<ProjectModel> projects;
	Connection conn=null;
	
	public ProjectRepository() {
		
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
	
	public List<ProjectModel> getProjects() throws SQLException {
		
		List<ProjectModel> projects=new ArrayList<>();
		String query="select * from project where project_type='project' ";
			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while (rs.next()) {
				ProjectModel a=new ProjectModel();
				a.setProject_id(rs.getInt(1));
				a.setProject_name(rs.getString(2));
				a.setDescription(rs.getString(3));
				a.setStatus_id(rs.getInt(4));
				a.setProject_type(rs.getString(5));
				a.setApproval(rs.getInt(6));
				a.setFile(rs.getString(7));
				a.setImgPath(rs.getString(8));
				a.setPrice(rs.getString(9));
				a.setCategoryId(rs.getInt(13));
				projects.add(a);
			}
			
		

		return projects;
	}
	


	public List<ProjectModel> getNewProjects() throws SQLException {
		
		List<ProjectModel> projects=new ArrayList<>();
		String query="select * from project where approval=1 and project_type='project' ORDER BY project_id DESC limit 3 ";
			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while (rs.next()) {
				ProjectModel a=new ProjectModel();
				a.setProject_id(rs.getInt(1));
				a.setProject_name(rs.getString(2));
				a.setDescription(rs.getString(3));
				a.setStatus_id(rs.getInt(4));
				a.setProject_type(rs.getString(5));
				a.setApproval(rs.getInt(6));
				a.setFile(rs.getString(7));
				a.setImgPath(rs.getString(8));
				a.setPrice(rs.getString(9));
				a.setCategoryId(rs.getInt(13));
				projects.add(a);
			}
			
		

		return projects;
	}
	
	public List<ProjectModel> getProjectRequests(int id) throws SQLException {
		
		List<ProjectModel> projects=new ArrayList<>();
		String query="select * from project where approval=1 and project_type='document' and researcherId ="+id;
			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while (rs.next()) {
				ProjectModel a=new ProjectModel();
				a.setProject_id(rs.getInt(1));
				a.setProject_name(rs.getString(2));
				projects.add(a);
			}
			
		

		return projects;
	}

	
	public ProjectModel getProject(int id) throws SQLException {
	
		ProjectModel a=new ProjectModel();
		String query="select * from project where project_id="+id;

			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			if (rs.next()) {
				
				a.setProject_id(rs.getInt(1));
				a.setProject_name(rs.getString(2));
				a.setDescription(rs.getString(3));
				a.setStatus_id(rs.getInt(4));
				a.setProject_type(rs.getString(5));
				a.setApproval(rs.getInt(6));
				a.setFile(rs.getString(7));
				a.setImgPath(rs.getString(8));
				a.setPrice(rs.getString(9));
				a.setRate(rs.getFloat(10));
				a.setCategoryId(rs.getInt(13));
				
			}
			

		return a;
		
	}
	
	public List<ReviewModel> getReviews(int id) throws SQLException {
		
		List<ReviewModel> Reviews=new ArrayList<>();
		String query="select * from reviews where  project_id= "+id;
			
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while (rs.next()) {
				ReviewModel a=new ReviewModel();
				a.setReview_id(rs.getInt(1));
				a.setProject_id(rs.getInt(2));
				a.setReview(rs.getString(3));
				Reviews.add(a);
			}
			
		

		return Reviews;
		
	}
	
}
