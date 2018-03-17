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
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC_XsnwEZYZZbnhxJ_juCgl0hmpt04KD50&callback=initMap"></script>
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

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1 id="nnnnnn">Tracking</h1></div>

                    <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="tracking()">Tracking</a></li>
                            <li><a data-toggle="tab"  onclick="damagecargo()">Damage Cargo</a></li>
                            <li><a data-toggle="tab" onclick="filnalize()">Finalizing</a></li>
                            <li><a data-toggle="tab" onclick="currentlocation()">Tracking Current Location</a></li>

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
                                <label class="control-label col-sm-2">Shipment ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Date : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="customerID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Location : </label>
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
                                <label class="control-label col-sm-2">Shipment ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Order ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cname">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Item ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cID">
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-2">Quantity : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cquantity">
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
                                <label class="control-label col-sm-2">Shipment ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div><button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Search</button>
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
                                <label class="control-label col-sm-2">Released date : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>



                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>

                        </form>
                    </div>  
                </section>
                <%-- Tracking shipment location by shipment id starts here --%>

                <section>
                    <div class="Finalizing container" id="current_location_div" style="box-shadow: 0 0 1px black;display: none">
                        <script language="javascript" type="text/javascript">
                            <%--uses google api --%>

                            var map;
                            var geocoder;
                            function InitializeMap() {
                                var l = document.getElementById("l").value;
                                var lt = document.getElementById("lt").value;
                                var latlng = new google.maps.LatLng(l, lt);
                                var myOptions =
                                        {
                                            zoom: 3,
                                            center: latlng,
                                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                                            disableDefaultUI: true
                                        };
                                map = new google.maps.Map(document.getElementById("map"), myOptions);

                                var marker = new google.maps.Marker({
                                    position: latlng,
                                    map: map,
                                });
                            }

                            function FindLocaiton() {
                                geocoder = new google.maps.Geocoder();
                                InitializeMap();

                                var address = document.getElementById("addressinput").value;
                                geocoder.geocode({'address': address}, function (results, status) {
                                    if (status === google.maps.GeocoderStatus.OK) {
                                        map.setCenter(results[0].geometry.location);
                                        var marker = new google.maps.Marker({
                                            map: map,
                                            position: results[0].geometry.location
                                        });

                                    } else {
                                        alert("Geocode was not successful for the following reason: " + status);
                                    }
                                });

                            }


                            function Button1_onclick() {
                                FindLocaiton();
                            }

                            window.onload = InitializeMap;

                        </script>
                    </div>  
                </section>

                <%-- Tracking shipment location by shipment id ends here --%>

                <script>
                    function tracking() {
                        document.getElementById("Whead").innerHTML = 'Tracking Cargo';
                        document.getElementById("track_div").style.display = 'block';
                        document.getElementById("Damagecargo").style.display = 'none';
                        document.getElementById("FinalizingCC_div").style.display = 'none';
                        document.getElementById("current_location_div").style.display = 'none';


                    }
                    function damagecargo() {
                        document.getElementById("Whead").innerHTML = 'Damage Cargo';
                        document.getElementById("track_div").style.display = 'none';
                        document.getElementById("Damagecargo").style.display = 'block';
                        document.getElementById("FinalizingCC_div").style.display = 'none';
                        document.getElementById("current_location_div").style.display = 'none';


                    }
                    function filnalize() {
                        document.getElementById("Whead").innerHTML = 'Finanlize Cargo';
                        document.getElementById("track_div").style.display = 'none';
                        document.getElementById("Damagecargo").style.display = 'none';
                        document.getElementById("FinalizingCC_div").style.display = 'block';
                        document.getElementById("current_location_div").style.display = 'none';
                    }
                    function currentlocation() {
                        document.getElementById("Whead").innerHTML = 'Current Location of shipment';
                        document.getElementById("track_div").style.display = 'none';
                        document.getElementById("Damagecargo").style.display = 'none';
                        document.getElementById("FinalizingCC_div").style.display = 'none';
                        document.getElementById("current_location_div").style.display = 'block';
                    }


                </script>
            </div>
        </div>

    </body>
</html>
