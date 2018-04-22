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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> 
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
        <title>warehousing</title>
        <script>

        <title>warehousing</title>

    </head>
    <body id="wareH" style="display: block;" >
        <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="header container" style="width: 100%;">

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1 id="nnnnnn">Warehousing</h1></div>

                    <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="home()">Home</a></li>
                            <li><a data-toggle="tab"  onclick="insertcargo()">Insert Cargo</a></li>
                            <li><a data-toggle="tab" onclick="search1()">Search</a></li>
                            <li><a data-toggle="tab" onclick="releasecargo()">Release Cargo</a></li>
                            <li><a data-toggle="tab" onclick="warehousingspace()">Warehousing space</a></li>
                            <li><a data-toggle="tab" onclick="history()">History</a></li>
                        </ul>
                    </div>


                                <label class="control-label col-sm-3">Cargo ID : </label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="sel1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                </div>
            </header>

            <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Warehouse Home</h1></div>
                <section>
                    <div class="warehousing_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">
                        <div id="chartContainer" style="width: 100%; height: 300px ; display: block;margin-top: 50px;margin-bottom:  50px;"></div> 
                        <script type="text/javascript">


                    </div>  
                </section>

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
                                            {label: "Danger Cargo", y: 19.1, legendText: "Danger Cargo"},
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
                                <table class="table">
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
    <body id="wareH" style="display: block;" >
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
                                <h2>Recent Payments</h2>
                                <div style="margin-top: 20px;margin-bottom: 20px;">
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
                    function reload() {
                        var container = document.getElementById("releaseC_div");
                        var content = container.innerHTML;
                        container.innerHTML = content;

                        //this line is to watch the result in console , you can remove it later	
                        console.log("Refreshed");
                    }
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
