<%-- 
    Document   : delivery
    Created on : Mar 14, 2018, 2:16:00 PM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>delivery</title>
        <script>
            //creating XML HTTP Request
            function createXMLHttpRequest() {
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }


        </script>

    </head>
    <body id="wareH" style="display: block;" >
        <div class="container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="container" style="width: 100%;">

                    <div class="container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1>Delivery</h1></div>

                    <div class="navcontainer container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="deliverydash()">Dashboard</a></li>
                            <li><a data-toggle="tab" onclick="newdelivery(); fillTheDeliveryDestinationList(); fillTheDeliveryVehicleNumberList(); fillTheDriverList();">New Delivery</a></li>
                            <li><a data-toggle="tab" onclick="searchdelivery(); fillTheVehicleNumberList();fillDriverList(); fillTheCustomersList();"><span class="glyphicon glyphicon-search"></span> Search Delivery</a></li>
                            <li><a data-toggle="tab" onclick="alldelivery(); loadAllDeliveries();">All Delivery</a></li>
                            <li><a data-toggle="tab" onclick="newdriver()">Add New Driver</a></li>
                            <li><a data-toggle="tab" onclick="newvehicle(); fillVihicleTypeList();">Add New Vehicle</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <div class="deliverycontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Delivery Dashboard</h1></div>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%-- 1./ Delivery dashboard starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="delivery_dash container tab-content" id="delivery_dash_div" style="box-shadow: 0 0 1px black;display: block;">
                        <div class="content tab-pane fade in active">
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">

                                </div>
                            </div>

                        </div>
                    </div>
                </section>
                <%-- Delivery dashboard ends here --%>


                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%-- 2./ New Delivery section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="new_delivery container" id="new_delivery" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                        <form class="form-horizontal" style="margin-top: 5px;margin-left: 15%;" onload="fillTheDeliveryDestinationList()">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5" id="selectingDeleveryVehicleNumbers_div">
                                    <%-- Here loading the Delivery Vehicle Number list using ajax fillTheDeliveryVehicleNumberList() method --%>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery Destination</label>
                                <div class="col-sm-5" id="selectingDeleveryDistance_div">
                                    <%-- Here loading the Delivery Destinations list using ajax fillTheDeliveryDestinationList() method --%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Driver</label>
                                <div class="col-sm-5" id="selectingDriverId_div">
                                    <%-- Here loading the Driver names with ids list using ajax fillTheDriverList() method --%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Date</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="deldate" required="true" >
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Order Id</label>
                                <div class="col-sm-5">
                                    <input type="number" class="form-control" placeholder="Enter Invoice Number." id="delorderId" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Destination Address</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Address here" id="deldestaddress" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary" onclick="addDeliveryForm()">Save Delivery </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <font id="addDeliveryResult"></font>
                                </div>
                            </div>
                        </form>
                        <script>
                            // add delivery details method using ajax
                            function addDeliveryForm() {
                                var delvnumber = document.getElementById("delvnumber").value;
                                var delddname = document.getElementById("delddname").value;
                                var deldriverid = document.getElementById("deldriverid").value;
                                var deldate = document.getElementById("deldate").value;
                                var delorderId = document.getElementById("delorderId").value;
                                var deldestaddress = document.getElementById("deldestaddress").value;
                                //Check weather that addDelevery form inputs and not empty and select correct options 
                                if (delvnumber !== 'none' && delddname !== 'none' && deldriverid !== 'none' && deldate !== '' && delorderId !== '' && deldestaddress !== '') {
                                    //Create XMLHttpRequest object
                                    var request = createXMLHttpRequest();
                                    //Create url to communicate with the server with ajax
                                    var url = "AddDelivery?delvnumber=" + delvnumber + "&delddname=" + delddname + "&deldriverid=" + deldriverid + "&deldate=" + deldate + "&delorderId=" + delorderId + "&deldestaddress=" + deldestaddress;
                                    //XMLHttpRequest object contains request method open GET method and pass the url through it
                                    request.open("GET", url, true);
                                    //Setting request header
                                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                    request.send(null);
                                    //Every time ready stage changes hold the states of XMLHttpRequest
                                    request.onreadystatechange = function () {
                                        //Check is thet request is finished and respond is ready
                                        if (request.readyState == 4) {
                                            //Check that the server side status success
                                            if (request.status == 200) {
                                                //After server side process happen successfully set the result to addDeliveryResult this is a <font>
                                                document.getElementById("addDeliveryResult").innerHTML = request.responseText;
                                                //Recalling the fillTheDeliveryDestinationList() to set default mood
                                                fillTheDeliveryDestinationList();
                                                //Recalling the fillTheDeliveryVehicleNumberList() to set default mood
                                                fillTheDeliveryVehicleNumberList();
                                                //Recalling the fillTheDriverList() to set default mood
                                                fillTheDriverList();
                                                //Make all input fields to empty mood
                                                document.getElementById("deldate").value = "";
                                                document.getElementById("delorderId").value = "";
                                                document.getElementById("deldestaddress").value = "";

                                            }
                                        }
                                    }
                                }
                            }

                            //Loading Delivery Destinations to New Delivery Form Delevery Destination
                            function fillTheDeliveryDestinationList() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchDeliveryDestinationForDelivery";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingDeleveryDistance_div this is an Option list
                                            document.getElementById("selectingDeleveryDistance_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }

                            //Loading Delivery Vehicle numbers to New Delivery Form Vehicle
                            function fillTheDeliveryVehicleNumberList() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchAllVehicleNumbersForAddDelivery";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingDeleveryVehicleNumbers_div this is an Option list
                                            document.getElementById("selectingDeleveryVehicleNumbers_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }
                            //Loading Drivers name with id to New Delivery Form Friver Id
                            function fillTheDriverList() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchAllDriverNamesForAddDelivery";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingDriverId_div this is an Option list
                                            document.getElementById("selectingDriverId_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }
                        </script>
                    </div>
                </section>
                <%--New Delivery section ends here --%>


                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%-- 3./ Search Delivery section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="search container" id="search_delivery_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 0%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-1">Vehicle Number</label>
                                <div class="col-sm-2" id="selectingVehicleNumbers_div">
                                    <%-- Here loading the Delivery Vehicle Number list using ajax fillTheVehicleNumberList() method --%>
                                </div>
                                <label class="control-label col-sm-1">Driver Name</label>
                                <div class="col-sm-2" id="selectingDriverNames_div">
                                    <%-- Here loading the Driver names with ids list using ajax fillTheDeliveryDestinationList() method --%>
                                </div>
                                <label class="control-label col-sm-1">Customer Name</label>
                                <div class="col-sm-2" id="selectingCustomerNames_div">
                                    <%-- Here loading the Driver names with ids list using ajax fillTheCustomersList() method --%>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-1">Date </label>
                                <div class="col-sm-2">
                                    <input type="date" class="form-control"  id="searchdate">
                                </div>
                                <label class="control-label col-sm-1" >Order Id</label>
                                <div class="col-sm-2">
                                    <input type="number" class="form-control"  placeholder="Enter Order Id" id="searchorderId">
                                </div>
                                <label class="control-label col-sm-1">Delivery ID</label>
                                <div class="col-sm-2">
                                    <input type="number" class="form-control" placeholder="Enter Delivery Id" id="searchdeliveryid" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-2" >
                                    <button type="button" class="btn btn-primary" onclick="searchDeliveryDetails()">Search Delivery</button>
                                </div>
                            </div>
                            <div class="container" id="searchedDeliveryDetails_div">
                                <%-- Here loading all the delivery details as a table with ajax using loadAllDeliveries() method --%>
                            </div>
                        </form>
                        <script>
                            //Search Delivery Details
                            function searchDeliveryDetails() {
                                var searchdeliveryid = document.getElementById("searchdeliveryid").value;
                                var delvnumber = document.getElementById("searchdelvnumber").value;
                                var deldriverid = document.getElementById("searchdeldriverid").value;
                                var searchdate = document.getElementById("searchdate").value;
                                var searchorderId = document.getElementById("searchorderId").value;
                                var customerName = document.getElementById("customerid").value;
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearcheDeliveryDetails?searchdeliveryid=" + searchdeliveryid + "&delvnumber=" + delvnumber + "&deldriverid=" + deldriverid + "&searchdate=" + searchdate + "&searchorderId=" + searchorderId + "&customerName=" + customerName;
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingDeleveryVehicleNumbers_div this is an Option list
                                            document.getElementById("searchedDeliveryDetails_div").innerHTML = request.responseText;


                                        }
                                    }
                                }
                            }

                            //Loading Delivery Vehicle numbers to Search Delivery Details Form
                            function fillTheVehicleNumberList() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchAllVehicleNumbersForSearch";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingDeleveryVehicleNumbers_div this is an Option list
                                            document.getElementById("selectingVehicleNumbers_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }
                            //Loading Drivers name with id to New Delivery Form Friver Id
                            function fillDriverList() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchAllDriverNamesForSearch";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingDriverId_div this is an Option list
                                            document.getElementById("selectingDriverNames_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }
                            //Loading Customer List
                            function  fillTheCustomersList() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "GetAllCustomers";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to searchedDeliveryDetails_div this is a table
                                            document.getElementById("selectingCustomerNames_div").innerHTML = request.responseText;
                                        }
                                    }
                                }
                            }




                            //Loading all the Deliveries function
//                            function loadDeliveries() {
//                                //Create XMLHttpRequest object
//                                var request = createXMLHttpRequest();
//                                //Create url to communicate with the server with ajax
//                                var url = "SearchedAllDeliveryDetail";
//                                //XMLHttpRequest object contains request method open GET method and pass the url through it
//                                request.open("GET", url, true);
//                                //Setting request header
//                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
//                                request.send(null);
//                                //Every time ready stage changes hold the states of XMLHttpRequest
//                                request.onreadystatechange = function () {
//                                    //Check is thet request is finished and respond is ready
//                                    if (request.readyState == 4) {
//                                        //Check that the server side status success
//                                        if (request.status == 200) {
//                                            //After server side process happen successfully set the result to searchedDeliveryDetails_div this is a table
//                                            document.getElementById("searchedDeliveryDetails_div").innerHTML = request.responseText;
//                                        }
//                                    }
//                                }
//                            }
                        </script>
                    </div>  
                </section>
                <%--Search Delivery section ends here --%>

                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%-- 4./ Search All Delivery section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="release container" id="search_all_delivery" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" style="margin-top: 5px;margin-left: 0%;">
                            <div class="container" id="searchedAllDeliveryDetail_div">
                                <%-- Here loading all the delivery details as a table with ajax using loadAllDeliveries() method --%>
                            </div>
                        </form>
                        <script>
                            //Loading all the drivers function
                            function loadAllDeliveries() {
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchedAllDeliveryDetail";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check is thet request is finished and respond is ready
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to searchedAllDeliveryDetail_div this is a table
                                            document.getElementById("searchedAllDeliveryDetail_div").innerHTML = request.responseText;
                                        }
                                    }
                                }
                            }
                        </script>
                    </div>  
                </section>   
                <%--Search All Delivery section ends here --%>



                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%-- 5./ Add new vehicle section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="add_new_vehicle_div container" id="add_new_vehicle_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Type</label>
                                <div class="col-sm-5" id="selectingVehicleType_div">
                                    <%-- Here loading the Vehicle Type list using ajax using fillVihicleTypeList() method --%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input class="form-control" id="newvnumber" required="true" placeholder="CAF6070">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Fixed Charge (Rs.)</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="fixcharge"  required="true" onkeyup="validateCurrency1()" placeholder="1000">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2" >Charges Per km (Rs.)</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="perkm"  required="true" onkeyup="validateCurrency2()" placeholder="10">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary" onclick="addVehicleForm()" >Save</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <font id="addVehicleResult"></font>
                                </div>
                            </div>
                        </form>
                        <script>
                            //add New vehicle function 
                            function addVehicleForm() {
                                var vtypename = document.getElementById("vtypename").value;
                                var newvnumber = document.getElementById("newvnumber").value;
                                var fixcharge = document.getElementById("fixcharge").value;
                                var perkm = document.getElementById("perkm").value;
                                //Check weather that addDelevery form inputs and not empty and select correct options 
                                if (vtypename !== 'none' && newvnumber !== '' && fixcharge !== '' && perkm !== '') {
                                    //Create XMLHttpRequest object
                                    var request = createXMLHttpRequest();
                                    //Create url to communicate with the server with ajax
                                    var url = "AddVehicle?vtypename=" + vtypename + "&newvnumber=" + newvnumber + "&fixcharge=" + fixcharge + "&perkm=" + perkm;
                                    //XMLHttpRequest object contains request method open GET method and pass the url through it
                                    request.open("GET", url, true);
                                    //Setting request header
                                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                    request.send(null);
                                    //Every time ready stage changes hold the states of XMLHttpRequest
                                    request.onreadystatechange = function () {
                                        //Check is thet request is finished and respond is ready
                                        if (request.readyState == 4) {
                                            //Check that the server side status success
                                            if (request.status == 200) {
                                                //After server side process happen successfully set the result to addVehicleResult this is a <font>
                                                document.getElementById("addVehicleResult").innerHTML = request.responseText;
                                                //Recalling fillVihicleTypeList() to set default mood
                                                fillVihicleTypeList();
                                                //Make all input fields to empty mood
                                                document.getElementById("newvnumber").value = "";
                                                document.getElementById("fixcharge").value = "";
                                                document.getElementById("perkm").value = "";
                                            }
                                        }
                                    }
                                }
                            }

                            //Call all Vehicle types to list down as option list
                            function fillVihicleTypeList() {
                                //Clearing the messege when calling fillVihicleTypeList()
                                document.getElementById("addVehicleResult").innerHTML = "";
                                //Create XMLHttpRequest object
                                var request = createXMLHttpRequest();
                                //Create url to communicate with the server with ajax
                                var url = "SearchVehicleTypesForAddVehicle";
                                //XMLHttpRequest object contains request method open GET method and pass the url through it
                                request.open("GET", url, true);
                                //Setting request header
                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                request.send(null);
                                //Every time ready stage changes hold the states of XMLHttpRequest
                                request.onreadystatechange = function () {
                                    //Check that the server side status success
                                    if (request.readyState == 4) {
                                        //Check that the server side status success
                                        if (request.status == 200) {
                                            //After server side process happen successfully set the result to selectingVehicleType_div this is an option list
                                            document.getElementById("selectingVehicleType_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }
                            //Validating the currency
                            function validateCurrency1() {
                                //Clearing the messege when calling fillVihicleTypeList()
                                document.getElementById("addVehicleResult").innerHTML = "";
                                //Creating regular expression start character equals 0
                                var regex = /^[0]+$/;
                                var x = document.getElementById("fixcharge").value;
                                //Check that the first charater of var x value is 0 , then chaeck is not a numeric value , then check var x value length is greater than 5
                                if (regex.test(x) || isNaN(x) || x.length > 5) {
                                    //If abouve conditions true then var x length will be reduce by 1 then assign it to var x 
                                    x = x.substring(0, x.length - 1);
                                    //set new value to id contains fixcharge input field
                                    document.getElementById("fixcharge").value = x;
                                }
                            }
                            //Validating the currency
                            function validateCurrency2() {
                                //Clearing the messege when calling fillVihicleTypeList()
                                document.getElementById("addVehicleResult").innerHTML = "";
                                //Creating regular expression start character equals 0
                                var regex = /^[0]+$/;
                                var x = document.getElementById("perkm").value;
                                //Check that the first charater of var x value is 0 , then chaeck is not a numeric value , then check var x value length is greater than 5
                                if (regex.test(x) || isNaN(x) || x.length > 5) {
                                    //If abouve conditions true then var x length will be reduce by 1 then assign it to var x 
                                    x = x.substring(0, x.length - 1);
                                    //set new value to id contains fixcharge input field
                                    document.getElementById("perkm").value = x;
                                }
                            }


                        </script>
                    </div>  
                </section>   
                <%--Add new vehicle section ends here --%>

                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%-- 6./ Add new driver section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="space container" id="add_new_driver_div" style="box-shadow: 0 0 1px black;display: none;">
                        <form class="form-horizontal" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Driver Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Name.." id="dname" name="dname" required="true" onkeyup="validateName()">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Address</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Address.." id="driveraddress" name="driveraddress" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">NIC Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="910856985V" id="drivernic" name="drivernic" required="true" onkeyup="validateNIC()" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Driving License Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Number of the license" id="dlicennumber" name="dlicennumber" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Contact No</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Phone number.." id="drivercontact" name="drivercontact" required="true" onkeyup="validatePhone()">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary" onclick="addDiverForm()" >Save</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <font id="addDriverResult"></font>
                                </div>
                            </div>
                        </form>
                        <script>
                            // add driver details method using ajax
                            function addDiverForm() {
                                var dname = document.getElementById("dname").value;
                                var driveraddress = document.getElementById("driveraddress").value;
                                var drivernic = document.getElementById("drivernic").value;
                                var dlicennumber = document.getElementById("dlicennumber").value;
                                var drivercontact = document.getElementById("drivercontact").value;
                                if (dname !== '' && driveraddress !== '' && drivernic !== '' && dlicennumber !== '' && drivercontact !== '') {
                                    //Check that drivernic length is equal to 10 
                                    if (drivernic.length === 10) {
                                        //If only drivernic length is equal to 10 then check drivercontact length is equal to 10
                                        if (drivercontact.length === 10) {
                                            //If both conditions are correct then only create XMLHttpRequest object
                                            var request = createXMLHttpRequest();
                                            //Create url to communicate with the server with ajax
                                            var url = "AddDriver?dname=" + dname + "&driveraddress=" + driveraddress + "&drivernic=" + drivernic + "&dlicennumber=" + dlicennumber + "&drivercontact=" + drivercontact;
                                            //XMLHttpRequest object contains request method open GET method and pass the url through it
                                            request.open("GET", url, true);
                                            //Setting request header
                                            request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                            //We use GET method to send data to server there for we don't have anything to send with body there for we set it as null
                                            request.send(null);
                                            //Every time ready stage changes hold the states of XMLHttpRequest
                                            request.onreadystatechange = function () {
                                                //Check is thet request is finished and respond is ready
                                                if (request.readyState == 4) {
                                                    //Check that the server side status success
                                                    if (request.status == 200) {
                                                        //After server side process happen successfully set the result to addDriverResult <font>
                                                        document.getElementById("addDriverResult").innerHTML = request.responseText;
                                                        //After server side process happen set the fields to default mood
                                                        document.getElementById("dname").value = "";
                                                        document.getElementById("driveraddress").value = "";
                                                        document.getElementById("drivernic").value = "";
                                                        document.getElementById("dlicennumber").value = "";
                                                        document.getElementById("drivercontact").value = "";

                                                    }
                                                }
                                            }

                                        } else {
                                            //If user try to save driver with invalied contact number this error will appear
                                            document.getElementById("addDriverResult").innerHTML = "Invalied contact number...";
                                        }
                                    } else {
                                        //If user try to save driver with invalied NIC number this error will appear
                                        document.getElementById("addDriverResult").innerHTML = "Invalied NIC number...";
                                    }
                                }
                            }

                            //Validate name function when keypressup the driver name only letters and space allowed
                            function validateName() {
                                //Clear the messege in addDriverResult <font>
                                document.getElementById("addDriverResult").innerHTML = "";
                                //Regular expression create to check only a - z , A-Z and white spaceces followed by any number of characters
                                var regex = /^[a-zA-Z\s]+$/;
                                var x = document.getElementById("dname").value;
                                //Check that regular expression is not true
                                if (regex.test(x) !== true) {
                                    //If it is note true remove the enterd character and assign it to var x variable
                                    x = x.substring(0, x.length - 1);
                                    //set the x value to dname id contains input field
                                    document.getElementById("dname").value = x;
                                }
                            }

                            //Validate NIC function when keypressup nine digits and final letter V only, in nine digits first digit can not be zero
                            function validateNIC() {
                                //Clear the messege in addDriverResult <font>
                                document.getElementById("addDriverResult").innerHTML = "";
                                //Regular expression create to check enterd value is not equal one to nine
                                var regex = /^[^1-9]$/;
                                //Regular expression create to check enterd value is not equal zero to nine
                                var regex1 = /^[^0-9]$/;
                                var x = document.getElementById("drivernic").value;
                                //Check weather that regular expresion is true and logocal or with check entered text length is greter than 10
                                if (regex.test(x) || x.length > 10) {
                                    //If the above condition true using substring method length reduce by 1 and assign the newly subsrtinged value to var x
                                    x = x.substring(0, x.length - 1);
                                    //Setting new var x value to drivernic id contains input field
                                    document.getElementById("drivernic").value = x;
                                }
                                //Check weather var x length when equals to 1
                                if (x.length === 1) {
                                    //substring the x contains string second element 
                                    var temp = x.substring(x.length - 10);
                                    //Check regular expression regex1 is true
                                    if (regex1.test(temp)) {
                                        //If the abouve condition is true remove finally enterd value and assign it ti x var variable
                                        x = x.substring(0, x.length - 1);
                                        //Setting the new x var value to drivernic id contains input field
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 2
                                if (x.length === 2) {
                                    //substring the x contains string third element 
                                    var temp = x.substring(1, 3);
                                    //Check regular expression regex1 is true
                                    if (regex1.test(temp)) {
                                        //If the abouve condition is true remove finally enterd value and assign it ti x var variable
                                        x = x.substring(0, x.length - 1);
                                        //Setting the new x var value to drivernic id contains input field
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 3
                                if (x.length === 3) {
                                    //substring the x contains string forth element
                                    var temp = x.substring(2, 4);
                                    //Check regular expression regex1 is true
                                    if (regex1.test(temp)) {
                                        //If the abouve condition is true remove finally enterd value and assign it ti x var variable
                                        x = x.substring(0, x.length - 1);
                                        //Setting the new x var value to drivernic id contains input field
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 4
                                if (x.length === 4) {
                                    //substring the x contains string fifth element
                                    var temp = x.substring(3, 5);
                                    //Check regular expression regex1 is true
                                    if (regex1.test(temp)) {
                                        //If the abouve condition is true remove finally enterd value and assign it ti x var variable
                                        x = x.substring(0, x.length - 1);
                                        //Setting the new x var value to drivernic id contains input field
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather that var x length when equals to 5
                                if (x.length === 5) {
                                    //substring the x contains string sixth element
                                    var temp = x.substring(4, 6);
                                    if (regex1.test(temp)) {
                                        x = x.substring(0, x.length - 1);
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 6
                                if (x.length === 6) {
                                    //substring the x contains string seventh element
                                    var temp = x.substring(5, 7);
                                    if (regex1.test(temp)) {
                                        x = x.substring(0, x.length - 1);
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 7
                                if (x.length === 7) {
                                    //substring the x contains string eighth element
                                    var temp = x.substring(6, 8);
                                    if (regex1.test(temp)) {
                                        x = x.substring(0, x.length - 1);
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 8
                                if (x.length === 8) {
                                    //substring the x contains string nineth element
                                    var temp = x.substring(7, 9);
                                    if (regex1.test(temp)) {
                                        x = x.substring(0, x.length - 1);
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check weather var x length when equals to 9
                                if (x.length === 9) {
                                    //substring the x contains string tenth element
                                    var temp = x.substring(8, 10);
                                    if (regex1.test(temp)) {
                                        x = x.substring(0, x.length - 1);
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                                //Check the x length is 10
                                if (x.length === 10) {
                                    //Check the 10 th character is not equal to V 
                                    if (x.substring(x.length - 1) !== "V") {
                                        //If above condition is true then remove finally enterd value and assigned newly created var x value to var x variable
                                        x = x.substring(0, x.length - 1);
                                        document.getElementById("drivernic").value = x;
                                    }
                                }
                            }

                            //Validate phone number only allowed 10 digits and first digit is zero
                            function validatePhone() {
                                //Clear the messege in addDriverResult <font>
                                document.getElementById("addDriverResult").innerHTML = "";
                                //Creting regular expression first character not equal 0
                                var regex = /^[^0]+$/;
                                var x = document.getElementById("drivercontact").value;
                                //Check weather that regular expression regex is true, then check is not a number ,and finally check x value length is greater than 10
                                if (regex.test(x) || isNaN(x) || x.length > 10) {
                                    //If any above conditions are true then that time reduce the var x contains length by 1 and assign it to x vaiable 
                                    x = x.substring(0, x.length - 1);
                                    //then set the var x value to drivercontact id contains input field
                                    document.getElementById("drivercontact").value = x;
                                }
                            }


                        </script>
                    </div>  
                </section> 
                <%--Add new driver section ends here --%>

                <script>

                    function deliverydash() {
                        document.getElementById("Whead").innerHTML = 'Analitical View of Delivery';
                        document.getElementById("delivery_dash_div").style.display = 'block';
                        document.getElementById("new_delivery").style.display = 'none';
                        document.getElementById("search_delivery_div").style.display = 'none';
                        document.getElementById("search_all_delivery").style.display = 'none';
                        document.getElementById("add_new_driver_div").style.display = 'none';
                        document.getElementById("add_new_vehicle_div").style.display = 'none';

                    }
                    function newdelivery() {
                        document.getElementById("Whead").innerHTML = 'New Delivery';
                        document.getElementById("delivery_dash_div").style.display = 'none';
                        document.getElementById("new_delivery").style.display = 'block';
                        document.getElementById("search_delivery_div").style.display = 'none';
                        document.getElementById("search_all_delivery").style.display = 'none';
                        document.getElementById("add_new_driver_div").style.display = 'none';
                        document.getElementById("add_new_vehicle_div").style.display = 'none';

                    }
                    function searchdelivery() {
                        document.getElementById("Whead").innerHTML = 'Search Delivery';
                        document.getElementById("delivery_dash_div").style.display = 'none';
                        document.getElementById("new_delivery").style.display = 'none';
                        document.getElementById("search_delivery_div").style.display = 'block';
                        document.getElementById("search_all_delivery").style.display = 'none';
                        document.getElementById("add_new_driver_div").style.display = 'none';
                        document.getElementById("add_new_vehicle_div").style.display = 'none';

                    }
                    function alldelivery() {
                        document.getElementById("Whead").innerHTML = ' All Delivery Details ';
                        document.getElementById("delivery_dash_div").style.display = 'none';
                        document.getElementById("new_delivery").style.display = 'none';
                        document.getElementById("search_delivery_div").style.display = 'none';
                        document.getElementById("search_all_delivery").style.display = 'block';
                        document.getElementById("add_new_driver_div").style.display = 'none';
                        document.getElementById("add_new_vehicle_div").style.display = 'none';

                    }
                    function newdriver() {
                        document.getElementById("Whead").innerHTML = 'New Driver';
                        document.getElementById("delivery_dash_div").style.display = 'none';
                        document.getElementById("new_delivery").style.display = 'none';
                        document.getElementById("search_delivery_div").style.display = 'none';
                        document.getElementById("search_all_delivery").style.display = 'none';
                        document.getElementById("add_new_driver_div").style.display = 'block';
                        document.getElementById("add_new_vehicle_div").style.display = 'none';
                    }
                    function newvehicle() {
                        document.getElementById("Whead").innerHTML = 'New Vehicle';
                        document.getElementById("delivery_dash_div").style.display = 'none';
                        document.getElementById("new_delivery").style.display = 'none';
                        document.getElementById("search_delivery_div").style.display = 'none';
                        document.getElementById("search_all_delivery").style.display = 'none';
                        document.getElementById("add_new_driver_div").style.display = 'none';
                        document.getElementById("add_new_vehicle_div").style.display = 'block';

                    }

                </script>
            </div>
        </div>

    </body>

</html>
