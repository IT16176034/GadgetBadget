var $rootUrl = "http://localhost:8080/demorest/webapi/userlogin/users/";
var user=0;
$(document).ready(function() {
	
	getProfileDetails(1);
	getCardDetails(1);

});

function getProfileDetails(id){
	 $.ajax({
        url: $rootUrl+id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            user = data;
		var image=user.imgPath.replace(/ /g, '%20');
           document.getElementById("address").value=user.address;
		   document.getElementById("bDay").value=user.date_of_birth;
		   document.getElementById("email").value=user.email;
		   document.getElementById("fname").value=user.first_name;
		   document.getElementById("lname").value=user.last_name;
		   document.getElementById("tp").value=user.telephone_no;
			$("#imgPreview").attr({"src": image});

        }
    });
}

function getCardDetails(id){
	 $.ajax({
        url: $rootUrl+"card/"+id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            userCard = data;
           document.getElementById("cardNo").value=userCard.cardNumber;
		   document.getElementById("bankName").value=userCard.bank;
		   $('input:radio[name="CardType"]').filter('[value='+userCard.cardType+']').attr('checked', true);
        }
    });
}

$(document).ready(function(){
    $('#infoForm').on('submit', function(e){
			e.preventDefault();
		   user.address=document.getElementById("address").value;
		   user.date_of_birth=document.getElementById("bDay").value;
		   user.email=document.getElementById("email").value;
		   user.first_name=document.getElementById("fname").value;
		   user.last_name=document.getElementById("lname").value;
		   user.telephone_no=document.getElementById("tp").value;

        $.ajax({
            url: $rootUrl,
			type: "PUT",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(user),
	        dataType: 'json',
            success: function(data){
                alert("Succeses!");
				location.reload();
              
            }
        });
    });
})

$(document).ready(function(){
    $('#pwForm').on('submit', function(e){
	e.preventDefault();
	if(document.getElementById("pw").value==document.getElementById("conPw").value){
			
		   user.password=document.getElementById("pw").value;

        $.ajax({
            url: $rootUrl,
			type: "PUT",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(user),
	        dataType: 'json',
            success: function(data){
                alert("Succeses!");
				location.reload();
              
            }
        });
		}
		else
		alert("Passwords Are Not Matched !");
    });
})

$(document).ready(function(){
    $('#cardForm').on('submit', function(e){
	e.preventDefault();
	var userCard={};
	userCard.userId=user.id;
	userCard.cardNumber=document.getElementById("cardNo").value;
	userCard.bank=document.getElementById("bankName").value;
	userCard.cardType=$('input[name="CardType"]:checked').val();;
        $.ajax({
            url: $rootUrl+"updateCard",
			type: "PUT",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(userCard),
	        dataType: 'json',
            success: function(data){
                alert("Succeses!");
				location.reload();
              
            }
        });
    });
})

$(document).ready(function(){
    $('#imgForm').on('submit', function(e){
	e.preventDefault();
			
	var formData = new FormData($('#createForm')[0]);

    formData.append('file', $('input[type=file]')[0].files[0]);
    formData.append('obj', JSON.stringify(user));

        $.ajax({
            url: $rootUrl+"updateImg",
			data: formData,
	        type: 'PUT',
	        contentType: false,
	        processData: false,
            success: function(data){
                alert("Succeses!");
				location.reload();
              
            }
        });
    });
})

function deleteProfile(){
	 $.ajax({
        url: $rootUrl+user.id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'DELETE',
        success: function(data) {
            alert("Success !");
			location.replace("index.html");
        }
    });
}
