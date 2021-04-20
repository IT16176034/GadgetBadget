var $rootUrl = "http://localhost:8080/demorest/webapi/userlogin/users/payment/";
var paymentsTable = ["payment_id", "method", "status", "amount", "date", "description"];
$(document).ready(function() {
	
	getPayments(1);


});

function getPayments(id){
	 $.ajax({
        url: $rootUrl+id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'GET',
        success: function(data) {
            payments = data;
			tableCreation(payments);

        }
    });
}

function tableCreation(para) {
    var table = document.getElementById("listtable"); // set this to your table
    var tbody = document.createElement("tbody");
    table.appendChild(tbody);
    para.forEach(function(item) {
        userSelect = item["payment_id"];
        var row = document.createElement("tr");
        paymentsTable.forEach(function(key) {
			if(key=="date"){
				item[key]=convertDate(item[key]);
			}
            var cell = document.createElement("td");
            cell.textContent = item[key];
            row.appendChild(cell);
        });
       
        var celldelete = document.createElement("td");
        celldelete.innerHTML = "<a href='#deleteModal' onclick='deleteUserbuttonClick(" + userSelect + ")' class='delete' data-toggle='modal'><i class='material-icons' data-toggle='tooltip' title='Delete'>&#xE872;</i></a>";
        row.appendChild(celldelete);
        tbody.appendChild(row);
    });

}

function deleteUserbuttonClick(id){
	var txt;
		var r = confirm("Are You Sure !");
		if (r == true) {
		  $.ajax({
        url: $rootUrl+id,
        contentType: 'application/json',
        dataType: 'json',
        type: 'DELETE',
        success: function(data) {
            alert("Success !");
			location.replace("index.html");
        }
    	});
		alert("Deleted Success !");
		location.reload();
		} else {
		  txt = "You pressed Cancel!";
		}
	 
}

function convertDate(inputFormat) {
  function pad(s) { return (s < 10) ? '0' + s : s; }
  var d = new Date(inputFormat)
  return [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/')
}
