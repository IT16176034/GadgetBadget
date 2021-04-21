package com;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/Login")
public class Login {
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_PLAIN)
	public String login() {
		return "Welcome to Login Page";
	}
}
