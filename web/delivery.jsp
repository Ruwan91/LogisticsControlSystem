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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>warehousing</title>

    </head>
    <body id="wareH" style="display: block;" >
        <div class="container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="container" style="width: 100%;">

                    <div class="container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1>Delivery</h1></div>

                    <div class="navcontainer container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="deliverydash()">Dashboard</a></li>
                            <li><a data-toggle="tab" onclick="newdelivery()">New Delivery</a></li>
                            <li><a data-toggle="tab" onclick="searchdelivery()">Search Delivery</a></li>
                            <li><a data-toggle="tab" onclick="alldelivery()">All Delivery</a></li>
                            <li><a data-toggle="tab" onclick="newdriver()">Add New Driver</a></li>
                            <li><a data-toggle="tab" onclick="newvehicle()">Add New Vehicle</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <div class="deliverycontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Delivery Dashboard</h1></div>
                <%-- Delivery dashboard starts here --%>
                <section>
                    <div class="delivery_dash container tab-content" id="delivery_dash_div" style="box-shadow: 0 0 1px black;display: block;">
                        <div class="content tab-pane fade in active">
                            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                            <script type="text/javascript">
                                // Load google charts
                                google.charts.load('current', {'packages': ['corechart']});
                                google.charts.setOnLoadCallback(drawChart);
                                // Drawing the chart
                                function drawChart() {
                                    var data = google.visualization.arrayToDataTable([
                                        ['Task', '# Delivery'],
                                        ['20 feet Container', 100],
                                        ['40 feet Container', 40],
                                        ['20 feet Refrigerated Lorry', 8],
                                        ['14 feet Refrigerated mini Lorry', 10],
                                        ['30 feet Cargo Truck', 150],
                                        ['Other', 20]
                                    ]);

                                    //Setting chart title and size
                                    var options = {'title': 'Usage of Delivery Vehicle Type', 'width': 650, 'height': 400};

                                    // Display the chart inside the <div> element with id="pieChart"
                                    var chart = new google.visualization.PieChart(document.getElementById('pieChart'));
                                    chart.draw(data, options);
                                }
                            </script>

                            <div id="pieChart" style="padding-left: 10%" ></div>
                        </div>
                    </div>
                </section>
                <%-- Delivery dashboard ends here --%>

                <%--New Delivery section starts here --%>
                <section>
                    <div class="new_delivery container" id="new_delivery" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Vehicle Number." id="vnumber" required="true">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Type</label>
                                <div class="col-sm-5">
                                    <select class="form-control" id="vtypeid" name="vtypeid">
                                        <option selected>Select Vehicle Type</option>
                                        <option value="1">20'Container</option>
                                        <option value="2">40'Container</option>
                                        <option value="3">20'Refrigerated Lorry</option>
                                        <option value="4">14'Refrigerated mini Lorry</option>
                                        <option value="5">30'Cargo Truck</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery Destination</label>
                                <div class="col-sm-5">
                                    <select class="form-control" id="ddid" name="ddid">
                                        <option selected>Select Delivery Destination</option>
                                        <option value="1">Slave Island - Colombo 2</option>
                                        <option value="2">Kollupitiya  - Colombo 3</option>
                                        <option value="3">Bambalapitiya - Colombo 4</option>
                                        <option value="4">Narahenpita, Havelock Town , Kirulapona North - Colombo 5</option>
                                        <option value="5">Wellawatta, Pamankada, Kirulapona South  - Colombo 6</option>
                                        <option value="6">Cinnamon Garden  - Colombo 7</option>
                                        <option value="7">Borella  - Colombo 8</option>
                                        <option value="8">Dematagoda - Colombo 9</option>
                                        <option value="9">Maradana, Panchikawatte - Colombo 10</option>
                                        <option value="10">Pettah  - Colombo 11</option>
                                        <option value="11">Hulsfdorf  - Colombo 12</option>
                                        <option value="12">Kotahena, Kochchikade - Colombo 13</option>
                                        <option value="13">Grandpass - Colombo 14</option>
                                        <option value="14">Mattakkuliya, Modara, Mutwal, Madampitiya - Colombo 15</option>
                                        <option value="15">Mount Lavinia</option>
                                        <option value="16">Rathmalana</option>
                                        <option value="17">Angulana</option>
                                        <option value="18">Moratuwa</option>
                                        <option value="19">Egodauyana</option>
                                        <option value="20">Panadura</option>
                                        <option value="21">Wadduwa</option>
                                        <option value="22">Waskaduwa</option>
                                        <option value="23">Kaluthara</option>
                                        <option value="24">Maggona</option>
                                        <option value="25">Beruwala</option>
                                        <option value="26">Aluthgama</option>
                                        <option value="27">Benthota</option>
                                        <option value="28">Balapitiya</option>
                                        <option value="29">Ambalangoda</option>
                                        <option value="30">Hikkaduwa</option>
                                        <option value="31">Rathgama</option>
                                        <option value="32">Galle</option>
                                        <option value="33">Koggala</option>
                                        <option value="34">Waligama</option>
                                        <option value="35">Mirissa</option>
                                        <option value="36">Dikwalla</option>
                                        <option value="37">Thangalla</option>
                                        <option value="38">Pitigala</option>
                                        <option value="39">Nigambo</option>
                                        <option value="40">Ja-Ela</option>
                                        <option value="41">Waththala</option>
                                        <option value="42">Gampaha</option>
                                        <option value="43">Veyangoda</option>
                                        <option value="44">Katunayake</option>
                                        <option value="45">Ragama</option>
                                        <option value="46">Seeduwa</option>
                                        <option value="47">Kotugoda</option>
                                        <option value="48">Kadatha</option>
                                        <option value="49">Paliyagoda</option>
                                        <option value="50">Homagama</option>
                                        <option value="51">Mirigama</option>
                                        <option value="52">Chilaw</option>
                                        <option value="53">Rambukkana</option>
                                        <option value="54">Kurunagala</option>
                                        <option value="55">Nikawaratiya</option>
                                        <option value="56">Kandy</option>
                                        <option value="57">Ginigathhena</option>
                                        <option value="58">Walapane</option>
                                        <option value="59">Hatton</option>
                                        <option value="60">Nuwara Eliya</option>
                                        <option value="61">Badulla</option>
                                        <option value="62">Pelmadulla</option>
                                        <option value="63">Embilipitiya</option>
                                        <option value="64">Ella</option>
                                        <option value="65">Buththala</option>
                                        <option value="66">Katharagama</option>
                                        <option value="67">Monaragala</option>
                                        <option value="68">Mahiyanganaya</option>
                                        <option value="69">Sigiriya</option>
                                        <option value="70">Habarana</option>
                                        <option value="71">Polonnaruwa</option>
                                        <option value="72">Ambanpola</option>
                                        <option value="73">Dambulla</option>
                                        <option value="74">Bibile</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Driver ID</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Driver ID" id="driverid" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Date</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="date" required="true">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Invoice NO</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Invoice Number." id="invoiceId" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Destination Address</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Address here" id="destaddress" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary">Save & Print Delivery Report </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
                <%--New Delivery section ends here --%>

                <%--Search Delivery section starts here --%>
                <section>
                    <div class="search container" id="search_delivery_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery ID</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Delivery Id" id="deliveryid" required="true">
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Delivery Destination</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Driver Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"readonly value="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Date </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Invoice NO</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Destination Address</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Charge</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" readonly value="">
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

                <%--Search All Delivery section starts here --%>
                <section>
                    <div class="release container" id="search_all_delivery" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
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

                            <input type="#" class="btn btn-primary" value="View Delivery History">
                        </form>
                    </div>  
                </section>   
                <%--Search All Delivery section ends here --%>

                <%--Add new driver section starts here --%>
                <section>
                    <div class="space container" id="add_new_driver_div" style="box-shadow: 0 0 1px black;display: none;">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Driver Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Name.." id="dname" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Address</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Address.." id="address" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">NIC Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter NIC.." id="nic" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Driving License Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Number of the license" id="dlicennumber" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Contact No</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Phone number.." id="contact" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>  
                </section> 
                <%--Add new driver section ends here --%>

                <%--Add new vehicle section starts here --%>
                <section>
                    <div class="history container" id="add_new_vehicle_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Vehicle Type</label>
                                <div class="col-sm-5">
                                    <select class="form-control" id="vtypeid" name="vtypeid">
                                        <option selected value="0">Select Vehicle Type</option>
                                        <option value="1">20'Container</option>
                                        <option value="2">40'Container</option>
                                        <option value="3">20'Refrigerated Lorry</option>
                                        <option value="4">14'Refrigerated mini Lorry</option>
                                        <option value="5">30'Cargo Truck</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Vehicle Number</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="CAB6023" id="vnumber" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Fixed Charge</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="fixcharge" required="true">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Charges Per km </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="perkm" required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>  
                </section>   
                <%--Add new vehicle section ends here --%>

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
