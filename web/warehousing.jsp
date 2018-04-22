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
        <link href="https://fonts.googleapis.com/css?family=Julius+Sans+One" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=McLaren" rel="stylesheet">
        <title>warehousing</title>
        <style>
            input[type="text"]
            {
                font-size:24px;
            }

            input[type="number"]
            {
                font-size:24px;
            }

            select>option
            {
                font-size:24px;
            }
            select
            {
                font-size:24px;
            }

        </style>
        <script>
 <%-- https://canvasjs.com/javascript-charts/animated-chart/ ........................................................................................................--%>

            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer2", {
                    animationEnabled: true,
                    theme: "dark2", // "light1", "light2", "dark1", "dark2"
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
    <body id="wareH" style="display: block;"  >


        <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="header container" style="width: 100%;">

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;padding-bottom: 20px;"><h1 id="nnnnnn" style="margin-left: 40%;font-family: 'Mitr', sans-serif;">Warehousing</h1>

                    </div>

                    <div class="mainbtn container" style="margin-top:5px;margin-left: 30%;font-size: 30px;font-family: 'McLaren', cursive;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="home()">Home</a></li>
                            <li><a data-toggle="tab"  onclick="insertcargo()">Insert Cargo</a></li>

                            <li><a data-toggle="tab" onclick="releasecargo()">Release Cargo</a></li>

                        </ul>
                    </div>
                </div>
            </header>

            <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 0%;background-color: #e1e1ec;"><h1 id="Whead" style="margin-left: 38%;font-family: 'Mitr', sans-serif;">Warehouse Home</h1></div>

                <%--..................................Home.............................................................................................................................................................--%>

                <section>


                    <div class="warehousing_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">

                        <div id="chartContainer" style="width: 100%; height: 300px ; display: block;margin-top: 50px;margin-bottom:  50px;"></div> 
                        <script type="text/javascript">
                            var xmlhttph1 = new XMLHttpRequest();
                            xmlhttph1.onreadystatechange = function () {
                                if (this.readyState == 4 && this.status == 200) {

                                    document.getElementById("home_table_warehousing_ish").innerHTML = this.responseText;

                                    var normal_max = document.getElementById("home_quantity_warehouse_cargo_table").rows[1].cells[1].innerHTML;
                                    var normal_onh = document.getElementById("home_quantity_warehouse_cargo_table").rows[2].cells[1].innerHTML;

                                    var danger_max = document.getElementById("home_quantity_warehouse_cargo_table").rows[4].cells[1].innerHTML;
                                    var danger_onh = document.getElementById("home_quantity_warehouse_cargo_table").rows[5].cells[1].innerHTML;

                                    var food_max = document.getElementById("home_quantity_warehouse_cargo_table").rows[7].cells[1].innerHTML;
                                    var food_onh = document.getElementById("home_quantity_warehouse_cargo_table").rows[8].cells[1].innerHTML;

                                    var refregirator_max = document.getElementById("home_quantity_warehouse_cargo_table").rows[10].cells[1].innerHTML;
                                    var refregirator_onh = document.getElementById("home_quantity_warehouse_cargo_table").rows[11].cells[1].innerHTML;


                                    var no_perc = (normal_onh / normal_max) * 100;
                                    var dn_perc = (danger_onh / danger_max) * 100;
                                    var fo_perc = (food_onh / food_max) * 100;
                                    var re_perc = (refregirator_onh / refregirator_max) * 100;





                                    var n = Math.round(no_perc * 10) / 10;
                                    var d = Math.round(dn_perc * 10) / 10;
                                    var f = Math.round(fo_perc * 10) / 10;
                                    var r = Math.round(re_perc * 10) / 10;
                                    
   <%--................................ https://canvasjs.com/javascript-charts/animated-chart/  .............................................................................................--%>
                                   
                                        $("#chartContainer").CanvasJSChart({
                                        title: {
                                            text: "Stacked Cargo",
                                            fontSize: 50,

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
                                                    {label: "Normal Cargo", y: n, legendText: "Normal Cargo"},
                                                    {label: "Danger Cargo", y: d, legendText: "Danger Cargo"},
                                                    {label: "Food Cargo", y: f, legendText: "Food Cargo"},
                                                    {label: "Refregirator Cargo", y: r, legendText: "Refregirator Cargo"},
                                                ]
                                            }
                                        ]
                                    });
                                }
                            };
                            xmlhttph1.open("GET", "get_quantities", true);
                            xmlhttph1.send();

                        </script> 
                        <div class="container" id="home_table_warehousing_ish" ></div>

                        <script>



                        </script>
                    </div>
                </section>

                <%--..................................Insertion Form.............................................................................................................................................................--%>

                <section>
                    <div class="insert-cargo container" id="insertcargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">

                        <form class="form-horizontal"    style="margin-top: 20px;margin-left: 0%;display: block;font-size: 25px;font-family: 'Julius Sans One', sans-serif;background-color: #b2beb559;padding-left: 50px;padding-top: 50px;">


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
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 5px; font-size:24px;background-color: green;color: white;"  id="insert_submit" onclick="validate()">Submit</button>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 5px;display: none; font-size:24px;background-color: blue;color: white;" id="insert_update"   onclick="insert_updateeee()">Update</button>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 5px;display: none; font-size:24px;" id="cancel_update"   onclick="cancel_updateeee()">Cancel</button>
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

                            <input type="text" class="form-control"  id="search_insert_cargo"  onkeyup="search_insert_c(this.value)" placeholder="Search Customer Name or Item name or Item Type" style="width: 50%;" >

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
                                            } else if (duedate <= currentdate) {
                                                alert("Due date must be greater than current date");
                                            } else
                                            {
                                                check_quantity();
                                            }
                                        }
                                    };
                                    xmlhttp5.open("GET", "check_data_stack_cargo?odid=" + odidccc + "&itid=" + itemiddd, true);

                                    xmlhttp5.send();

                                    console.log("check_data  executed");

                                }
                                function check_quantity() {

                                    var quantity = document.getElementById("cargo_quantity").value;
                                    var itemid = document.getElementById("get_item_id_for_isert_data").innerHTML;
                                    var xmlhttpqu1 = new XMLHttpRequest();
                                    xmlhttpqu1.open("GET", "quantities?quantity=" + quantity + "&itemid=" + itemid, true);
                                    xmlhttpqu1.send(null);
                                    xmlhttpqu1.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            var ty = this.responseText;
                                            if (ty == 1) {
                                                alert("SORRY : There are No Space")
                                            } else {

                                                insertdata();
                                                getcargodetails_into_table();

                                            }

                                        }
                                    };
                                    getcargodetails_into_table();
                                }

                                function insertdata() {






                                    var yu = document.getElementById("check_data_div").innerHTML;
                                    if (yu == 12) {

                                        alert("already inserted");


                                    } else {
                                        var isre = 0;
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
                                            xmlhttp.open("GET", "Stack_Cargo?odid=" + odid + "&cargoname=" + cargoname + "&cargotype=" + cargotype + "&quantity=" + quantity + "&cusname=" + cusname + "&cusid=" + cusid + "&rent=" + rent + "&cost=" + cost + "&currentdate=" + currentdate + "&duedate=" + duedate + "&itemid=" + itemid + "&locationid=" + locationid + "&isre=" + isre, true);
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
                                   customer_id_selected(); 
                                   customer_name_selected();  
                                   cargo_name_selected();  
                                   cargo_type_selected();
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
                                    var input, filter, table, tr, td, td1, td2, i, d;

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
                                            } else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                                tr[i].style.display = "";
                                            } else if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                                tr[i].style.display = "";
                                            } else {
                                                tr[i].style.display = "none";
                                                console.log("search NOT found result");
                                            }

                                        }
                                    }
                                }
                            </script>
                            <label id="rawindex_insert" style="display: none;"></label>
                        </form>
                        <%-- .............Insertion Table..................................................--%>

                        <div style="margin-top: 20px;margin-bottom: 20px;" id="inerttablewarehousein_div">

                        </div>

                    </div>
                </section>

                <%--............................Release Cargo Form ................................................................................................................................................................--%>

                <section>
                    <div class="release container" id="releaseC_div" style="box-shadow: 0 0 1px black;display: none">

                        <form class="form-horizontal" action="#" style="margin-top: 20px;margin-left: 0%;display: block;font-size: 25px;font-family: 'Julius Sans One', sans-serif;background-color: #b2beb559;padding-left: 50px;padding-top: 50px;">
                            <div class="form-group" style="">
                                <label class="control-label col-sm-2">Order ID : </label>
                                <div class="col-sm-3">

                                    <input type="text" class="form-control" id="release_order_id" readonly>


                                </div>




                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Cargo Name : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="release_cname"  readonly>
                                </div>



                                <label class="control-label col-sm-3">Cargo Type : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="release_ctype" readonly>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Quantity : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="release_cquantity" readonly>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Customer Name : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="release_ccustomer" readonly>
                                </div>



                            </div>


                            <div class="form-group" >
                                <label class="control-label col-sm-2">Cost : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="release_cost" readonly>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Due Date : </label>
                                <div class="input-group date col-sm-3" >
                                    <input type="text" class="form-control" readonly id="release_duedate">

                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">current Date : </label>
                                <div class="input-group date col-sm-3" >
                                    <input type="text" class="form-control" id="release_current_date" readonly>

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

                                    today = yyyy + '-' + mm + '-' + dd;
                                    document.getElementById("release_current_date").value = today;
                                </script>
                            </div>
                            <div class="form-group" id="late_release_div1" >
                                <label class="control-label col-sm-2">Late Days : </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" id="release_latedays" value="0" readonly>
                                </div>



                                <label class="control-label col-sm-3">cost per Late Day : </label>
                                <div class="col-sm-3">
                                    <input type="number" class="form-control" id="release_cost_perday" min="0.01" step="0.01" value="00.00" onkeyup="calculate()">
                                </div>
                            </div>
                            <div class="form-group" id="late_release_div2">
                                <label class="control-label col-sm-2">Total Cost : </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="release_total_cost" readonly>
                                </div>
                            </div>
                            <button type="button"  class="btn btn-default" style="margin-left: 60%;margin-bottom: 5px; font-size:24px;background-color: red;color: white" id="release_submit" onclick="check_release_c()">Release</button>
                            <button type="button"  class="btn btn-default" style="margin-left: 60%;margin-bottom: 5px;display: none; font-size:24px;background-color: blue;color: white;"  id="release_update_submit" onclick="update_release_cargo()">Update</button>
                            <button type="button"  class="btn btn-default" style="margin-left: 60%;margin-bottom: 5px; display: none; font-size:24px;" id="release_cancel_submit"  onclick="cancel_release_cargo()">Cancel</button>
                            <label id="release_wareid_label" style="display: none;">wareid</label>
                            <label id="release_cusid_label" style="display: none;">cus id</label>
                            <label id="release_itemid_label" style="display: none;">item id</label>
                            <label id="release_locationid_label" style="display: none;">location id</label>
                            <label id="release_receiveDate_label" style="display: none;">receive date </label>
                            <label id="release_succesfull_label" style="display: none;"></label>
                            <label id="release_rawindex_label" style="display: none;">raw index </label>
                            <label id="release_wareout_label" style="display: none;">warehouse out Id</label>


                            <input type="text" class="form-control"  id="search_release_cargo"  onkeyup="search_release_c(this.value)" placeholder="Search Customer Name or Item name or Item Type" style="width: 50%;" >

                        </form>
                        <script>
                            function calculate() {
                                var cost = document.getElementById("release_cost").value;
                                var lated = document.getElementById("release_latedays").value;
                                var latfeeperday = document.getElementById("release_cost_perday").value;
                                var totalcost = (lated * latfeeperday);
                                var totalcost2 = totalcost + parseInt(cost);
                                document.getElementById("release_total_cost").value = totalcost2;

                            }
                            function release_information(raw) {

                                show_release_cargo_table();
                                document.getElementById("release_rawindex_label").innerHTML = raw;
                                document.getElementById("release_wareid_label").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[0].innerHTML;
                                document.getElementById("release_order_id").value = document.getElementById("insert_cargo_table").rows[raw].cells[1].innerHTML;
                                document.getElementById("release_cusid_label").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[2].innerHTML;


                                document.getElementById("release_ccustomer").value = document.getElementById("insert_cargo_table").rows[raw].cells[3].innerHTML;

                                document.getElementById("release_cname").value = document.getElementById("insert_cargo_table").rows[raw].cells[4].innerHTML;
                                document.getElementById("release_ctype").value = document.getElementById("insert_cargo_table").rows[raw].cells[5].innerHTML;
                                document.getElementById("release_cquantity").value = document.getElementById("insert_cargo_table").rows[raw].cells[6].innerHTML;
                                document.getElementById("release_cost").value = document.getElementById("insert_cargo_table").rows[raw].cells[7].innerHTML * document.getElementById("insert_cargo_table").rows[raw].cells[6].innerHTML;
                                document.getElementById("release_receiveDate_label").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[8].innerHTML;
                                document.getElementById("release_duedate").value = document.getElementById("insert_cargo_table").rows[raw].cells[9].innerHTML;
                                document.getElementById("release_itemid_label").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[10].innerHTML;
                                document.getElementById("release_locationid_label").innerHTML = document.getElementById("insert_cargo_table").rows[raw].cells[11].innerHTML;

                                var dueD = document.getElementById("release_duedate").value;

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

                                today = yyyy + '-' + mm + '-' + dd;



                                var date1 = new Date(dueD);
                                var date2 = new Date(today);
                                var timeDiff = date2.getTime() - date1.getTime();
                                var lateDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

                                if (lateDays <= 0) {
                                    document.getElementById("late_release_div2").style.display = "none";
                                    document.getElementById("late_release_div1").style.display = "none";
                                    document.getElementById("release_latedays").value=0;
                                    calculate();

                                } else {
                                    console.log("late days = " + lateDays);
                                    document.getElementById("release_latedays").value = lateDays;

                                }


                                document.getElementById("Whead").innerHTML = 'Release Cargo ';
                                document.getElementById("ware_home_div").style.display = 'none';
                                document.getElementById("insertcargo").style.display = 'none';

                                document.getElementById("releaseC_div").style.display = 'block';


                            }
                            function release_cargo() {



                                var due = document.getElementById("release_duedate").value;
                                var cusname = document.getElementById("release_ccustomer").value;
                                var ware = document.getElementById("release_wareid_label").innerHTML;


                                var raw = document.getElementById("release_rawindex_label").innerHTML



                                var itmid = document.getElementById("release_itemid_label").innerHTML;

                                var quan = document.getElementById("release_cquantity").value;
                                var cost = document.getElementById("release_latedays").value * document.getElementById("release_cost_perday").value;
                                var totalcost = document.getElementById("release_total_cost").value;

                                var released = document.getElementById("release_current_date").value;
                                var lated = document.getElementById("release_latedays").value;
                                var latfeeperday = document.getElementById("release_cost_perday").value;
                                var locid = document.getElementById("release_locationid_label").innerHTML;
                                if (document.getElementById("late_release_div2").style.display == "none" &&
                                        document.getElementById("late_release_div1").style.display == "none" && document.getElementById("release_cost_perday").value == "") {

                                    alert("Release cost per Day cannot be empty");
                                } else if (document.getElementById("release_order_id").value == "" && document.getElementById("late_release_div2").style.display == "none" &&
                                        document.getElementById("late_release_div1").style.display == "none" && document.getElementById("release_cost_perday").value == "")
                                {
                                    alert("data fields canot be empty");
                                } else {

                                    var xmlhttpr1 = new XMLHttpRequest();
                                    xmlhttpr1.open("GET", "Release_Cargo?ware=" + ware + "&due=" + due + "&cusname=" + cusname + "&itmid=" + itmid + "&quan=" + quan + "&cost=" + cost + "&totalcost=" + totalcost + "&released=" + released + "&lated=" + lated + "&cost=" + cost + "&latfeeperday=" + latfeeperday + "&locid=" + locid, true);
                                    xmlhttpr1.send(null);
                                    xmlhttpr1.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            document.getElementById("release_succesfull_label").innerHTML = this.responseText;
                                            show_release_cargo_table();
                                        }
                                    };

                                    var isw = 1;
                                    var xmlhttpr3 = new XMLHttpRequest();
                                    xmlhttpr3.open("GET", "isReleased?isw=" + isw + "&ware=" + ware, true);
                                    xmlhttpr3.send(null);
                                    xmlhttpr3.onreadystatechange = function () {
                                        if (this.readyState == 4 && this.status == 200) {

                                            document.getElementById("release_succesfull_label").innerHTML = this.responseText;
                                            show_release_cargo_table();
                                            getcargodetails_into_table();
                                        }
                                    };

                                }
                                getcargodetails_into_table();
                                show_release_cargo_table();
                            }
                            function show_release_cargo_table() {

                                var xmlhttpr2 = new XMLHttpRequest();
                                xmlhttpr2.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {

                                        document.getElementById("release_cargo_table_div").innerHTML = this.responseText;

                                    }
                                };
                                xmlhttpr2.open("GET", "get_release_details_release_cargo", true);

                                xmlhttpr2.send();
                                console.log("show_release_cargo_table() executed");

                            }
                            function delete_release_table(raw) {
                                raw = raw - 10;
                                var wout_id = document.getElementById("release_cargo_table").rows[raw].cells[0].innerHTML;

                                console.log(wout_id);

                                var xmlhttpr6 = new XMLHttpRequest();
                                xmlhttpr6.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        console.log("After Deleted release cargo : " + this.responseText);
                                        show_release_cargo_table();

                                    }
                                };
                                xmlhttpr6.open("GET", "delete_release_cargo?wout_id=" + wout_id, true);

                                xmlhttpr6.send();

                                show_release_cargo_table();
                                console.log("delete_release_table() executed");
                            }
                            function edit_release_table(raw) {
                                raw = raw - 10;

                                var lated = document.getElementById("release_cargo_table").rows[raw].cells[10].innerHTML;
                                var latfeeperday = document.getElementById("release_cargo_table").rows[raw].cells[11].innerHTML;
                                var totalcost = document.getElementById("release_cargo_table").rows[raw].cells[12].innerHTML;
                                var cost = (lated * latfeeperday);

                                var cost2 = parseInt(totalcost) - parseInt(cost);

                                document.getElementById("release_cost").value = cost2;

                                document.getElementById("release_wareout_label").innerHTML = document.getElementById("release_cargo_table").rows[raw].cells[0].innerHTML;

                                document.getElementById("release_wareid_label").innerHTML = document.getElementById("release_cargo_table").rows[raw].cells[1].innerHTML;
                                document.getElementById("release_order_id").value = document.getElementById("release_cargo_table").rows[raw].cells[2].innerHTML;
                                document.getElementById("release_ccustomer").value = document.getElementById("release_cargo_table").rows[raw].cells[3].innerHTML;
                                document.getElementById("release_itemid_label").innerHTML = document.getElementById("release_cargo_table").rows[raw].cells[4].innerHTML;


                                document.getElementById("release_cname").value = document.getElementById("release_cargo_table").rows[raw].cells[5].innerHTML;
                                document.getElementById("release_ctype").value = document.getElementById("release_cargo_table").rows[raw].cells[6].innerHTML;
                                document.getElementById("release_cquantity").value = document.getElementById("release_cargo_table").rows[raw].cells[7].innerHTML;
                                document.getElementById("release_duedate").value = document.getElementById("release_cargo_table").rows[raw].cells[8].innerHTML;
                                document.getElementById("release_current_date").value = document.getElementById("release_cargo_table").rows[raw].cells[9].innerHTML;
                                document.getElementById("release_latedays").value = document.getElementById("release_cargo_table").rows[raw].cells[10].innerHTML;
                                document.getElementById("release_cost_perday").value = document.getElementById("release_cargo_table").rows[raw].cells[11].innerHTML;
                                document.getElementById("release_total_cost").value = document.getElementById("release_cargo_table").rows[raw].cells[12].innerHTML;
                                document.getElementById("release_locationid_label").innerHTML = document.getElementById("release_cargo_table").rows[raw].cells[13].innerHTML;

                                document.getElementById("release_update_submit").style.display = 'block';
                                document.getElementById("release_submit").style.display = 'none';




                                document.getElementById("release_cancel_submit").style.display = 'block';

                            }
                            function cancel_release_cargo() {
                                document.getElementById("release_update_submit").style.display = 'none';
                                document.getElementById("release_submit").style.display = 'block';
                                document.getElementById("release_cancel_submit").style.display = 'none';
                            }
                            function check_release_c() {
                                console.log("check_release_c() started");
                                var weinid = document.getElementById("release_wareid_label").innerHTML;
                                var xmlhttpr2 = new XMLHttpRequest();

                                xmlhttpr2.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {

                                        var checkk = this.responseText;
                                        if (checkk == "12") {
                                            alert("Already Released");
                                        } else {
                                            release_cargo();
                                            console.log("release_cargo() finished");
                                        }
                                        show_release_cargo_table();
                                    }
                                };
                                xmlhttpr2.open("GET", "chechk_release_cargo?weinid=" + weinid, true);
                                xmlhttpr2.send(null);
                                console.log("check_release_c() finished");
                            }
                            function update_release_cargo() {
                                var due = document.getElementById("release_duedate").value;
                                var warout = document.getElementById("release_wareout_label").innerHTML;
                                var cusname = document.getElementById("release_ccustomer").value;
                                var ware = document.getElementById("release_wareid_label").innerHTML;


                                var raw = document.getElementById("release_rawindex_label").innerHTML



                                var itmid = document.getElementById("release_itemid_label").innerHTML;

                                var quan = document.getElementById("release_cquantity").value;
                                var cost = document.getElementById("release_latedays").value * document.getElementById("release_cost_perday").value;
                                var totalcost = document.getElementById("release_total_cost").value;

                                var released = document.getElementById("release_current_date").value;
                                var lated = document.getElementById("release_latedays").value;
                                var latfeeperday = document.getElementById("release_cost_perday").value;
                                var locid = document.getElementById("release_locationid_label").innerHTML;


                                var xmlhttpr4 = new XMLHttpRequest();
                                xmlhttpr4.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        console.log("After Deleted release cargo : " + this.responseText);
                                        show_release_cargo_table();

                                    }
                                };
                                xmlhttpr4.open("GET", "edit_release_cargo?warout=" + warout + "&ware=" + ware + "&due=" + due + "&cusname=" + cusname + "&itmid=" + itmid + "&quan=" + quan + "&cost=" + cost + "&totalcost=" + totalcost + "&released=" + released + "&lated=" + lated + "&cost=" + cost + "&latfeeperday=" + latfeeperday + "&locid=" + locid, true);

                                xmlhttpr4.send();

                                show_release_cargo_table();
                                console.log("update_release_cargo() executed");
                            }
                            function search_release_c(key) {

                            <%--  https://www.w3schools.com/howto/howto_js_filter_table.asp    --%>
                                // Declare variables 
                                console.log("search_release_c(key) executed");
                                var input, filter, table, tr, td, td1, td2, i, d;

                                filter = key.toUpperCase();
                                table = document.getElementById("release_cargo_table");
                                tr = table.getElementsByTagName("tr");

                                // Loop through all table rows, and hide those who don't match the search query
                                for (i = 1; i < tr.length; i++) {


                                    td = tr[i].getElementsByTagName("td")[3];
                                    td1 = tr[i].getElementsByTagName("td")[5];
                                    td2 = tr[i].getElementsByTagName("td")[6];
                                    if (td) {
                                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                            tr[i].style.display = "";
                                            console.log("search found result");
                                        } else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                            tr[i].style.display = "";
                                        } else if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                            tr[i].style.display = "";
                                        } else {
                                            tr[i].style.display = "none";
                                            console.log("search NOT found result");
                                        }

                                    }
                                }

                            }
                        </script>
                        <%-- .............Released Table..................................................--%>

                        <div style="margin-top: 20px;margin-bottom: 20px;" id="release_cargo_table_div">

                        </div>

                    </div>  
                </section>   



                <script>

                    function home() {
                        location.reload(true);
                        document.getElementById("Whead").innerHTML = 'Warehouse Home';
                        document.getElementById("ware_home_div").style.display = 'block';
                        document.getElementById("insertcargo").style.display = 'none';

                        document.getElementById("releaseC_div").style.display = 'none';



                    }
                    function insertcargo() {


                        document.getElementById("Whead").innerHTML = 'Insert Cargo Details';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'block';

                        document.getElementById("releaseC_div").style.display = 'none';




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

                        document.getElementById("releaseC_div").style.display = 'none';


                    }
                    function releasecargo() {
                        document.getElementById("Whead").innerHTML = 'Release Cargo ';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';

                        document.getElementById("releaseC_div").style.display = 'block';


                        show_release_cargo_table();
                    }
                    function warehousingspace() {



                        document.getElementById("Whead").innerHTML = 'Warehouse Space';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';

                        document.getElementById("releaseC_div").style.display = 'none';

                    }
                    function history() {
                        document.getElementById("Whead").innerHTML = 'Warehouse History';
                        document.getElementById("ware_home_div").style.display = 'none';
                        document.getElementById("insertcargo").style.display = 'none';

                        document.getElementById("releaseC_div").style.display = 'none';


                    }

                </script>
            </div>
        </div>

    </body>
</html>
