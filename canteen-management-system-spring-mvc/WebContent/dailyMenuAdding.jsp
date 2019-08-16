<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="java.util.*"%>
<%@page import="com.canteen.dto.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%!
  	List <Item>userList=null;
    List <Menu>userList1= null;
    int n=1;
  %>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<link
		href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
		rel="stylesheet" type="text/css" />
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link
		href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
		rel="stylesheet" type="text/css" />
	<script
		src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
		type="text/javascript"></script>
	<script type="text/javascript">
    var fruits = [];
    var data = "";
    $(function (){
            $('#lstFruits').multiselect({
                includeSelectAllOption: true
            });
            $('#btnSelected').click(function () {
                var selected = $("#lstFruits option:selected");
                var message = "";
                selected.each(function () {
                  message += $(this).text()+" "+"\n";
              //  fruits.push(message);
                });
               $("textarea").css({"background-image" :"linear-gradient(160deg,orange,white,green)", "font-size": "20px","text-align": "center"});
               
             
                  // $('#result').html(message);
               document.getElementById("result").innerHTML=message;
               data = message;
              
            });
            
        });

    
        function save(){
        	
        	 window.location="save.htm?msg="+data;
        	 
        }   
    </script>


	<div class="card text-center"
		style="height: 100%; background-image: linear-gradient(160deg, orange, white, green); font-family: 'Times New Roman', Times, serif; font-size: 23px;">

		<div class="card-header;" style="height: 30%">
			<div class="row mt-3">
				<label class=" col-2 font-weight-bolder text-dark">Date :</label>

				<%
						    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy | HH:mm:ss");
							Date date = new Date();
							//System.out.println(formatter.format(date)) ;
					%>
				<%--******date Print***** --%>
				<label class=" col-3 font-weight-bolder text-dark"
					for="exampleInputEmail1"><%=formatter.format(date)%></label>
			</div>
			<form:form action="submitForm.htm" commandName="menu">
				<div class="row mt-3">
					<label class=" col-2 font-weight-bolder text-dark">Services :</label>
					<form:select path="service" class="form-control col-2"
						required="required" style="box-shadow: 1px 2px 3px 4px #4cc912">
						<form:option value="chooseOne">Choose one</form:option>
						<form:option value="breakfast">Breakfast</form:option>
						<form:option value="tea">Tea</form:option>
						<form:option value="lunch">Lunch</form:option>
						<form:option value="snack">Snack</form:option>
						<form:option value="dinner">Dinner</form:option>
						
					</form:select>

					<button type="submit" formaction="submitForm.htm"
						class="btn btn-primary col-1" style="width: 3px;">Retrive</button>

					<label class=" col-2 font-weight-bolder text-dark">Available Items :</label> 
						<select id="lstFruits" multiple size="1" name="productId"
						class="form-control col-3 ">

						<%userList = (List<Item>)request.getAttribute("menu1"); 
                              if(userList != null && !userList.isEmpty()){
                            	  for(Item u : userList)	
                		 {%>

						<option style="font-family: sans-serif; font-size: 2px"
							value="<%=u.getItemId()%>"><%=u.getItemName()%></option>
							
						<%
                         } 
                                       }
                         %>
					</select>



				</div>
				</form:form>
		</div>




		<div class="card-body;" style="height: 80%">

			<div class="row mt-3"></div>
			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col-6 ">
					<button type="button" id="btnSelected"
						class="btn btn-secondary col-2">Add</button>

				</div>
				<div class="col-3"></div>
			</div>

			<div class="row mt-3">
				<div class="col-2"></div>
				<textarea id="result" name="result" rows="10" cols="15"
					class="form-control col-8 "
					style="box-shadow: 1px 2px 3px 4px #4cc912; overflow: scroll;">
                </textarea>

			</div>

			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col-6">
			        <button id="button" onclick="save();" type="submit" class="btn btn-secondary col-2">Save</button>
					<a href="Link.jsp"><button type="button" onclick="" class="btn btn-success col-2">Close</button></a>
				</div>
				<div class="col-3"></div>
			</div>	
		</div>
	</div>
	
</body>

</html>