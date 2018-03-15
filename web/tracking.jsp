<%-- 
    Document   : Warhousing
    Created on : Mar 4, 2018, 7:03:18 PM
    Author     : ishan
--%>


<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 
    <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>tracking</title>
  
  
</head>
<body id="wareH" style="display: block;" >
   <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
    <header>
       <div class="header container" style="width: 100%;">
           
           <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1 id="nnnnnn">Warehousing</h1></div>
           
           <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">
            
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" onclick="tracking()">Tracking</a></li>
                    <li><a data-toggle="tab"  onclick="damagecargo()">Damage Cargo</a></li>
                    <li><a data-toggle="tab" onclick="filnalize()">Finalizing</a></li>
                   
                </ul>
           </div>
       </div>
    </header>
       
    <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
        <div class="container" style="margin-left: 30%;"><h1 id="Whead">Track Cargo</h1></div>
       <section>
           <div class="tracking container tab-content" id="track_div" style="box-shadow: 0 0 1px black;display: block;">
              
 
                <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                     <div class="form-group" >
                      <label class="control-label col-sm-2">Container ID : </label>
                      <div class="col-sm-5">
                      <input type="text" class="form-control" id="contID">
                      </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Customer ID : </label>
                      <div class="col-sm-5">
                      <input type="text" class="form-control" id="customerID">
                      </div>
                  </div>
                  <div class="form-group" >
                      <label class="control-label col-sm-2">Shipment ID : </label>
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="shipID">
                       </div>
            
           
         
         
                   <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>
                   
                </form>
            </div>
          
       </section>
    
        <section>
         
          
             <%--Damage Cargo Form--%>

            
            <div class="damage_Cargo container" id="Damagecargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
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
                      <label class="control-label col-sm-2">Rental Price per Unit : </label>
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
                    <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>
                   
                </form>
            </div>
             
             <%--Damage Form END--%>
             
      

        
       </section>
       <section>
           <div class="Finalizing container" id="FinalizingCC_div" style="box-shadow: 0 0 1px black;display: none">
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
                      <label class="control-label col-sm-2">Rental Price per Unit : </label>
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
                  
                     <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox" style="float: left;">
                                <label><input type="checkbox" name="remember"> Released Cargo</label>
                            </div>
                            <div class="checkbox" style="margin-left: 20%;">
                                <label><input type="checkbox" name="remember"> Received Cargo</label>
                            </div>
                        </div>
                     </div>
                     <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Search</button>
                  
                </form>
           </div>  
       </section>
     
             
            
                   <script>
                        function trackin(){
                            document.getElementById("Whead").innerHTML='Tracking Cargo';
                            document.getElementById("track_div").style.display='block';
                             document.getElementById("Damagecargo").style.display='none';
                              document.getElementById("FinalizingCC_div").style.display='none';
                            
                            
                        }
                        function damagecargo(){
                              document.getElementById("Whead").innerHTML='Damage Cargo';
                            document.getElementById("track_div").style.display='none';
                             document.getElementById("Damagecargo").style.display='block';
                              document.getElementById("FinalizingCC_div").style.display='none';
                            
                            
                        }
                        function filnalise(){
                             document.getElementById("Whead").innerHTML='Finanlise Cargo';
                            document.getElementById("track_div").style.display='none';
                             document.getElementById("Damagecargo").style.display='none';
                              document.getElementById("FinalizingCC_div").style.display='block';
                            
                        }
                       
                
            </script>
    </div>
   </div>

</body>
</html>
