package com;

import model.projectInfo;


//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

//For JSON
import com.google.gson.*;

//For XML
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/project")

public class project {
projectInfo api=new projectInfo();
	
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	
	public String readProject()
	 {
		return api.readProjectInfo();
	 
	 }
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertProjectInfo (
		
			@FormParam("projectName") String pName,
			@FormParam("description") String description,
			@FormParam("type") String type,
			@FormParam("approval") String approval,
			@FormParam("startDate") String sDate,
			@FormParam("endDate") String eDate			
			)
		
	{
				
	 String output =api.insertProjectInfo(pName,description,type,approval,sDate,eDate);
	return output;
	}
	
	//Update API JSON
	
		@PUT
		@Path("/")
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.TEXT_PLAIN)
		public String updateProject(String projectData)
		{
		
			//Convert the input string to a JSON object
		 JsonObject projectObject = new JsonParser().parse(projectData).getAsJsonObject();
		
		 //Read the values from the JSON object
		 String projectID =  projectObject.get("projectID").getAsString();
		 String Name =  projectObject.get("projectName").getAsString();
		 String description =  projectObject.get("description").getAsString();
		 String type = projectObject.get("type").getAsString();
		 String approval = projectObject.get("approval").getAsString();
		 String startDate = projectObject.get("startDate").getAsString();
		 String endDate = projectObject.get("endDate").getAsString();
		
		 String output =  api.updateProjectInfo(projectID, Name, description, type, approval, startDate, endDate);
		
		 return output;
		}
		

		@DELETE
		@Path("/")
		@Consumes(MediaType.APPLICATION_XML)
		@Produces(MediaType.TEXT_PLAIN)
		
		public String deleteProjectInfo(String projectData)
		{
		//Convert the input string to an XML document
		 Document doc = Jsoup.parse( projectData, "", Parser.xmlParser());

		//Read the value from the element 
		 String projectID = doc.select("projectID").text();
		 String output = api.deleteProjectInfo(projectID);
		return output;
		}
}