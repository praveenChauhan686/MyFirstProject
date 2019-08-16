<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="java.util.*"%>    
<%@page import="com.canteen.dto.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<%
UserRegistrationForm user = (UserRegistrationForm) session.getAttribute("user");
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //HTTP 1.1

response.setHeader("Pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0");//proxies

 if(session.getAttribute("user")==null)  //this is because if anyone try to get into login by puting in url as /home.jsp its will not work
response.sendRedirect("homePage.jsp"); 
%>
<script>

	window.history.replaceState(null,null,window.location.href);
    </script>

    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">
var total=0;
var n=0;
function clear(){
	
	console.log("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	/*document.getElementById('staffid').val='';
	document.getElementById('staffname').val='';
	document.getElementById('itemno').value="";
	document.getElementById('itemname').value="";
	document.getElementById('quantity').value="";
	document.getElementById('amount').value="";*/
	$("#staffid").val('');
	
};


function myFunction() {
    location.reload();
};


function  Add(){
	
	
    var txtno = document.getElementById("itemno");
    var txtname = document.getElementById("itemname");
    var txtquant = document.getElementById("quantity");
    var txtamt = Number(document.getElementById("amount").value);
     //var a= parseInt("amount", "3");
     
    total = total + txtamt ;
    document.getElementById("total").value = total;
   // window.alert(total);
   
    var convert = document.getElementById("amount");
    AddRow(txtno.value,txtname.value,txtquant.value, convert.value);
    
    txtno.value = "";
    txtname.value = "";
    txtquant.value = "";
    convert.value = "";
    n++;
    document.getElementById("count").value = n;
    return total;
//console.log(store);
};
function AddRow(no, name,quantity,convert) {
    //Get the reference of the Table's TBODY element.
    var tBody = document.getElementById("tb").getElementsByTagName("TBODY")[0];

    //Add Row.
    row = tBody.insertRow(-1);

    //Add Name cell.
    var cell = row.insertCell(-1);
    cell.innerHTML = no;

    //Add Country cell.
    cell = row.insertCell(-1);
    cell.innerHTML = name;

  //Add Name cell.
    var cell = row.insertCell(-1);
    cell.innerHTML = quantity;
  //Add Name cell.
    var cell = row.insertCell(-1);
    cell.innerHTML = convert;
    
    var cell = row.insertCell(-1);
    var btnRemove = document.createElement("INPUT");
    btnRemove.type = "button";
    btnRemove.value = "Remove";
   
    btnRemove.setAttribute("onclick", "Remove(this)");
   
    cell.appendChild(btnRemove);
    
};

function Remove(button) {
    //Determine the reference of the Row using the Button.
    var row = button.parentNode.parentNode;
    var name = row.getElementsByTagName("TD")[0].innerHTML;
    var oldTotal = Number(document.getElementById("total").value);
    
    var num = row.getElementsByTagName("TD")[3].innerHTML;
    var newTotal = oldTotal-num;
   //  document.getElementById("total").innerHTML = "23";
  
  
  document.getElementById("total").value = newTotal;
   window.alert(num);
   
   
   // Decrease the item count
   --n;
   document.getElementById("count").value = n;
   
   
 // window.alert(newTotal);
    if (confirm("Do you want to delete: " + name)) {

        //Get the reference of the Table.
        var table = document.getElementById("tb");

        //Delete the Table row using it's Index.
        table.deleteRow(row.rowIndex);
    }
};

function save(){
	
	 window.location="saveData.htm?msg="+total;
	 
}



</script>
</head>

<body>
 
     <div  id ="divContainer" class="card text-center " style="height: 100%; background-image: linear-gradient(160deg,orange,white,green);font-family: 'Times New Roman', Times, serif; font-size: 18px;">
        <div class="card-body" style="height:85%">

        
    
   <div class="row">
  
    
       <div class="col-8" style=" height:100%">
       
        <div style="display: flex" class="mt-3">
       
            <div style=" flex: 1">
               
             </div>
            
             <div  style="flex: 2"> 
                
            </div>   
        
        <div style="flex: 1"> 
            <label class=" font-weight-bolder text-dark" >Date :</label>
       </div>
       
        <div style="flex: 1"> 
           <%
						SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy | HH:mm:ss");
							Date date = new Date();
							//System.out.println(formatter.format(date)) ;
					%>
					<%--******date Print***** --%>
					<label class="  font-weight-bolder text-dark">
					<%=formatter.format(date)%></label>
       </div>
       </div>
       
        
        <form:form action="transSubmit.htm" commandName="menu">
        <div class="mt-3" style="display: flex">
           
               
        <div style=" flex: 1;align-content: flex-start;">
           <label class=" font-weight-bolder text-dark" >Service :</label>
        </div>
       
        <div style="flex: 2"> 
           <form:select class="form-control " path="service"  id="servicetype"  style="box-shadow: 1px 2px 3px 4px #4cc912 ;">
                                        <form:option value="chooseOne">Choose One</form:option>
                                        <form:option value="Breakfast">Breakfast</form:option>
                                        <form:option value="Tea">Tea</form:option>
                                        <form:option value="Lunch">Lunch</form:option>
                                        <form:option value="Snack">Snack</form:option>
                                        <form:option value="Dinner">Dinner</form:option>
                                      </form:select>
      
       </div>
      <div style="flex:1">
       <button type="submit" style="" class="btn btn-primary">Retrive</button> 
       </div>
       
      </div> 
       </form:form>
      
       <div class="mt-3" style="display: flex">
      <div style=" flex: 1">
        <label class=" font-weight-bolder text-dark" >Staff Id :</label>
     </div>
    
     <div style="flex: 1"> 
        <input class="form-control" required style="box-shadow: 1px 2px 3px 4px #4cc912" id="staffid"  onblur="ajaxxCall();" placeholder="staff id"/>
        <!--  <div id="ajaxresponse"></div>-->
                                     
   
    </div>
    
     <div style="flex: 2"> 
        <input class="form-control" required style="box-shadow: 1px 2px 3px 4px #4cc912" value="" id="staffname" />
                                     

    </div>
 
       </div>
          
           
          <div class="mt-3">
            <textarea rows="3" cols="15" class="form-control" required
            style="box-shadow: 1px 2px 3px 4px #4cc912;"  
            placeholder="Item Id" required >
            
        </textarea>
          </div>
           

          <div class="mt-3">
            <div style="height:220px; width:870px; background-color: white; box-shadow: 1px 2px 3px 4px #4cc912;overflow: scroll;" class="form-control " readonly  >
            
                     <table class="table" id="tb">
                     <tr>
                     <th>Seq</th>
                     <th>Item</th>
                     <th>Quantity</th>
                     <th>Amount</th>
                     <th>EDIT</th>
                     </tr>
                     <tr id="trow">
                     <td><input type="text" required  style="box-shadow: 1px 2px 3px 4px #4cc912;width:100px" id="itemno" onblur="ajaxxCall2()" placeholder="Seq"></td>
                     <td><input type="text" style="box-shadow: 1px 2px 3px 4px #4cc912;width:100px" val="" id="itemname" readonly></td>
                     <td><input type="text" required id="quantity" onblur="ajaxQuantity()" style="box-shadow: 1px 2px 3px 4px #4cc912;width:100px" placeholder="Quantity"></td>
                     <td><input type="text" style="box-shadow: 1px 2px 3px 4px #4cc912;width:100px"val="" id="amount" readonly></td>
                     <td><button type="button" onclick="Add()" style="box-shadow: 1px 2px 3px 4px #4cc912;width:100px">Add</button></td>
                     </tr>
                     </table>
            
            
            
        </div>
          </div>
         
           
           
       </div>
       
    
       
       
       <!--**********************************DDDDDDiv*************************************************************-->
       <div class="col-4" style="height:100%">
               <div style="height:500px; width:400px;overflow: scroll; background-color: white; box-shadow: 1px 2px 3px 4px #4cc912;" class="form-control " readonly  >
               <table>
               <tr>
               <th>Sr.no</th>
               <th>Item</th>
               </tr>
           <%     
               List <AddItem>userList = (List<AddItem>)request.getAttribute("menu1");
                if(userList != null && !userList.isEmpty()){ 
                	int number=1;
                for(AddItem u : userList){
                 %>
                 <tr><td><%=u.getId() %></td><td><%=u.getItem() %></td></tr>
                 <% number++;
                  }
                 }
               %>               
               
               
               </table>
                    
             </div>                     

       </div>
    <!--***********************************END****DDDDDDDiv********************************************************-->

    </div>
    
</div>
         
        <!--*************************************FFFFFFFFFFooter*******************************************--> 
            
    <div class="card-footer" style="height:15%">


        <div style="display: flex" class="">
       
            <div style=" flex: 1">
                <label class="  text-dark" >No of Items :</label>
             </div>
            
             <div style="flex: 1"> 
                <input type="text" id ="count" class="form-control " required style="box-shadow: 1px 2px 3px 4px #4cc912;"  placeholder="No.Item" required readonly>
            </div>   
        
        <div style="flex: 1"> 
             <label class="  text-dark" >Total :</label> 
            <!-- <button id= "order" onclick="Add()">orderId</button> -->
           
       </div>
       
        <div style="flex: 1" > 
           <input type="text" id="total" class="form-control " required style="box-shadow: 1px 2px 3px 4px #4cc912;"  placeholder="Amount" required readonly>
       </div>

       <div style="flex: 4;">
        <div><button type="button" id="btClearAll" class="btn btn-primary col-2" onclick="myFunction();">Clear</button></div>
        <div><form action="transact.htm"><input type="submit"  class="btn btn-secondary col-2" value="Exit"></form></div>
       
    </div>

</div>

           





          <!--  <div class="row mt-1">
                <div class="col-3"></div>
                <div class="col-6">
                    <button type="button" class="btn btn-primary col-2">Retrive</button>
                    <button type="button" class="btn btn-secondary col-2">Print</button>
                    <button type="button" class="btn btn-secondary col-2">Close</button>

                </div>
                <div class="col-3"></div>
            </div> -->         

    </div>
    <!--*****************************************END**FFFFFFooter*****************************************-->     
    </div> 
    
    
<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function ajaxxCall() {
		
		$.ajax({
			
			method : "GET",
			url : 'getstaffname.htm',
			data : {
				"personId" : $('#staffid').val()
			},
			success : function(responseText) {
			
				$("#staffname").val(responseText)	

			}
		});
	}
</script>   
<!-- <script type="text/javascript">
	function ajaxxCall() {
		$.ajax({
			
			method : "GET",
			url : 'getmenu.htm',
			data : {
				"serviceType" : $('#servicetype').val()
			},
			success : function(responseText) {
			
				$("#staffname").val(responseText)	

			}
		});
	}
</script>   
 -->
<script type="text/javascript">
	function ajaxxCall2() {
		
		
		$.ajax({
			
			method : "GET",
			url : 'getitem.htm',
			data : {
				"itemno" : $('#itemno').val()
			},
			success : function(responseText) {
			
				$("#itemname").val(responseText)	

			}
		});
	}
</script>

<script type="text/javascript">
	function ajaxQuantity() {
		var itemName= document.getElementById("itemname");
		var a=0;
		var b=0;
		var c=0;
		
		$.ajax({
			
			method : "GET",
			url : 'getamount.htm',
			data : {
				"itemname" : $('#itemname').val()
			},
			success : function(responseText) {
			
				//$("#amount").val(responseText)	
				a= $('#quantity').val()
				b=responseText;
				c= a * b;
				$("#amount").val(c)
			}
		});
	}
</script>          


  
</body>


</html>