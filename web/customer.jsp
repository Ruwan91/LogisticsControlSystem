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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>customer</title>

    </head>
    <body id="wareH" style="display: block;" >
        <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="header container" style="width: 100%;">

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1 id="nnnnnn">Customer</h1></div>

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
                </div>
            </header>

            <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Warehouse Home</h1></div>
                <section>
                    <div class="warehousing_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">

                        <div class="content tab-pane fade in active">
                            <h2>Recent Cargo Stacking</h2> 
                            <div style="margin-top: 20px;margin-bottom: 20px;">
                                <table class="table">
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
                                    <table class="table">
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

                <section>


                    <%--Insertion Form--%>


                    <div class="insert-cargo container" id="insertcargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Container ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
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
                                <label class="control-label col-sm-2">Rental Price per Unit : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Due Date : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="due_date">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2"> Date : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="due_date">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>

                        </form>
                    </div>

                    <%--Insertion Form END--%>




                </section>
                <section>
                    <div class="search container" id="searchC_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Container ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
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
                                <label class="control-label col-sm-2">Rental Price per Unit : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Due Date : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="due_date">
                                </div>
                            </div>

                            <div class="form-group">        
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox" style="float: left;">
                                        <label><input type="checkbox" name="remember"> Released Cargo</label>
                                    </div>
                                    <div class="checkbox" style="margin-left: 20%;">
                                        <label><input type="checkbox" name="remember"> Received Cargo</label>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Search</button>

                        </form>
                    </div>  
                </section>
                <section>
                    <div class="release container" id="releaseC_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Container ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
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
                                <label class="control-label col-sm-2">Rental Price per: Unit  </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Due Date : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="due_date">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Late Days : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="late_date">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Additional cost per: Late Day  </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cost_late_date">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Total Cost : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="Total_Cost">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>


                        </form>
                    </div>  
                </section>   
                <section>
                    <div class="space container" id="Wspace_div" style="box-shadow: 0 0 1px black;display: none;font-size: 20px;">

                        <div class="row" style="margin-top: 30px;margin-bottom: 30px;">
                            <div class="col-sm-2"> <label>Dangerous Cargo</label></div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="70"aria-valuemin="0" aria-valuemax="100" style="width:70%">
                                        <span class="sr-only">70% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <label>12356</label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 30px;margin-bottom: 30px;">
                            <div class="col-sm-2"> <label>Food Cargo</label></div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="70"aria-valuemin="0" aria-valuemax="100" style="width:90%">
                                        <span class="sr-only">70% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <label>12356</label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 30px;margin-bottom: 30px;">
                            <div class="col-sm-2"> <label>Refregirator Cargo</label></div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="70"aria-valuemin="0" aria-valuemax="100" style="width:20%">
                                        <span class="sr-only">70% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <label>12356</label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 30px;margin-bottom: 30px;">
                            <div class="col-sm-2"> <label>Normal Cargo</label></div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="70"aria-valuemin="0" aria-valuemax="100" style="width:50%">
                                        <span class="sr-only">70% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <label>12356</label>
                            </div>
                        </div>
                    </div>  
                </section> 
                <section>
                    <div class="history container" id="historyC_div" style="box-shadow: 0 0 1px black;display: none">
                        <div class="content tab-pane fade in active">
                            <h2> Cargo Stacking</h2> 
                            <div style="margin-top: 20px;margin-bottom: 20px;" >
                                <table class="table">
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
                                    <table class="table">
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
