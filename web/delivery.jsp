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
                            <li><a data-toggle="tab" onclick="newdelivery(); fillTheDeliveryDestinationList();">New Delivery</a></li>
                            <li><a data-toggle="tab" onclick="searchdelivery()">Search Delivery</a></li>
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
                <%-- Delivery dashboard starts here --%>
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
                <%--New Delivery section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="new_delivery container" id="new_delivery" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                        <form class="form-horizontal" style="margin-top: 5px;margin-left: 15%;" >
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Vehicle Number." id="delvnumber" required="true">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery Destination</label>
                                <div class="col-sm-5" id="selectingDeleveryDistance_div">
                                    <%-- Here loading the Delivery Destinations list using ajax using fillTheDeliveryDestinationList() method --%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Driver ID</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Driver ID" id="deldriverid" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Date</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="deldate" required="true">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Order Id</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Invoice Number." id="delorderId" required="true">
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
                                    <button type="submit" class="btn btn-primary" onclick="addDeliveryForm()">Save & Print Delivery Report </button>
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

                                if (delvnumber !== '' && delddname !== 'none' && deldriverid !== '' && deldate !== '' && delorderId !== '' && deldestaddress !== '') {
                                    var request = createXMLHttpRequest();
                                    var url = "AddDelivery?delvnumber=" + delvnumber + "&delddname=" + delddname + "&deldriverid=" + deldriverid + "&deldate=" + deldate + "&delorderId=" + delorderId + "&deldestaddress=" + deldestaddress;
                                    request.open("GET", url, true);

                                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    request.send(null);
                                    request.onreadystatechange = function () {
                                        if (request.readyState == 4) {
                                            if (request.status == 200) {
                                                console.log(delvnumber);
                                                console.log(delddname);
                                                console.log(deldriverid);
                                                console.log(deldate);
                                                console.log(delorderId);
                                                console.log(deldestaddress);

                                                document.getElementById("addDeliveryResult").innerHTML = request.responseText;
                                                document.getElementById("delvnumber").value = "";
                                                document.getElementById("delddname").value = "";
                                                document.getElementById("deldriverid").value = "";
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
                                var request = createXMLHttpRequest();
                                var url = "SearchDeliveryDestinationForDelivery";
                                request.open("GET", url, true);

                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                request.send(null);
                                request.onreadystatechange = function () {
                                    if (request.readyState == 4) {
                                        if (request.status == 200) {
                                            document.getElementById("selectingDeleveryDistance_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }
                        </script>
                    </div>
                </section>
                <%--New Delivery section ends here --%>


                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%--Search Delivery section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="search container" id="search_delivery_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery ID</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Delivery Id" id="searchdeliveryid" required="true">
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="" id="searchvehiclenumber">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery Destination</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="" id="searchdeliverydestination">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Driver Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"readonly value="" id="searchdrivername">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Date </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="" id="searchdate">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Order Id</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="" id="searchorderId">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Destination Address</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="" id="searchdestinatinaddress">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Charge</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="" id="searchcharge">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary">Search Delivery</button>
                                </div>
                            </div>
                        </form>
                    </div>  
                </section>
                <%--Search Delivery section ends here --%>

                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%--Search All Delivery section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="release container" id="search_all_delivery" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="container" id="searchedAllDeliveryDetail_div">
                                <%-- Here loading all the delivery details as a table with ajax using loadAllDeliveries() method --%>
                            </div>
                        </form>
                        <script>
                            function loadAllDeliveries() {
                                var request = createXMLHttpRequest();
                                var url = "SearchedAllDeliveryDetail";
                                request.open("GET", url, true);

                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                request.send(null);
                                request.onreadystatechange = function () {
                                    if (request.readyState == 4) {
                                        if (request.status == 200) {
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
                <%--Add new vehicle section starts here --%>
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
                                    <input class="form-control" id="newvnumber" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Fixed Charge</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="fixcharge"  required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Charges Per km </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="perkm"  required="true">
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
                            function addVehicleForm() {
                                var vtypename = document.getElementById("vtypename").value;
                                var newvnumber = document.getElementById("newvnumber").value;
                                var fixcharge = document.getElementById("fixcharge").value;
                                var perkm = document.getElementById("perkm").value;
                                
                                if (vtypename !== 'none' && newvnumber !== '' && fixcharge !== '' && perkm !== '') {
                                    var request = createXMLHttpRequest();
                                    var url = "AddVehicle?vtypename=" + vtypename + "&newvnumber=" + newvnumber + "&fixcharge=" + fixcharge + "&perkm=" + perkm;
                                    request.open("GET", url, true);

                                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    request.send(null);
                                    request.onreadystatechange = function () {
                                        if (request.readyState == 4) {
                                            if (request.status == 200) {
                                                document.getElementById("addVehicleResult").innerHTML = request.responseText;
                                                document.getElementById("vtypename").value = "Select Vehicle Type";
                                                document.getElementById("newvnumber").value = "";
                                                document.getElementById("fixcharge").value = "";
                                                document.getElementById("perkm").value = "";
                                            }
                                        }
                                    }
                                }
                            }

                            function fillVihicleTypeList() {
                                var request = createXMLHttpRequest();
                                var url = "SearchVehicleTypesForAddVehicle";
                                request.open("GET", url, true);

                                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                request.send(null);
                                request.onreadystatechange = function () {
                                    if (request.readyState == 4) {
                                        if (request.status == 200) {
                                            document.getElementById("selectingVehicleType_div").innerHTML = request.responseText;
                                        }
                                    }
                                }

                            }

                        </script>
                    </div>  
                </section>   
                <%--Add new vehicle section ends here --%>

                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <%--Add new driver section starts here --%>
                <%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                <section>
                    <div class="space container" id="add_new_driver_div" style="box-shadow: 0 0 1px black;display: none;">
                        <form class="form-horizontal" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Driver Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Name.." id="dname" name="dname" required="true">
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
                                    <input type="text" class="form-control" placeholder="Enter NIC.." id="drivernic" name="drivernic" required="true">
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
                                    <input type="text" class="form-control" placeholder="Phone number.." id="drivercontact" name="drivercontact" required="true">
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
                                    var request = createXMLHttpRequest();
                                    var url = "AddDriver?dname=" + dname + "&driveraddress=" + driveraddress + "&drivernic=" + drivernic + "&dlicennumber=" + dlicennumber + "&drivercontact=" + drivercontact;
                                    request.open("GET", url, true);

                                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    request.send(null);
                                    request.onreadystatechange = function () {
                                        if (request.readyState == 4) {
                                            if (request.status == 200) {
                                                document.getElementById("addDriverResult").innerHTML = request.responseText;
                                                document.getElementById("dname").value = "";
                                                document.getElementById("driveraddress").value = "";
                                                document.getElementById("drivernic").value = "";
                                                document.getElementById("dlicennumber").value = "";
                                                document.getElementById("drivercontact").value = "";

                                            }
                                        }
                                    }
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
