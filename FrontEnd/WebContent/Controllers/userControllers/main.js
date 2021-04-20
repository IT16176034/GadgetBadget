var $rootUrl = "http://localhost:8080/demorest/webapi/userlogin/projects/";
var project={};
$(document).ready(function() {
	
	getNewProducts();
	getAllProducts();

});

function getAllProducts(){
	 $.ajax({
        url: $rootUrl,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            projects = data;
			var projectQty=1;
            projects.forEach(function (entry) {
			
            var image=entry.imgPath.replace(/ /g, '%20');

			if(projectQty<=3){
				$("#allProjects").append("<div class='col-sm-4'><a href='#' onclick='viewProduct("+entry.project_id+")' data-toggle='modal' data-target='#viewModal' ><img src="+image+" class='img-responsive' style='width:100% ;height:240px' alt='Image'><p>"+entry.project_name+"</p></a></div>");
			}
			else{
				$("#allProjectsCollapse").append("<div class='col-sm-4'><a href='#' onclick='viewProduct("+entry.project_id+")' data-toggle='modal' data-target='#viewModal' ><img src="+image+" class='img-responsive' style='width:100% ;height:240px' alt='Image'><p>"+entry.project_name+"</p></a></div>");
			}
            projectQty++;
        });
        }
    });
}

function getNewProducts(){
	    $.ajax({
        url: $rootUrl+"new",
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            projects = data;
            projects.forEach(function (entry) {
            var image=entry.imgPath.replace(/ /g, '%20');
              $("#newProjects").append("<div class='col-sm-4'><a href='#' onclick='viewProduct("+entry.project_id+")' data-toggle='modal' data-target='#viewModal' ><img src="+image+" class='img-responsive' style='width:100% ;height:240px' alt='Image'><p>"+entry.project_name+"</p></a></div>");
            
        });
        }
    });
}

function viewProduct(id){
	 $.ajax({
        url: $rootUrl+id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
		getReviews(id);
            project = data;
		var image=project.imgPath.replace(/ /g, '%20');
           document.getElementById("viewModalLabel").innerHTML=project.project_name;
		   document.getElementById("projectName").innerHTML=project.project_name;
		   document.getElementById("projectPrice").innerHTML=project.price;
		   document.getElementById("projectDescription").innerHTML=project.description;
		   $("#projectImg").attr({"src": image});
			for(var x=1;x<=5;x++){
                $("#star"+x).removeClass("checked");
            }

			var avgRate=Math.trunc(project.rate);
		    for(var x=1;x<=avgRate;x++){
                $("#star"+x).addClass("checked");
            }
        }
    });
}

function getReviews(id){
	 $.ajax({
        url: $rootUrl+"reviews/"+id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            reviews = data;
			reviews.forEach(function (entry) {
              $("#reviewArea").append("<p>"+entry.review+"</p>");
            
       		});
        }
    });
}

function showMoreLess(id){
    if(document.getElementById(id).innerHTML=="See More"){
       document.getElementById(id).innerHTML="See Less";
       }
    else
        document.getElementById(id).innerHTML="See More";
    
}

function openPayment(){
	 $.ajax({
        url: "http://localhost:8080/demorest/webapi/userlogin/users/card/"+1,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            userCard = data;
           document.getElementById("cardNumber").value=userCard.cardNumber;
		   document.getElementById("projectPriceTot").innerHTML=project.price+".00 LKR";
        }
    });
}

function doPay(){
	
	var userPayment={};
		   userPayment.user_id=1;
		   userPayment.method="test";
		   userPayment.status="SuccessFully !";
		   userPayment.amount=project.price;
		   userPayment.date=new Date();
		   userPayment.description="Project"+project.project_name+" Purchase";

        $.ajax({
            url: "http://localhost:8080/demorest/webapi/userlogin/users/payment",
			type: "POST",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(userPayment),
	        dataType: 'json',
            success: function(data){
                alert("Succeses!");
				location.reload();
              var file_path =project.file;
				 var a = document.createElement('A');
		        a.href = file_path;
		        a.download = file_path.substr(file_path.lastIndexOf(' | ') + 1);
		        document.body.appendChild(a);
		        a.click();
		        document.body.removeChild(a);
            }
        });
				
	
}
