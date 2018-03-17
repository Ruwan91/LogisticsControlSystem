<%-- 
    Document   : signup
    Created on : Mar 16, 2018, 8:15:44 PM
    Author     : ishan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
      
        <div class="release container" id="releaseC_div" style="box-shadow: 0 0 1px black;display: block;margin-top: 40px;margin-bottom: 40px;">
                  <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                     <div class="form-group" >
                      <label class="control-label col-sm-2">Container ID : </label>
                      <div class="col-sm-5">
                      <input type="text" class="form-control" id="contID">
                      </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Cargo Name : </label>
                      <div class="col-sm-5">
                      <input type="text" class="form-control" id="cname">
                      </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Cargo ID : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="cID">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Cargo Type : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="ctype">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Quantity : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="cquantity">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Customer Name : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="ccustomer">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Customer ID : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="cuID">
                       </div>
                  </div> 
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Rental Price per: Unit  </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="crental">
                       </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Due Date : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="due_date">
                       </div>
                  </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Late Days : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="late_date">
                       </div>
                  </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Additional cost per: Late Day  </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="cost_late_date">
                       </div>
                  </div>
                   <div class="form-group" >
                      <label class="control-label col-sm-2">Total Cost : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="Total_Cost">
                       </div>
                  </div>
                   <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>
                    
                  
                </form>
           </div>  
    </body>
</html>
