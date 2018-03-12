<%-- 
    Document   : delivery_history
    Created on : Mar 12, 2018, 10:14:48 PM
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
            <div><h2>Search Delivery</h2></div>
            <form action="#" name="New Driver">
                <div class="form-group" >
                    <label>Delivery ID</label>
                    <input type="text" class="form-control" placeholder="Enter Delivery Id" id="deliveryid" required="true">
                </div>

                <div class="form-group" >
                    <label>Vehicle Number</label>
                    <input type="text" class="form-control" readonly value="">
                </div>
                <div class="form-group" >
                    <label>Delivery Destination</label>
                    <input type="text" class="form-control" readonly value="">
                </div>

                <div class="form-group">
                    <label>Driver Name</label>
                    <input type="text" class="form-control"readonly value="">
                </div>

                <div class="form-group">
                    <label>Date </label>
                    <input type="text" class="form-control" readonly value="">
                </div>
                <div class="form-group" >
                    <label>Invoice NO</label>
                    <input type="text" class="form-control" readonly value="">
                </div>
                <div class="form-group">
                    <label>Destination Address</label>
                    <input type="text" class="form-control" readonly value="">
                </div>
                <div class="form-group">
                    <label>Charge</label>
                    <input type="text" class="form-control" readonly value="">
                </div>
                <button type="submit" class="btn btn-primary">Search Delivery</button>
            </form>
        </div>
    </body>
</html>
