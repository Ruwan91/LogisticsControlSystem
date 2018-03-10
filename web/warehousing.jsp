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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <title>warehousing</title>
   <style>
       .form-group{width:50%;}
   </style>
</head>
<body>
   <div class=" container" style="background-color: yellow;width: 100%;padding-top: 5px;">
       
       <div class="header container">
       <button class="headbtn btn btn-default"  onclick="getElementById('insertcargo').style.display = 'block'; ">Insert Cargo</button>
        <button class="headbtn btn btn-default" >Search</button>
        <button class="headbtn btn btn-default" >Release Cargo</button>
        </div>
       
         <div class="warehousecontent container" style="background-color:red;width: 100%;margin-left: 0%;margin-top: 5px;">
            <h1>Container</h1>
            <div class=" container-collapse collapse " id="insertcargo" style="display: none;">
                <form class="form-horizontal" action="#">
                  <div class="form-group" >
                      <label>Cargo Name : </label>
                      <input type="text" class="form-control" id="cname">
                  </div>
                  <div class="form-group" >
                      <label>Cargo ID : </label>
                      <input type="text" class="form-control" id="cID">
                  </div>
                  <div class="form-group" >
                      <label>Cargo Type : </label>
                      <input type="text" class="form-control" id="ctype">
                  </div>
                  <div class="form-group" >
                      <label>Quantity : </label>
                      <input type="text" class="form-control" id="cquantity">
                  </div>
                  <div class="form-group" >
                      <label>Customer Name : </label>
                      <input type="text" class="form-control" id="ccustomer">
                  </div>
                  <div class="form-group" >
                      <label>Customer ID : </label>
                      <input type="text" class="form-control" id="cuID">
                  </div> 
                  <div class="form-group" >
                      <label>Rental Price per Unit : </label>
                      <input type="text" class="form-control" id="crental">
                  </div>
                   
                </form>
            </div>
            <script>
    var hidden = false;
    function action() {
        hidden = !hidden;
        if(hidden) {
            document.getElementById('insertcargo').style.visibility = 'hidden';
        } else {
            document.getElementById('insertcargo').style.visibility = 'visible';
        }
    }
</script>

         </div>
         </div>
            

            
            
        
    </body>
</html>
