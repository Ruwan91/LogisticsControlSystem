<%-- 
    Document   : delivery_history
    Created on : Mar 13, 2018, 12:07:50 AM
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
        <div style="width: 800px">
            <form action="#">
                <table class="table" >
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Delivery Id</th>
                            <th scope="col">Vehicle Id</th>
                            <th scope="col">Delivery Distance</th>
                            <th scope="col">Driver Name</th>
                            <th scope="col">Date</th>
                            <th scope="col">Charge(Rs.)</th>
                            <th scope="col">Destination Address</th>
                            <th scope="col">Invoice Id</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>GHF6285</td>
                            <td>Moratuwa</td>
                            <td>Saman Kumara</td>
                            <td>2018-03-12</td>
                            <td>8000</td>
                            <td>20,Kirula Road,Moratuwa</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>AAF5196</td>
                            <td>Panadura</td>
                            <td>Kasun Chamara</td>
                            <td>2018-03-13</td>
                            <td>8200</td>
                            <td>20,Malwaththa Road,Panadura</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-primary" >View Delivery History</button>
            </form>
        </div>
    </body>
</html>
