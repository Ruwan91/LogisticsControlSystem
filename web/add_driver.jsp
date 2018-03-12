<%-- 
    Document   : add_driver
    Created on : Mar 12, 2018, 1:28:19 PM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 500px">
            <div><h2>New Driver</h2></div>
            <form action="#" name="New Driver">
                <div class="form-group" >
                    <label>Driver Name</label>
                    <input type="text" class="form-control" placeholder="Enter Name.." id="dname" required="true">
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control" placeholder="Enter Address.." id="address" required="true">
                </div>

                <div class="form-group">
                    <label>NIC Number</label>
                    <input type="text" class="form-control" placeholder="Enter NIC.." id="nic" required="true">
                </div>

                <div class="form-group">
                    <label>Driving License Number</label>
                    <input type="text" class="form-control" placeholder="Number of the license" id="dlicennumber" required="true">
                </div>

                <div class="form-group">
                    <label>Contact No</label>
                    <input type="text" class="form-control" placeholder="Phone number.." id="contact" required="true">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </body>
</html>
