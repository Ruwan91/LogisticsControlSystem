<%-- 
    Document   : Warhousing
    Created on : Mar 4, 2018, 7:03:18 PM
    Author     : ishan
--%>
<%@page import="edu.sliit.logistics_control_system.controller.ishan_controller.Stack_Cargo"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="edu.sliit.logistics_control_system.connection.MySQLConnection"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  <title>warehousing</title>
  <script>
     

window.onload = function () {

    var chart = new CanvasJS.Chart("chartContainer2", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: ""
	},
	axisY: {
		title: "Quantities"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Cargo Types",
		dataPoints: [      
			{ y: 300878, label: "Danger Cargo" },
			{ y: 266455,  label: "Food Cargo" },
			{ y: 169709,  label: "Refregirator Cargo" },
			{ y: 158400,  label: "Normal Cargo" },
			
		]
	}]
});
chart.render();

}


</script>
 <%!    
        public void conn(){
                            try {
                                
                                    Connection con=MySQLConnection.getConnection();
                                     Statement stmt=con.createStatement();
                                     
                                } catch (ClassNotFoundException ex) {
                                    Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
                                } catch (SQLException ex) {
                                    Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
                                }
 }
                            %>
</head>
<body id="wareH" style="display: block;" >
    
 
   <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
    <header>
       <div class="header container" style="width: 100%;">
           
           <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;padding-bottom: 20px;"><h1 id="nnnnnn">Warehousing</h1>
               <div class=" dropdown">
               <input type="text" class="form-control dropdown-toggle" data-toggle="dropdown" id="shearch" placeholder="Search" >
              
                    <ul class="dropdown-menu">
                        <li><a >ishan</a></li>
                        <li><a >kalindu</a></li>
                        <li><a >rishitha</a></li>
                    </ul>
               
               </div>
           </div>
           
           <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">
            
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" onclick="home()">Home</a></li>
                    <li><a data-toggle="tab"  onclick="insertcargo()">Insert Cargo</a></li>
                   
                    <li><a data-toggle="tab" onclick="releasecargo()">Release Cargo</a></li>
                    <li><a data-toggle="tab" onclick="warehousingspace()" >Warehousing space</a></li>
                    <li><a data-toggle="tab" onclick="history()">History</a></li>
                </ul>
           </div>
       </div>
    </header>
       
    <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
        <div class="container" style="margin-left: 30%;"><h1 id="Whead">Warehouse Home</h1></div>
       
<%--..................................Home.............................................................................................................................................................--%>
       
        <section>
           <div class="warehousing_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">
               
               <div id="chartContainer" style="width: 100%; height: 300px ; display: block;margin-top: 50px;margin-bottom:  50px;"></div> 
                 <script type="text/javascript"> 
  


                    $("#chartContainer").CanvasJSChart({ 
                        title: { 
			text: "Stacked Cargo   - This Week",
			fontSize: 24,
                     
                        }, 
                        axisY: { 
                    	title: "Products in %" 
                        }, 
                        legend :{ 
			verticalAlign: "center", 
			horizontalAlign: "right" 
                        }, 
                        data: [ 
                        { 
			type: "pie", 
			showInLegend: true, 
			toolTipContent: "{label} <br/> {y} %", 
			indexLabel: "{y} %", 
			dataPoints: [ 
                                        { label: "Normal Cargo",  y: 30.3, legendText: "Normal Cargo"}, 
                                        { label: "Danger Cargo",    y: 5.1, legendText: "Danger Cargo"  }, 
                                        { label: "Food Cargo",   y: 4.0,  legendText: "Food Cargo" }, 
                                        { label: "Refregirator Cargo",       y: 3.8,  legendText: "Refregirator Cargo"}, 
				
                                    ] 
                        } 
                             ] 
                    }); 
        
                 </script> 
               <div class="content tab-pane fade in active">
               <h2>Recent Cargo Stacking</h2> 
               <div style="margin-top: 20px;margin-bottom: 20px;">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Cargo Name</th>
                                <th>Cargo Type</th>
                                <th>Quantity</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>23</td>
                                <td>vishwa</td>
                                <td>Fuel Barell</td>
                                <td>Danger Cargo</td>
                                <td>22</td>
                                <td>1/2/2018</td>
                            </tr>
                            <tr>
                                <td>83</td>
                                <td>rishitha</td>
                                <td>Mortors</td>
                                <td>Normal Cargo</td>
                                <td>46</td>
                                <td>20/8/2018</td>
                            </tr>
                            <tr>
                                <td>238</td>
                                <td>ishan</td>
                                <td>Fish Barells</td>
                                <td>Food Cargo</td>
                                <td>89</td>
                                <td>7/2/2018</td>
                            </tr>
                        </tbody>
                    </table>
               </div>
               <div class="caontainer">
                   <h2>Recent Payments</h2>
                   <div style="margin-top: 20px;margin-bottom: 20px;">
                         <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Cargo Type</th>
                                <th>Quantity</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>12</td>
                                <td>Ishan</td>
                                <td>Danger Cargo</td>
                                <td>25</td>
                                <td>2/5/2018</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Ruwan.P</td>
                                <td>Food Cargo</td>
                                <td>225</td>
                                <td>6/5/2018</td>
                            </tr>
                            <tr>
                                 <td>12</td>
                                <td>Kisal</td>
                                <td>Normal Cargo</td>
                                <td>23</td>
                                <td>25/5/2018</td>
                            </tr>
                        </tbody>
                    </table>
                   </div>
               </div>
               </div>
           </div>
       </section>
    
<%--..................................Insertion Form.............................................................................................................................................................--%>
      
        <section>
            <div class="insert-cargo container" id="insertcargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                
                <form class="form-horizontal" action="#" style="margin-top: 20px;margin-left: 10%;" >
                     <div class="form-group" style="">
                      <label class="control-label col-sm-2">Order ID : </label>
                      <div class="col-sm-3">
                      
                            
                            <select class="form-control" id="sel1">
                                
                            <%
                            try {
                                     /* TODO output your page here. You may use following sample code. */
                
                                     Connection con=MySQLConnection.getConnection();
                                     Statement stmt=con.createStatement();
                                    String sql="SELECT o.orderid ,ord.orderdetailid,o.date FROM  order2 o,orderdetail ord WHERE o.orderid=ord.orderid and iswarehouse=1 ORDER BY o.date DESC ";
                                    String sql2="";
                                    ResultSet rs=stmt.executeQuery(sql);
                                     int i=0;   
                                     while(rs.next()){ i++;}
                                     rs.beforeFirst();
                                     int orderid[]=new int[i];
                                    
                                     i=0;
                                       while( rs.next()){
                                         
                                         orderid[i]=rs.getInt("orderid");
                                       
                                        out.print("<option>"+orderid[i]+ "</option>");
                                        i++;
                                       }
                                   
                     
                                    con.close();
                                } catch (ClassNotFoundException ex) {
                                    Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
                                } catch (SQLException ex) {
                                    Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            %>
                            </select>
               
                      </div>
                 
                     
                     
                      
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Cargo Name : </label>
                      <div class="col-sm-3">
                      
                      <script>
                          var e = document.getElementById("sel1");
                          var odid = e.options[e.selectedIndex].value;
                          console.log(odid);
                      </script>
                      <%! int orderid=0;%>
                      <%
                            try {
                                     /* TODO output your page here. You may use following sample code. */
                                       
                                     Connection con=MySQLConnection.getConnection();
                                     Statement stmt=con.createStatement();
                                    String sql="SELECT it.itemid,it.it_name,o.orderid,o.date from item it,orderdetail ord ,order2 o WHERE it.itemid=ord.itemid and o.orderid=ord.orderid and ord.iswarehouse=1 and o.orderid=1 ORDER BY o.date DESC ";
                                    String sql2="";
                                    ResultSet rs=stmt.executeQuery(sql);
                                     rs.next();                                 
                                                                   
                                     orderid=rs.getInt("orderid");
                                    
                                } catch (ClassNotFoundException ex) {
                                    Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
                                } catch (SQLException ex) {
                                    Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            %>
                            <input type="text" class="form-control" name="cname" value="<%=orderid%>">
                      </div>
                 
                 
                  
                      <label class="control-label col-sm-3">Cargo Type : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" name="ctype">
                       </div>
                   </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Quantity : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" name="cquantity">
                       </div>
                  </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Customer Name : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" name="ccustomer">
                       </div>
                 
                    
                 
                      <label class="control-label col-sm-3">Customer ID : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" name="cuID">
                       </div>
                    </div>
               
               
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Rental Price per Unit : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" name="crental">
                       </div>
                      <label class="control-label col-sm-3">Total Cost : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" name="cuID">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2"> Date : </label>
                       <div class="input-group date col-sm-3" data-provide="datepicker">
                           <input type="text" class="form-control" name="currentdate" id="WI_currentdate">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-th"></span>
                                </div>
                        </div>
                        <script>
                            var today = new Date();
                            var dd = today.getDate();
                            var mm = today.getMonth()+1; //January is 0!
                            var yyyy = today.getFullYear();
    
                            if(dd<10) {
                                dd = '0'+dd
                            } 

                            if(mm<10) {
                                 mm = '0'+mm
                            } 

                                today = mm + '/' + dd + '/' + yyyy;
                                document.getElementById("WI_currentdate").value=today;
                                
                               
                        </script>
                  </div>
                    <div class="form-group" >
                      <label class="control-label col-sm-2">Due Date : </label>
                       <div class="input-group date col-sm-3" data-provide="datepicker">
                             <input type="text" class="form-control" name="duedate">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-th"></span>
                                </div>
                        </div>
                  </div>
                    <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;" action="warehousing.jsp" onclick="insertdata()">Submit</button>
                   
                </form>
               
        <%-- .............Insertion Table..................................................--%>
                
                <div style="margin-top: 20px;margin-bottom: 20px;">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Cargo Name</th>
                                <th>Cargo Type</th>
                                <th>Quantity</th>
                                <th>Receive Date</th>
                                <th>Due Date</th>
                            </tr>
                        </thead>
                        <tbody>
                           
                            <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                            </tr>
                            
                      
                        </tbody>
                    </table>
               </div>
        
            </div>
       </section>
 
<%-- .......................Search Form .............................................................................................................................................................    --%>
       
       <section>
           <div class="search container" id="searchC_div" style="box-shadow: 0 0 1px black;display: none">
                
              
           </div>  
       </section>

<%--............................Release Cargo Form ................................................................................................................................................................--%>
      
       <section>
           <div class="release container" id="releaseC_div" style="box-shadow: 0 0 1px black;display: none">
                  
                <form class="form-horizontal" action="#" style="margin-top: 20px;margin-left: 10%;">
                     <div class="form-group" style="">
                      <label class="control-label col-sm-2">Container ID : </label>
                      <div class="col-sm-3">
                      
                            
                                 <select class="form-control" id="sel1">
                                        <option>1</option>
                                     <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            
                      </div>
                 
                     
                      <label class="control-label col-sm-3">Cargo ID : </label>
                       <div class="col-sm-3">
                      <select class="form-control" id="sel1">
                                        <option>1</option>
                                     <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                             </div>
                      
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Cargo Name : </label>
                      <div class="col-sm-3">
                      <input type="text" class="form-control" id="cname">
                      </div>
                 
                 
                  
                      <label class="control-label col-sm-3">Cargo Type : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="ctype">
                       </div>
                   </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Quantity : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="cquantity">
                       </div>
                  </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Customer Name : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="ccustomer">
                       </div>
                 
                    
                 
                      <label class="control-label col-sm-3">Customer ID : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="cuID">
                       </div>
                    </div>
               
               
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Cost : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="crental">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Due Date : </label>
                       <div class="input-group date col-sm-3" data-provide="datepicker">
                             <input type="text" class="form-control">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-th"></span>
                                </div>
                        </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2"> Date : </label>
                       <div class="input-group date col-sm-3" data-provide="datepicker">
                             <input type="text" class="form-control">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-th"></span>
                                </div>
                        </div>
                  </div>
                    <div class="form-group" >
                      <label class="control-label col-sm-2">Late Days : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="ccustomer">
                       </div>
                 
                    
                 
                      <label class="control-label col-sm-3">cost per Late Day : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="cuID">
                       </div>
                    </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Total Cost : </label>
                       <div class="col-sm-3">
                      <input type="text" class="form-control" id="crental">
                       </div>
                  </div>
                    <button type="submit" class="btn btn-default" onclick="javascript: reload()" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>
                   
                </form>
               
       <%-- .............Released Table..................................................--%>
                
                <div style="margin-top: 20px;margin-bottom: 20px;">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Cargo Name</th>
                                <th>Cargo Type</th>
                                <th>Quantity</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>23</td>
                                <td>vishwa</td>
                                <td>Fuel Barell</td>
                                <td>Danger Cargo</td>
                                <td>22</td>
                                <td>1/2/2018</td>
                            </tr>
                            <tr>
                                <td>83</td>
                                <td>rishitha</td>
                                <td>Mortors</td>
                                <td>Normal Cargo</td>
                                <td>46</td>
                                <td>20/8/2018</td>
                            </tr>
                            <tr>
                                <td>238</td>
                                <td>ishan</td>
                                <td>Fish Barells</td>
                                <td>Food Cargo</td>
                                <td>89</td>
                                <td>7/2/2018</td>
                            </tr>
                        </tbody>
                    </table>
               </div>
                       
           </div>  
       </section>   

<%--............................Warehouse Space.............................................................................................................................................................................--%>
     
       <section>
           <div class="space container" id="Wspace_div" style="box-shadow: 0 0 1px black;display: none;font-size: 20px;">
          
               <div id="chartContainer2" style="height: 370px; width: 50%;margin-left: 25%;margin-top: 50px;margin-bottom: 50px;"></div>

      
           </div>  
       </section> 

<%--............................History..............................................................................................................................................................--%>

       <section>
           <div class="history container" id="historyC_div" style="box-shadow: 0 0 1px black;display: none">
                
               <div class="content tab-pane fade in active">
               <h2> Cargo Stacking</h2> 
               <div style="margin-top: 20px;margin-bottom: 20px;" >
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Cargo Name</th>
                                <th>Cargo Type</th>
                                <th>Quantity</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>23</td>
                                <td>vishwa</td>
                                <td>Fuel Barell</td>
                                <td>Danger Cargo</td>
                                <td>22</td>
                                <td>1/2/2018</td>
                            </tr>
                            <tr>
                                <td>83</td>
                                <td>rishitha</td>
                                <td>Mortors</td>
                                <td>Normal Cargo</td>
                                <td>46</td>
                                <td>20/8/2018</td>
                            </tr>
                            <tr>
                                <td>238</td>
                                <td>ishan</td>
                                <td>Fish Barells</td>
                                <td>Food Cargo</td>
                                <td>89</td>
                                <td>7/2/2018</td>
                            </tr>
                        </tbody>
                    </table>
               </div>
               <div class="caontainer">
                   <h2> Payments</h2>
                   <div style="margin-top: 20px;margin-bottom: 20px;">
                         <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Cargo Type</th>
                                <th>Quantity</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>12</td>
                                <td>Ishan</td>
                                <td>Danger Cargo</td>
                                <td>25</td>
                                <td>2/5/2018</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Ruwan.P</td>
                                <td>Food Cargo</td>
                                <td>225</td>
                                <td>6/5/2018</td>
                            </tr>
                            <tr>
                                 <td>12</td>
                                <td>Kisal</td>
                                <td>Normal Cargo</td>
                                <td>23</td>
                                <td>25/5/2018</td>
                            </tr>
                        </tbody>
                    </table>
                   </div>
               </div>
               </div>
           </div>  
       </section>   
             
            
            <script>
                function reload(){
    var container = document.getElementById("releaseC_div");
    var content = container.innerHTML;
    container.innerHTML= content; 
    
   //this line is to watch the result in console , you can remove it later	
    console.log("Refreshed"); 
}
                        function home(){
                             location.reload(true);
                            document.getElementById("Whead").innerHTML='Warehouse Home';
                            document.getElementById("ware_home_div").style.display='block';
                             document.getElementById("insertcargo").style.display='none';
                              document.getElementById("searchC_div").style.display='none';
                              document.getElementById("releaseC_div").style.display='none';
                               document.getElementById("Wspace_div").style.display='none';
                                 document.getElementById("historyC_div").style.display='none';
                            
                        }
                        function insertcargo(){
                           
                             document.getElementById("Whead").innerHTML='Insert Cargo Details';
                             document.getElementById("ware_home_div").style.display='none';
                             document.getElementById("insertcargo").style.display='block';
                              document.getElementById("searchC_div").style.display='none';
                              document.getElementById("releaseC_div").style.display='none';
                               document.getElementById("Wspace_div").style.display='none';
                                 document.getElementById("historyC_div").style.display='none';
                            
                        }
                        function search1(){
                             document.getElementById("Whead").innerHTML='Search Cargo Details';
                             document.getElementById("ware_home_div").style.display='none';
                             document.getElementById("insertcargo").style.display='none';
                              document.getElementById("searchC_div").style.display='block';
                              document.getElementById("releaseC_div").style.display='none';
                               document.getElementById("Wspace_div").style.display='none';
                                 document.getElementById("historyC_div").style.display='none';
                            
                        }
                        function releasecargo(){
                             document.getElementById("Whead").innerHTML='Release Cargo ';
                             document.getElementById("ware_home_div").style.display='none';
                             document.getElementById("insertcargo").style.display='none';
                              document.getElementById("searchC_div").style.display='none';
                              document.getElementById("releaseC_div").style.display='block';
                               document.getElementById("Wspace_div").style.display='none';
                                 document.getElementById("historyC_div").style.display='none';
                            
                        }
                        function warehousingspace(){
                          
        
                          
                             document.getElementById("Whead").innerHTML='Warehouse Space';
                             document.getElementById("ware_home_div").style.display='none';
                             document.getElementById("insertcargo").style.display='none';
                              document.getElementById("searchC_div").style.display='none';
                              document.getElementById("releaseC_div").style.display='none';
                               document.getElementById("Wspace_div").style.display='block';
                                 document.getElementById("historyC_div").style.display='none';
                        }
                        function history(){
                             document.getElementById("Whead").innerHTML='Warehouse History';
                             document.getElementById("ware_home_div").style.display='none';
                             document.getElementById("insertcargo").style.display='none';
                              document.getElementById("searchC_div").style.display='none';
                              document.getElementById("releaseC_div").style.display='none';
                               document.getElementById("Wspace_div").style.display='none';
                                 document.getElementById("historyC_div").style.display='block';
                            
                        }
                
            </script>
    </div>
   </div>

</body>
</html>
