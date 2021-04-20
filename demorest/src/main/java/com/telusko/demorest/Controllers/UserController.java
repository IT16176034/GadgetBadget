package com.telusko.demorest.Controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.json.JSONObject;

import com.telusko.demorest.model.PaymentModel;
import com.telusko.demorest.model.ProjectModel;
import com.telusko.demorest.model.UserModel;
import com.telusko.demorest.model.ReviewModel;
import com.telusko.demorest.model.UserCardModel;
import com.telusko.demorest.services.PaymentRepository;
import com.telusko.demorest.services.ProjectRepository;
import com.telusko.demorest.services.UserRepository;

@Path("userlogin")
public class UserController {

	ProjectRepository projectRepo=new ProjectRepository();
	UserRepository userRepo=new UserRepository();
	PaymentRepository paymentRepo=new PaymentRepository();
	
	//Project Controllers-------------------------------------------------------------------------------------------------------------------
	
	@Path("projects")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<ProjectModel> getProjects() throws SQLException {
		return projectRepo.getProjects();
	}

	@Path("projects/new")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<ProjectModel> getNewProjects() throws SQLException {
		return projectRepo.getNewProjects();
	}
	
	@Path("projects/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ProjectModel getProject(@PathParam("id") int id) throws SQLException {
		return projectRepo.getProject(id);
	}
	
	@Path("projects/reviews/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<ReviewModel> getReviews(@PathParam("id") int id) throws SQLException {
		return projectRepo.getReviews(id);
	}
	
	//Users Controllers-------------------------------------------------------------------------------------------------------------------
	
	@Path("users/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public UserModel getUser(@PathParam("id") int id) throws SQLException {
		return userRepo.getUser(id);
	}
	
	@Path("users/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteUser(@PathParam("id") int id) throws SQLException {
		return userRepo.deleteUser(id);
	}
	
	@Path("users/card/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public UserCardModel getUserCard(@PathParam("id") int id) throws SQLException {
		return userRepo.getUserCard(id);
	}
	
	@Path("users")
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public UserModel UpdateUser(UserModel a) throws SQLException {

			userRepo.updateUser(a);
		
		return a;
	}
	
	@Path("users/updateCard")
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public UserCardModel UpdateUserCard(UserCardModel a) throws SQLException {

			userRepo.updateUserCard(a);
		
		return a;
	}
	
	@Path("users/updateImg")
	@PUT
    @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_OCTET_STREAM)
    public String CreateUser(@FormDataParam("obj") String obj,
        @FormDataParam("file") InputStream uploadedInputStream,
        @FormDataParam("file") FormDataContentDisposition fileDetail) throws SQLException {
		 JSONObject obj1 = new JSONObject(obj);
		     
		     String uploadedFileLocation = "D:\\SLIIT\\4th year\\PAF\\nayana\\gadgetbadget\\FrontEnd\\WebContent\\ProfileImages\\" + fileDetail.getFileName();
	       
	         writeToFile(uploadedInputStream, uploadedFileLocation);
	         
	         userRepo.updateUserImg(obj1.getInt("id"),"/FrontEnd/ProfileImages/" + fileDetail.getFileName());
				
	         return ("Success !");


    }
	
	//Payment Controllers-------------------------------------------------------------------------------------------------------------------
	
	@Path("users/payment/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<PaymentModel> getPayments(@PathParam("id") int id) throws SQLException {
		return paymentRepo.getPayments(id);
	}
	
	@Path("users/payment")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public PaymentModel addPayment(PaymentModel a) throws SQLException {

		paymentRepo.createPayment(a);
		
		return a;
	}
	
	@Path("users/payment/{id}")
	@DELETE
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_OCTET_STREAM)
	public String deletePayment(@PathParam("id") int id) throws SQLException {

		paymentRepo.deletePayment(id);
		
		return "Success !";
	}

    private void writeToFile(InputStream uploadedInputStream,
            String uploadedFileLocation) {

            try {
                OutputStream out = new FileOutputStream(new File(
                        uploadedFileLocation));
                int read = 0;
                byte[] bytes = new byte[1024];

                out = new FileOutputStream(new File(uploadedFileLocation));
                while ((read = uploadedInputStream.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
                out.flush();
                out.close();
            } catch (IOException e) {

                e.printStackTrace();
            }

        }
	
}
