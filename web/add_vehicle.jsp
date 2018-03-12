<%-- 
    Document   : add_vehicle
    Created on : Mar 12, 2018, 3:41:41 PM
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
        <div style="width: 200px">
            <div><h2>New Vehicle</h2></div>
            <form action="#" name="New Driver">
                <div class="form-group" >
                    <label>Vehicle Type</label>
                    <select class="form-control" id="vtypeid" name="vtypeid">
                        <option selected value="0">Select Vehicle Type</option>
                        <option value="1">20'Container</option>
                        <option value="2">40'Container</option>
                        <option value="3">20'Refrigerated Lorry</option>
                        <option value="4">14'Refrigerated mini Lorry</option>
                        <option value="5">30'Cargo Truck</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Vehicle Number</label>
                    <input type="text" class="form-control" placeholder="CAB6023" id="vnumber" required="true">
                </div>

                <div class="form-group">
                    <label>Fixed Charge</label>
                    <input type="text" class="form-control" id="fixcharge" required="true">
                </div>

                <div class="form-group">
                    <label>Charges Per km </label>
                    <input type="text" class="form-control" id="perkm" required="true">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </body>
</html>
