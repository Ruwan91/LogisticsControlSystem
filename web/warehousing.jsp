<%-- 
    Document   : Warhousing
    Created on : Mar 4, 2018, 7:03:18 PM
    Author     : ishan
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.sliit.logistics_control_system.controller.ishan_controller.Stack_Cargo"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.Date"%>
<%@page import="edu.sliit.logistics_control_system.connection.MySQLConnection"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>warehousing</title>
        <script>


            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer2", {
                    animationEnabled: true,
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: ""
                    },
                    axisY: {
                        title: "Quantities"
                    },
                    data: [{
                            type: "column",
                            showInLegend: true,
                            legendMarkerColor: "grey",
                            legendText: "Cargo Types",
                            dataPoints: [
                                {y: 300878, label: "Danger Cargo"},
                                {y: 266455, label: "Food Cargo"},
                                {y: 169709, label: "Refregirator Cargo"},
                                {y: 158400, label: "Normal Cargo"},
                            ]
                        }]
                });
                chart.render();

            }


        </script>

    </head>
    <body id="wareH" style="display: block;font-size: 60px;"  >


        <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="header container" style="width: 100%;">

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;padding-bottom: 20px;"><h1 id="nnnnnn">Warehousing</h1>
                        <div class=" dropdown">
                            <input type="text" class="form-control dropdown-toggle" data-toggle="dropdown" id="shearch" placeholder="Search" >

                            <ul class="dropdown-menu">
                                <li><a >ishan</a></li>
                                <li><a >kalindu</a></li>
                                <li><a >rishitha</a></li>
                            </ul>

                        </div>
                    </div>

                    <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="home()">Home</a></li>
                            <li><a data-toggle="tab"  onclick="insertcargo()">Insert Cargo</a></li>

                            <li><a data-toggle="tab" onclick="releasecargo()">Release Cargo</a></li>
                            <li><a data-toggle="tab" onclick="warehousingspace()" >Warehousing space</a></li>
                            <li><a data-toggle="tab" onclick="history()">History</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Warehouse Home</h1></div>

                <%--..................................Home.............................................................................................................................................................--%>

                <section>
                    <div class="warehousing_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">

                        <div id="chartContainer" style="width: 100%; height: 300px ; display: block;margin-top: 50px;margin-bottom:  50px;"></div> 
                        <script type="text/javascript">



                            $("#chartContainer").CanvasJSChart({
                                title: {
                                    text: "Stacked Cargo   - This Week",
                                    fontSize: 24,

                                },
                                axisY: {
                                    title: "Products in %"
                                },
                                legend: {
                                    verticalAlign: "center",
                                    horizontalAlign: "right"
                                },
                                data: [
                                    {
                                        type: "pie",
                                        showInLegend: true,
                                        toolTipContent: "{label} <br/> {y} %",
                                        indexLabel: "{y} %",
                                        dataPoints: [
                                            {label: "Normal Cargo", y: 30.3, legendText: "Normal Cargo"},
                                            {label: "Danger Cargo", y: 5.1, legendText: "Danger Cargo"},
                                            {label: "Food Cargo", y: 4.0, legendText: "Food Cargo"},
                                            {label: "Refregirator Cargo", y: 3.8, legendText: "Refregirator Cargo"},
                                        ]
                                    }
                                ]
                            });

                        </script> 
                        <div class="content tab-pane fade in active">
                            <h2>Recent Cargo Stacking</h2> 
                            <div style="margin-top: 20px;margin-bottom: 20px;">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Customer ID</th>
                                            <th>Customer Name</th>
                                            <th>Cargo Name</th>
                                            <th>Cargo Type</th>
                                            <th>Quantity</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>23</td>
                                            <td>vishwa</td>
                                            <td>Fuel Barell</td>
                                            <td>Danger Cargo</td>
                                            <td>22</td>
                                            <td>1/2/2018</td>
                                        </tr>
                                        <tr>
                                            <td>83</td>
                                            <td>rishitha</td>
                                            <td>Mortors</td>
                                            <td>Normal Cargo</td>
                                            <td>46</td>
                                            <td>20/8/2018</td>
                                        </tr>
                                        <tr>
                                            <td>238</td>
                                            <td>ishan</td>
                                            <td>Fish Barells</td>
                                            <td>Food Cargo</td>
                                            <td>89</td>
                                            <td>7/2/2018</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="caontainer">
                                <h2>Recent Payments</h2>
                                <div style="margin-top: 20px;margin-bottom: 20px;">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Customer ID</th>
                                                <th>Customer Name</th>
                                                <th>Cargo Type</th>
                                                <th>Quantity</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>12</td>
                                                <td>Ishan</td>
                                                <td>Danger Cargo</td>
                                                <td>25</td>
                                                <td>2/5/2018</td>
                                            </tr>
                                            <tr>
                                                <td>12</td>
                                                <td>Ruwan.P</td>
                                                <td>Food Cargo</td>
                                                <td>225</td>
                                                <td>6/5/2018</td>
                                            </tr>
                                            <tr>
                                                <td>12</td>
                                                <td>Kisal</td>
                                                <td>Normal Cargo</td>
                                                <td>23</td>
                                                <td>25/5/2018</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <%--..................................Insertion Form.............................................................................................................................................................--%>

                <section>
                    <div class="insert-cargo container" id="insertcargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">

                        <form class="form-horizontal"    style="margin-top: 20px;margin-left: 10%;display: block;font-size: 20px;">


                            <div class="form-group" style="">
                                <label class="control-label col-sm-2">Order ID : </label>
                                <div class="col-sm-3">


                                    <div id="insertorderid">
                                        <script>


                                            var xmlhttp = new XMLHttpRequest();
                                            xmlhttp.onreadystatechange = function () {
                                                if (this.readyState == 4 && this.status == 200) {
                                                    document.getElementById("insertorderid").innerHTML = this.responseText;
                                                }
                                            };
                                            xmlhttp.open("GET", "order_ID_stack_cargo", true);
                                            xmlhttp.send();

                                        </script>

                                    </div>

                                </div>




                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Cargo Name : </label>
                                <div class="col-sm-3">
                                    <div  id="c_name_div">

                                        <script>
                                            function    cargo_name_selected() {

                                                var e = document.getElementById("sel1");
                                                var odid = e.options[e.selectedIndex].value;


                                                var xmlhttp11 = new XMLHttpRequest();



                                                xmlhttp11.onreadystatechange = function () {
                                                    if (this.readyState == 4 && this.status == 200) {
                                                        document.getElementById("c_name_div").innerHTML = this.responseText;
                                                        console.log("cargo_name sucsess");

                                                    }
                                                };
                                                xmlhttp11.open("GET", "item_name_stack_cargo?odid=" + odid, true);
                                                xmlhttp11.send();

                                                console.log("cargo_name_selected()");

                                            }
                                        </script>

                                    </div>


                                </div>



                                <label class="control-label col-sm-3">Cargo Type : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control"   required id="insert_cargo_type" readonly>


                                    <script>
                                        function cargo_type_selected() {
                                            var es = document.getElementById("sel1");
                                            var odidcc = es.options[es.selectedIndex].value;
                                            var ess = document.getElementById("c_name");
                                            var itname = ess.options[ess.selectedIndex].innerHTML;

                                            var xmlhttp10 = new XMLHttpRequest();
                                            xmlhttp10.onreadystatechange = function () {
                                                if (this.readyState == 4 && this.status == 200) {
                                                    document.getElementById("insert_cargo_type").value = this.responseText;

                                                }
                                            };
                                            if (itname != "") {
                                                xmlhttp10.open("GET", "cargo_type_stack_cargo?odidc=" + odidcc + "&itname=" + itname, true);
                                            }

                                            xmlhttp10.send();
                                            console.log("cargo_type_selected() executed");
                                        }
                                    </script>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Quantity : </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" name="cquantity" min="1" id="cargo_quantity"  required onkeyup="validate_totalcost1()">
                                    <script>

                                        function  validate_totalcost1() {
                                            var quantity = document.getElementById("cargo_quantity").value;
                                            var z = 1;
                                            if (quantity >= z) {
                                                validate_totalcost2();



                                            } else
                                                return;


                                            console.log("validate_totalcost1() executed");
                                        }
                                    </script>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Customer Name : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control"   required id="cc_customername" readonly>


                                    <script>
                                        function customer_name_selected() {
                                            var es = document.getElementById("sel1");
                                            var odidc = es.options[es.selectedIndex].value;


                                            var xmlhttp9 = new XMLHttpRequest();
                                            xmlhttp9.onreadystatechange = function () {
                                                if (this.readyState == 4 && this.status == 200) {
                                                    document.getElementById("cc_customername").value = this.responseText;

                                                }
                                            };
                                            xmlhttp9.open("GET", "customer_name_stack_cargo?odidc=" + odidc, true);

                                            xmlhttp9.send();
                                            console.log("customer_name_selected() executed");
                                        }
                                    </script>

                                </div>


                                <label class="control-label col-sm-3">Customer ID : </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control"   required id="cu_cusid" readonly>


                                    <script>
                                        function customer_id_selected() {
                                            var es = document.getElementById("sel1");
                                            var odidc = es.options[es.selectedIndex].value;


                                            var xmlhttp8 = new XMLHttpRequest();
                                            xmlhttp8.onreadystatechange = function () {
                                                if (this.readyState == 4 && this.status == 200) {
                                                    document.getElementById("cu_cusid").value = this.responseText;

                                                }
                                            };
                                            xmlhttp8.open("GET", "customer_id_stack_cargo?odidc=" + odidc, true);

                                            xmlhttp8.send();
                                            console.log("customer_id_selected() executed");
                                        }
                                    </script>
                                </div>
                            </div>


                            <div class="form-group" >
                                <label class="control-label col-sm-2">Rental Price per Unit :(Rs)</label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" name="crental" min="0.01" step="0.01" value="00.00" required id="rentalpriceperunit_isertcargo" onkeyup="validate_totalcost3()">
                                    <script>
                                        function  validate_totalcost2() {

                                            var rentalperunit = document.getElementById("rentalpriceperunit_isertcargo").value;
                                            var t = 1;
                                            if (rentalperunit >= t) {
                                                validate_totalcost3();
                                            } else
                                                return;


                                            console.log("validate_totalcost2() executed");
                                        }
                                    </script>
                                </div>
                                <label class="control-label col-sm-3">Total Cost (Rs): </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" name="crental" min="0.01" step="0.01" value="00.00" required id="totalcoste_insercargo" readonly>


                                    <script>
                                        function validate_totalcost3() {

                                            var rentalperunit = document.getElementById("rentalpriceperunit_isertcargo").value;
                                            var quantity = document.getElementById("cargo_quantity").value;
                                            var xqw = rentalperunit * quantity;


                                            document.getElementById("totalcoste_insercargo").value = xqw;

                                            console.log("validate_totalcost3() executed");
                                        }
                                    </script>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-2"> Date : </label>
                                <div class="input-group date col-sm-3" >
                                    <input type="text" class="form-control" name="currentdate" id="WI_currentdate" required readonly>

                                </div>
                                <script>
                                    var today = new Date();
                                    var dd = today.getDate();
                                    var mm = today.getMonth() + 1; //January is 0!
                                    var yyyy = today.getFullYear();

                                    if (dd < 10) {
                                        dd = '0' + dd
                                    }

                                    if (mm < 10) {
                                        mm = '0' + mm
                                    }

                                    today = mm + '/' + dd + '/' + yyyy;
                                    document.getElementById("WI_currentdate").value = today;
                                    document.getElementById("insertcargo_due_date").setAttribute("min", today);


                                </script>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Due Date : </label>
                                <div class="input-group date col-sm-3" data-provide="datepicker">
                                    <input type="text" class="form-control" name="duedate" id="insertcargo_due_date"  onkeyup="getonkypressdate()" required>
                                    <label class="control-label col-sm-2" id="datetest"></label>
                                    <script>
                                        function getonkypressdate() {
                                            var dDate = document.getElementById('insertcargo_due_date').valueAsDate;
                                            var day = dDate.getDate();
                                            var month = dDate.getMonth();
                                            var year = dDate.getFullYear();

                                            document.getElementById('datetest').innerHTML = day;
                                        }
                                        var today = new Date();
                                        var dd = today.getDate();
                                        var mm = today.getMonth() + 1; //January is 0!
                                        var yyyy = today.getFullYear();

                                        if (dd < 10) {
                                            dd = '0' + dd
                                        }

                                        if (mm < 10) {
                                            mm = '0' + mm
                                        }

                                        today = mm + '/' + dd + '/' + yyyy;

                                        document.getElementById("insertcargo_due_date").setAttribute("min", today);


                                    </script>
                                    <div class="input-group-addon">
                                        <span class="glyphicon glyphicon-th"></span>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;"  id="insert_submit" onclick="validate()">Submit</button>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;display: none;" id="insert_update"   onclick="insert_updateeee()">Update</button>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;display: none;" id="cancel_update"   onclick="cancel_updateeee()">Cancel</button>
                            <label id="get_item_id_for_isert_data" style="display: block;">item_ID</label>
                            <script>


                                function get_itemDI() {
                                    var es = document.getElementById("sel1");
                                    var odidc = es.options[es.selectedIndex].value;
                                    var ess = document.getElementById("c_name");
                                    var itname = ess.options[ess.selectedIndex].innerHTML;

                                    if (itname == "") {
                                        console.log("it name is empty");
                                    } else
                                    {
                                        it_name = itname;
                                    }
                                    console.log(itname);
                                    var xmlhttp1 = new XMLHttpRequest();
                                    xmlhttp1.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            document.getElementById("get_item_id_for_isert_data").innerHTML = this.responseText;
                                        }
                                    };
                                    if (itname == "") {
                                        console.log("it name is empty");
                                    } else
                                    {
                                        xmlhttp1.open("GET", "get_item_id_stack_cargo?odid=" + odidc + "&itname=" + it_name, true);
                                    }


                                    xmlhttp1.send();
                                    console.log("get_itemDI() executed");
                                }
                            </script>
                            <label id="get_location_id_for_isert_data" style="display: block;">location</label>
                            <label id="get_warehouse_id_for_isert_data" style="display: block;">warehouse ID</label>
                            <script>
                                function get_locationDI() {
                                    var es = document.getElementById("sel1");
                                    var odidc = es.options[es.selectedIndex].value;

                                    var xmlhttp2 = new XMLHttpRequest();
                                    xmlhttp2.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            document.getElementById("get_location_id_for_isert_data").innerHTML = this.responseText;
                                        }
                                    };
                                    xmlhttp2.open("GET", "get_location_id_stack_cargo?odid=" + odidc, true);

                                    xmlhttp2.send();
                                    console.log("get_locationDI() executed");
                                }
                            </script>
                            <div id="succeefully_inserted_data" style="display: block;"></div>

                            <label id="check_data_div" style="display:block;"></label>
                            <input type="text" class="form-control"  id="search_insert_cargo"  onkeyup="search_insert_c(this.value)" placeholder="Search Customer Name or Item name or Item Type" style="width: 50%;">
                            <script>
                                function  validate() {
                                    console.log("validate() executed");
                                    var duedate = document.getElementById("insertcargo_due_date").value;
                                     var currentdate = document.getElementById("WI_currentdate").value;
                                    var today = new Date();
                                    var dd = today.getDate();
                                    var mm = today.getMonth() + 1; //January is 0!
                                    var yyyy = today.getFullYear();

                                    if (dd < 10) {
                                        dd = '0' + dd
                                    }

                                    if (mm < 10) {
                                        mm = '0' + mm
                                    }

                                    today = mm + '/' + dd + '/' + yyyy;
                  

                                    var esdd = document.getElementById("sel1");
                                    var odidccc = esdd.options[esdd.selectedIndex].value;
                                    var cd;
                                    var itemiddd = document.getElementById("get_item_id_for_isert_data").innerHTML;
                                    console.log("chech data order id = " + odidccc);
                                    console.log("chech data item id = " + itemiddd);
                                    var xmlhttp5 = new XMLHttpRequest();
                                    xmlhttp5.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            cd = this.responseText;
                                            console.log("check data respone = " + cd);
                                            if (cd == 12)
                                            {
                                                alert("Already inserted");
                                            }else if(duedate<=currentdate){
                                                alert("Due date must be greater than current date");
                                            }
                                            else
                                            {
                                                insertdata();
                                            }
                                        }
                                    };
                                    xmlhttp5.open("GET", "check_data_stack_cargo?odid=" + odidccc + "&itid=" + itemiddd, true);

                                    xmlhttp5.send();

                                    console.log("check_data  executed");




                                }

                                function insertdata() {






                                    var yu = document.getElementById("check_data_div").innerHTML;
                                    if (yu == 12) {

                                        alert("already inserted");


                                    } else {

                                        var cargotype = document.getElementById("insert_cargo_type").value;

                                        var es = document.getElementById("sel1");
                                        var odid = es.options[es.selectedIndex].value;
                                        var esdd = document.getElementById("c_name");
                                        var cargoname = es.options[es.selectedIndex].value;
                                        var itemid = document.getElementById("get_item_id_for_isert_data").innerHTML;
                                        var locationid = document.getElementById("get_location_id_for_isert_data").innerHTML;

                                        var quantity = document.getElementById("cargo_quantity").value;
                                        var cusname = document.getElementById("cc_customername").value;
                                        var cusid = document.getElementById("cu_cusid").value;
                                        var rent = document.getElementById("rentalpriceperunit_isertcargo").value;
                                        var cost = document.getElementById("totalcoste_insercargo").value;
                                        var currentdate = document.getElementById("WI_currentdate").value;
                                        var duedate = document.getElementById("insertcargo_due_date").value;
                                        if (cargotype != "" && odid != "" && itemid != "" && locationid != "" && cargoname != "" && quantity != "" && cusname != "" && cusid != "" && rent != "" && cost != "" && currentdate != "" && duedate != "") {

                                            var xmlhttp = new XMLHttpRequest();
                                            xmlhttp.open("GET", "Stack_Cargo?odid=" + odid + "&cargoname=" + cargoname + "&cargotype=" + cargotype + "&quantity=" + quantity + "&cusname=" + cusname + "&cusid=" + cusid + "&rent=" + rent + "&cost=" + cost + "&currentdate=" + currentdate + "&duedate=" + duedate + "&itemid=" + itemid + "&locationid=" + locationid, true);
                                            xmlhttp.send(null);
                                            xmlhttp.onreadystatechange = function () {
                                                if (this.readyState == 4 && this.status == 200) {

                                                    document.getElementById("succeefully_inserted_data").innerHTML = this.responseText;
                                                    getcargodetails_into_table();
                                                }
                                            };


                                            console.log("insertdata() data send ok");


                                            console.log("insertdata() executed");
                                        } else {
                                            alert("Data Fields must not be empty");
                                        }

                                    }
//                                    document.getElementById("check_data_div").innerHTML = "";
                                }



                                function getcargodetails_into_table() {


                                    var xmlhttp6 = new XMLHttpRequest();
                                    xmlhttp6.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            document.getElementById("inerttablewarehousein_div").innerHTML = this.responseText;

                                        }
                                    };
                                    xmlhttp6.open("GET", "get_cargo_details_stack_cargo", true);

                                    xmlhttp6.send();
                                    console.log("getcargodetails_into_table() executed");
                                }

                                function delete_table(raw_INDEX) {



                                    var w_id = document.getElementById("insert_cargo_table").rows[raw_INDEX].cells[0].innerHTML;

                                    console.log(w_id);

                                    var xmlhttp6 = new XMLHttpRequest();
                                    xmlhttp6.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {
                                            console.log("After Deketed : " + this.responseText);
                                            getcargodetails_into_table();

                                        }
                                    };
                                    xmlhttp6.open("GET", "delete_stack_cargo?w_id=" + w_id, true);

                                    xmlhttp6.send();

                                    getcargodetails_into_table();
                                    console.log("delete_table() executed");
                                }
                                function rowindex(x) {

                                    var rawIndex = x.rowIndex;
                                    document.getElementById("rawindex_insert").innerHTML = rawIndex;

                                }
                                function edit_table(raw)
                                {

                                    document.getElementById("get_warehouse_id_for_isert_data").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[0].innerHTML;

                                    document.getElementById("cu_cusid").value = document.getElementById("insert_cargo_table").rows[raw].cells[2].innerHTML;
                                    var es = document.getElementById("sel1");
                                    es.value = document.getElementById("insert_cargo_table").rows[raw].cells[1].innerHTML;
                                    document.getElementById("cc_customername").value = document.getElementById("insert_cargo_table").rows[raw].cells[3].innerHTML;
                                    var es = document.getElementById("c_name");

                                    es.value = document.getElementById("insert_cargo_table").rows[raw].cells[4].innerHTML;
                                    document.getElementById("insert_cargo_type").value = document.getElementById("insert_cargo_table").rows[raw].cells[5].innerHTML;
                                    document.getElementById("cargo_quantity").value = document.getElementById("insert_cargo_table").rows[raw].cells[6].innerHTML;
                                    document.getElementById("rentalpriceperunit_isertcargo").value = document.getElementById("insert_cargo_table").rows[raw].cells[7].innerHTML;
                                    document.getElementById("WI_currentdate").value = document.getElementById("insert_cargo_table").rows[raw].cells[8].innerHTML;
                                    document.getElementById("insertcargo_due_date").value = document.getElementById("insert_cargo_table").rows[raw].cells[9].innerHTML;
                                    document.getElementById("get_item_id_for_isert_data").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[10].innerHTML;
                                    document.getElementById("get_location_id_for_isert_data").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[11].innerHTML;
                                    document.getElementById("insert_update").style.display = 'block';
                                    document.getElementById("insert_submit").style.display = 'none';



                                    document.getElementById("totalcoste_insercargo").value = document.getElementById("insert_cargo_table").rows[raw].cells[7].innerHTML * document.getElementById("insert_cargo_table").rows[raw].cells[6].innerHTML;
                                    document.getElementById("cancel_update").style.display = 'block';
                                }


                                function insert_updateeee() {
                                    console.log("update data started");
                                    var cargotype = document.getElementById("insert_cargo_type").value;

                                    var es = document.getElementById("sel1");
                                    var odid = es.options[es.selectedIndex].value;
                                    var cargoname = document.getElementById("c_name").value;
                                    var itemid = document.getElementById("get_item_id_for_isert_data").innerHTML;
                                    var locationid = document.getElementById("get_location_id_for_isert_data").innerHTML;

                                    var quantity = document.getElementById("cargo_quantity").value;
                                    var cusname = document.getElementById("cc_customername").value;
                                    var cusid = document.getElementById("cu_cusid").value;
                                    var rent = document.getElementById("rentalpriceperunit_isertcargo").value;
                                    var cost = document.getElementById("totalcoste_insercargo").value;
                                    var currentdate = document.getElementById("WI_currentdate").value;
                                    var duedate = document.getElementById("insertcargo_due_date").value;
                                    var wareID = document.getElementById("get_warehouse_id_for_isert_data").innerHTML;

                                    if (cargotype != "" && odid != "" && itemid != "" && locationid != "" && quantity != "" && cusname != "" && cusid != "" && rent != "" && cost != "" && currentdate != "" && duedate != "" && wareID != "") {

                                        var xmlhttp20 = new XMLHttpRequest();
                                        xmlhttp20.open("GET", "edit_stack_cargo?odid=" + odid + "&cargoname=" + cargoname + "&cargotype=" + cargotype + "&quantity=" + quantity + "&cusname=" + cusname + "&cusid=" + cusid + "&rent=" + rent + "&cost=" + cost + "&currentdate=" + currentdate + "&duedate=" + duedate + "&itemid=" + itemid + "&locationid=" + locationid + "&wareid=" + wareID, true);
                                        xmlhttp20.send(null);
                                        xmlhttp20.onreadystatechange = function () {
                                            if (this.readyState == 4 && this.status == 200) {

                                                document.getElementById("succeefully_inserted_data").innerHTML = this.responseText;
                                                getcargodetails_into_table();
                                            }
                                        };

                                        getcargodetails_into_table();
                                        console.log("update data send ok");


                                        console.log("update data executed");
                                    } else {
                                        alert("Data Fields must not be empty");
                                    }


                                }
                                function cancel_updateeee() {
                                    document.getElementById("insert_update").style.display = 'none';
                                    document.getElementById("insert_submit").style.display = 'block';
                                    document.getElementById("cancel_update").style.display = 'none';
                                }
                                function  search_insert_c(key) {
                                <%--  https://www.w3schools.com/howto/howto_js_filter_table.asp    --%>
                                    // Declare variables 
                                    console.log("search_insert_c(key) executed");
                                    var input, filter, table, tr, td,td1,td2, i,d;
                                  
                                    filter = key.toUpperCase();
                                    table = document.getElementById("insert_cargo_table");
                                    tr = table.getElementsByTagName("tr");

                                    // Loop through all table rows, and hide those who don't match the search query
                                    for (i = 1; i < tr.length; i++) {
                                        
                                        
                                             td = tr[i].getElementsByTagName("td")[3];
                                             td1 = tr[i].getElementsByTagName("td")[4];
                                             td2 = tr[i].getElementsByTagName("td")[5];
                                        if (td) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                                tr[i].style.display = "";
                                                console.log("search found result");
                                            }else if(td1.innerHTML.toUpperCase().indexOf(filter) > -1){
                                                 tr[i].style.display = "";
                                            }else if(td2.innerHTML.toUpperCase().indexOf(filter) > -1){
                                                 tr[i].style.display = "";
                                            }
                                            
                                            else {
                                                tr[i].style.display = "none";
                                                console.log("search NOT found result");
                                            }
                                        
                                    }
                                    }
                                }
                            </script>
                            <label id="rawindex_insert"></label>
                        </form>

                        <%-- .............Insertion Table..................................................--%>

                        <div style="margin-top: 20px;margin-bottom: 20px;" id="inerttablewarehousein_div">

                        </div>

                    </div>
                </section>

                <%-- .......................Search Form .............................................................................................................................................................    --%>

                <section>
                    <div class="search container" id="searchC_div" style="box-shadow: 0 0 1px black;display: none">


                    </div>  
                </section>

                <%--............................Release Cargo Form ................................................................................................................................................................--%>

                <section>
                    <div class="release container" id="releaseC_div" style="box-shadow: 0 0 1px black;display: none">

                        <form class="form-horizontal" action="#" style="margin-top: 20px;margin-left: 10%;">
                            <div class="form-group" style="">
                                <label class="control-label col-sm-2">Order ID : </label>
                                <div class="col-sm-3">


                                    <select class="form-control" id="sel1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>

                                </div>




                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Cargo Name : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="cname" placeholder="Select a Cargo Name">
                                </div>



                                <label class="control-label col-sm-3">Cargo Type : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Quantity : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="cquantity">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Customer Name : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="ccustomer">
                                </div>



                            </div>


                            <div class="form-group" >
                                <label class="control-label col-sm-2">Cost : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Due Date : </label>
                                <div class="input-group date col-sm-3" data-provide="datepicker">
                                    <input type="text" class="form-control">
                                    <div class="input-group-addon">
                                        <span class="glyphicon glyphicon-th"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">current Date : </label>
                                <div class="input-group date col-sm-3" data-provide="datepicker">
                                    <input type="text" class="form-control">
                                    <div class="input-group-addon">
                                        <span class="glyphicon glyphicon-th"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Late Days : </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" id="ccustomer">
                                </div>



                                <label class="control-label col-sm-3">cost per Late Day : </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" id="cuID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Total Cost : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>
                            <button type="button"  class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>

                        </form>

                        <%-- .............Released Table..................................................--%>

                        <div style="margin-top: 20px;margin-bottom: 20px;">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Customer ID</th>
                                        <th>Customer Name</th>
                                        <th>Cargo Name</th>
                                        <th>Cargo Type</th>
                                        <th>Quantity</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>23</td>
                                        <td>vishwa</td>
                                        <td>Fuel Barell</td>
                                        <td>Danger Cargo</td>
                                        <td>22</td>
                                        <td>1/2/2018</td>
                                    </tr>
                                    <tr>
                                        <td>83</td>
                                        <td>rishitha</td>
                                        <td>Mortors</td>
                                        <td>Normal Cargo</td>
                                        <td>46</td>
                                        <td>20/8/2018</td>
                                    </tr>
                                    <tr>
                                        <td>238</td>
                                        <td>ishan</td>
                                        <td>Fish Barells</td>
                                        <td>Food Cargo</td>
                                        <td>89</td>
                                        <td>7/2/2018</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>  
                </section>   

                <%--............................Warehouse Space.............................................................................................................................................................................--%>

                <section>
                    <div class="space container" id="Wspace_div" style="box-shadow: 0 0 1px black;display: none;font-size: 20px;">

                        <div id="chartContainer2" style="height: 370px; width: 50%;margin-left: 25%;margin-top: 50px;margin-bottom: 50px;"></div>


                    </div>  
                </section> 

                <%--............................History..............................................................................................................................................................--%>

                <section>
                    <div class="history container" id="historyC_div" style="box-shadow: 0 0 1px black;display: none">

                        <div class="content tab-pane fade in active">
                            <h2> Cargo Stacking</h2> 
                            <div style="margin-top: 20px;margin-bottom: 20px;" >
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Customer ID</th>
                                            <th>Customer Name</th>
                                            <th>Cargo Name</th>
                                            <th>Cargo Type</th>
                                            <th>Quantity</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>23</td>
                                            <td>vishwa</td>
                                            <td>Fuel Barell</td>
                                            <td>Danger Cargo</td>
                                            <td>22</td>
                                            <td>1/2/2018</td>
                                        </tr>
                                        <tr>
                                            <td>83</td>
                                            <td>rishitha</td>
                                            <td>Mortors</td>
                                            <td>Normal Cargo</td>
                                            <td>46</td>
                                            <td>20/8/2018</td>
                                        </tr>
                                        <tr>
                                            <td>238</td>
                                            <td>ishan</td>
                                            <td>Fish Barells</td>
                                            <td>Food Cargo</td>
                                            <td>89</td>
                                            <td>7/2/2018</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="caontainer">
                                <h2> Payments</h2>
                                <div style="margin-top: 20px;margin-bottom: 20px;">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Customer ID</th>
                                                <th>Customer Name</th>
                                                <th>Cargo Type</th>
                                                <th>Quantity</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>12</td>
                                                <td>Ishan</td>
                                                <td>Danger Cargo</td>
                                                <td>25</td>
                                                <td>2/5/2018</td>
                                            </tr>
                                            <tr>
                                                <td>12</td>
                                                <td>Ruwan.P</td>
                                                <td>Food Cargo</td>
                                                <td>225</td>
                                                <td>6/5/2018</td>
                                            </tr>
                                            <tr>
                                                <td>12</td>
                                                <td>Kisal</td>
                                                <td>Normal Cargo</td>
                                                <td>23</td>
                                                <td>25/5/2018</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>  
                </section>   


                <script>

                    function home() {
                        location.reload(true);
                        document.getElementById("Whead").innerHTML = 'Warehouse Home';
                        document.getElementById("ware_home_div").style.display = 'block';
                        document.getElementById("insertcargo").style.display = 'none';
                        document.getElementById("searchC_div").style.display = 'none';
                        document.getElementById("releaseC_div").style.display = 'none';
                        document.getElementById("Wspace_div").style.display = 'none';
                        document.getElementById("historyC_div").style.display = 'none';

                    }
                    function insertcargo() {


                        document.getElementById("Whead").innerHTML = 'Insert Cargo Details';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'block';
                        document.getElementById("searchC_div").style.display = 'none';
                        document.getElementById("releaseC_div").style.display = 'none';
                        document.getElementById("Wspace_div").style.display = 'none';
                        document.getElementById("historyC_div").style.display = 'none';



                        cargo_name_selected();

                        customer_name_selected();
                        customer_id_selected();
                        getcargodetails_into_table();

                        $(document).ready(function () {
                            cargo_type_selected();


                        });

                    }


                    function search1() {
                        document.getElementById("Whead").innerHTML = 'Search Cargo Details';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';
                        document.getElementById("searchC_div").style.display = 'block';
                        document.getElementById("releaseC_div").style.display = 'none';
                        document.getElementById("Wspace_div").style.display = 'none';
                        document.getElementById("historyC_div").style.display = 'none';

                    }
                    function releasecargo() {
                        document.getElementById("Whead").innerHTML = 'Release Cargo ';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';
                        document.getElementById("searchC_div").style.display = 'none';
                        document.getElementById("releaseC_div").style.display = 'block';
                        document.getElementById("Wspace_div").style.display = 'none';
                        document.getElementById("historyC_div").style.display = 'none';

                    }
                    function warehousingspace() {



                        document.getElementById("Whead").innerHTML = 'Warehouse Space';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';
                        document.getElementById("searchC_div").style.display = 'none';
                        document.getElementById("releaseC_div").style.display = 'none';
                        document.getElementById("Wspace_div").style.display = 'block';
                        document.getElementById("historyC_div").style.display = 'none';
                    }
                    function history() {
                        document.getElementById("Whead").innerHTML = 'Warehouse History';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';
                        document.getElementById("searchC_div").style.display = 'none';
                        document.getElementById("releaseC_div").style.display = 'none';
                        document.getElementById("Wspace_div").style.display = 'none';
                        document.getElementById("historyC_div").style.display = 'block';

                    }

                </script>
            </div>
        </div>

    </body>
</html>
