<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style>
table {
    border-collapse: collapse;
    width: 100%;
}
th, td {
    text-align: left;
    padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: #f4511e;
    color: white;
}
</style>
</head>


<script>
$(document).ready(function() {

	var javaScriptVar="<%out.print(session.getAttribute("NextPageUni"));%>";
	var sid = javaScriptVar;
	 
        $.get('UnivDataServlet', {
            servSid : sid
    	} , function(response) {
            var trHTML = '';
            $.each(response, function (i, item) {
            trHTML += '<tr><td>' + item.month + '</td><td>' + item.precipitation + '</td><td>' + item.maxTemp + '</td><td>' + item.minTemp +  '</td></tr>';          
            });
    		$('#records_table').append(trHTML);  
    	  });

     $.get('UnivOnCrimeServlet', {
         servSid : sid
 	} , function(response) {
 		var trHTML = "";
 		var onCrimeData= JSON.parse(response);
         if(onCrimeData != {}){
        	 trHTML += '<tr><td>Robbery</td><td>' + onCrimeData.robberyCount+'</td></tr>';
        	 trHTML += '<tr><td>Burglery</td><td>' + onCrimeData.burgleryCount+'</td></tr>';
        	 trHTML += '<tr><td>Vehicle Theft</td><td>' + onCrimeData.vehicleTheftCount+'</td></tr>';
        	 trHTML += '<tr><td>Murder</td><td>' + onCrimeData.murderCount+'</td></tr>';
        	 trHTML += '<tr><td>Assault</td><td>' + onCrimeData.assaultCount+'</td></tr>';
        	 trHTML += '<tr><td>Arson</td><td>' + onCrimeData.arsonCount+'</td></tr>';
         }  
         $('#onCrimeTable').append(trHTML);
 	  });
        
	  
	    $.get('UnivOffCrimeServlet', {
	         servSid : sid
	 	} , function(response) {
	 		var trHTML = "";
	 		var offCrimeData= JSON.parse(response);
	         if(offCrimeData != {}){
	        	 trHTML += '<tr><td>Robbery</td><td>' + offCrimeData.robberyCount+'</td></tr>';
	        	 trHTML += '<tr><td>Burglery</td><td>' + offCrimeData.burgleryCount+'</td></tr>';
	        	 trHTML += '<tr><td>Vehicle Theft</td><td>' + offCrimeData.vehicleTheftCount+'</td></tr>';
	        	 trHTML += '<tr><td>Murder</td><td>' + offCrimeData.murderCount+'</td></tr>';
	        	 trHTML += '<tr><td>Assault</td><td>' + offCrimeData.assaultCount+'</td></tr>';
	        	 trHTML += '<tr><td>Arson</td><td>' + offCrimeData.arsonCount+'</td></tr>';
	         }  
	         $('#offCrimeTable').append(trHTML);        
	 	  });
	        
	  

	     $.get('UnivDataCPIServlet', {
	         servSid : sid
	 	} , function(response) {
	 		var trHTML = "";
	 		var cpiData= JSON.parse(response);
	 		if(cpiData != {}){
	 			 trHTML += '<tr><td>Rank</td><td>' + cpiData.rank+'</td></tr>';
	        	 trHTML += '<tr><td>Overall Index</td><td>' + cpiData.overAllIndex+'</td></tr>';
	        	 trHTML += '<tr><td>Housing Index</td><td>' + cpiData.housingIndex+'</td></tr>';
	        	 trHTML += '<tr><td>Health Index</td><td>' + cpiData.healthIndex+'</td></tr>';
	        	 trHTML += '<tr><td>Miscellaneous Index</td><td>' + cpiData.miscIndex+'</td></tr>';
	        	 trHTML += '<tr><td>Utility Index</td><td>' + cpiData.utilityIndex+'</td></tr>';
	        	 trHTML += '<tr><td>Transportation Index</td><td>' + cpiData.transportIndex+'</td></tr>';
	        	 trHTML += '<tr><td>Grocery Index</td><td>' + cpiData.groceryIndex+'</td></tr>';
	        	 document.getElementById("univName").innerHTML = cpiData.name;
	        	 document.getElementById("univBranch").innerHTML = cpiData.branch;
	 		};
	 		$('#cpiTable').append(trHTML);
	 	  });
});  
</script>
<body>
	<div class="container-fluid" style="background-color:#f4511e;color:#fff;height:120px;">
  		<h1 id="univName"></h1>
  		<h4 id="univBranch"></h4>
	</div>
   <form name="mainform" action="controlServlet" method="POST">
   		<div class="container">
		  <div class="jumbotron">
		    <h4>Climate</h4>      
		    	<table id="records_table">
			    <tr>
			    	<th>Month</th>
			        <th>Precipitation</th>
			        <th>MaxTemp</th>
			        <th>MinTemp</th>
			    </tr>
				</table>
		  </div>
		  <div class="jumbotron">
		    <h4>On Campus Crime</h4>
	    	<table id="onCrimeTable">  </table>
	    	
	    	<h4>Off Campus Crime</h4>
	    	<table id="offCrimeTable"> </table>
		  </div>   
		  <div class="jumbotron">
		    <h4>Consumer Price Index</h4>      
		    <table id="cpiTable" ></table>
		  </div> 
		</div>

	</form>
</body>
</html>