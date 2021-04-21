package model;

import java.sql.*;
import dbconnection.DBConnection;

public class projectInfo {
			public String insertProjectInfo( String pName, String description, String type, String approval, String sDate, String eDate)
			{
				String output = "";
				
				try
				 {
				 
					DBConnection dbconnection = new DBConnection();
					Connection con = dbconnection.connect();
					
					if (con == null)
					{return "Error while connecting to the database for inserting."; } 
				
					// create a prepared statement
					String query = " insert into projectm (`projectID`,`projectName`,`description`,`type`,`approval`,`startDate`,`endDate`)"
							+ " values (?, ?, ?, ?, ?, ?, ?)";
				
					PreparedStatement preparedStmt = con.prepareStatement(query);
			
					// binding values
					 preparedStmt.setInt(1, 0);
					 preparedStmt.setString(2,pName);
					 preparedStmt.setString(3,description);
					 preparedStmt.setString(4,type);
					 preparedStmt.setString(5,approval);
					 preparedStmt.setString(6,sDate);
					 preparedStmt.setString(7,eDate);
					
					 
					 
					// execute the statement
					 preparedStmt.execute();
					 con.close(); 
					 
					 output = "Inserted successfully";
									  
					 
				 } 
					 catch (Exception e)
					 {
					
						 output = "Error while inserting the project information.";
						 System.err.println(e.getMessage());
					 }
					 	return output;
					
					 	
					 	
					 	
				 } 
			public String readProjectInfo() 	 
			{		 
				
				String output = ""; 	 
					 
				try
				 {
					DBConnection dbconnection = new DBConnection();
					Connection con = dbconnection.connect();
				
				 if (con == null)
				 {return "Error while connecting to the database for reading."; }  
					 
					 
				// Prepare the html table to be displayed 
				 
				 output = "<body class=\"bg-image\"\n" + 
				 		"style=\"background-image: url('https://globetrender.com/wp-content/uploads/2020/05/Caribbean-beach.jpg');\">" 
						+ "<h1 style='text-align:center;margin-top:50px; margin-bottom:50px'>Project Management</h1>"
				 		+ "<table style='margin-left:25%;font-size:24' border=\"1\"><tr><th> Project ID </th><th> Project Name </th><th> Description </th><th> Type </th><th> Approval </th><th> Start Date </th><th> End Date </th></tr>"; 
				 
				 
				 
				 String query = "select * from projectm";
				 Statement stmt = con.createStatement();
				 ResultSet rs = stmt.executeQuery(query); 
				 
				 
				// iterate through the rows in the result set
				 
				 while (rs.next()) 
				 {

					 String projectID = Integer.toString(rs.getInt("projectID")); 
					 String name		=	rs.getString("projectName"); 
					 String description		= 	rs.getString("description");
					 String type		= 	rs.getString("type");
					 String approval    =	rs.getString("approval");
					 String startDate    =	rs.getString("startDate");
					 String endDate    =	rs.getString("endDate");
		
				 
					// Add into the html table

					 output += "<td>" + projectID + "</td>"; 
					 output += "<td>" + name + "</td>"; 
					 output += "<td>" + description + "</td>"; 
					 output += "<td>" + type+ "</td>"; 
					 output += "<td>" +approval  + "</td>";
					 output += "<td>" +startDate  + "</td>";
					 output += "<td>" +endDate  + "</td></tr>";
					 
					 
				 }
					 con.close();
					 
					 // Complete the html table
					 output += "</table>";
					 }
			
				 catch (Exception e)
				 {
					 output = "Error while reading the information.";
					 System.err.println(e.getMessage());
				 }
				 	
				 return output;
				 	
			
				 	 
			 } 		
			 
			public String updateProjectInfo(String ID ,String pName, String description, String type, String approval, String sDate, String eDate)
			{ 
			String output = "";  
				 
				 
			try
			 {
				DBConnection dbconnection = new DBConnection();
				Connection con = dbconnection.connect();
					
					if (con == null)
					{return "Error while connecting to the database for updating."; }
			
					// create a prepared statement
			 String query = "UPDATE projectm SET projectName=?,description=?,type=?,approval=?,startDate=?,endDate=? WHERE projectID=?";
				 
				 
			 PreparedStatement preparedStmt = con.prepareStatement(query);	 
				 
				 
			// binding values
			 preparedStmt.setString(1, pName); 
			 preparedStmt.setString(2, description);  
			 preparedStmt.setString(3,  type); 	
			 preparedStmt.setString(4, approval);
			 preparedStmt.setString(5, sDate);
			 preparedStmt.setString(6, eDate);
			 preparedStmt.setInt(7, Integer.parseInt(ID));

			 
			// execute the statement
			 preparedStmt.execute();
			 con.close();
			 
			 output = "Updated successfully";
			 
			 } 
			
			catch (Exception e)
			 {
			 
				output = "Error while updating the project information.";
				System.err.println(e.getMessage());
			 } 
			
			
			return output;
			} 

			public String deleteProjectInfo(String projectID)
			{
				String output = ""; 
				
				try
				 {
				
					DBConnection dbconnection = new DBConnection();
					Connection con = dbconnection.connect();
				 
				 if (con == null)
				 {return "Error while connecting to the database for deleting."; }
				
				// create a prepared statement
				 String query="delete from projectm  where projectID=?";
				 
				 PreparedStatement preparedStmt = con.prepareStatement(query); 
				
				// binding values
				 preparedStmt.setInt(1, Integer.parseInt(projectID)); 
				 
				// execute the statement
				 preparedStmt.execute();
				 con.close();
				 
				 output = "Deleted successfully";
				
				 }
				 
			
			
			catch (Exception e)
			 {
					output = "Error while deleting the project.";
					System.err.println(e.getMessage());
			 }
			 
				return output;
			 } 
			
			
	}
