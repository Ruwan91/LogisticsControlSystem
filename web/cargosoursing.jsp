<%-- 
    Document   : Cargo Sourcing
    Created on : Mar 14, 2018, 7:47:18 PM
    Author     : Kisal Nelaka
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Cargo Sourcing</title>

    </head>
    <body id="cs" style="display: block;" >
        <div class="csfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="header container" style="width: 100%;">

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1 id="nnnnnn">Cargo-Sourcing</h1></div>

                    <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="home()">Home</a></li>
                            <li><a data-toggle="tab"  onclick="insertcargo()">Insert Source</a></li>
                            <li><a data-toggle="tab" onclick="search1()">Search for a Source</a></li>
                            <li><a data-toggle="tab" onclick="releasecargo()">Review Sources</a></li>
                            <li><a data-toggle="tab" onclick="history()">History</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <div class="cscontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Cargo Sourcing Home</h1></div>
                <section>
                    <div class="cs_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">
                        <div class="content tab-pane fade in active">
                            <h2>Recent Top Searches</h2> 
                            <div style="margin-top: 20px;margin-bottom: 20px;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Supplier ID</th>
                                            <th>Supplier Name</th>
                                            <th>Cargo Type</th>
                                            <th>Quantity</th>
                                            <th>Budget</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>02</td>
                                            <td>Gunma Motorsports</td>
                                            <td>Vehicle Spares</td>
                                            <td>22</td>
                                            <td>10,000$</td>
                                        </tr>
                                        <tr>
                                            <td>03</td>
                                            <td>Redsuns</td>
                                            <td>Tyres</td>
                                            <td>50</td>
                                            <td>5000$</td>
                                        </tr>
                                        <tr>
                                            <td>07</td>
                                            <td>Wayne Ent.</td>
                                            <td>Computers</td>
                                            <td>100</td>
                                            <td>250,000$</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            </section>

                            <section>


                                <%--Insertion Form--%>


                                <div class="insert-cargo container" id="insertcargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                                    <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Supplier ID : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="contID">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Supplier Name : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="cname">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Cargo Type : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="ctype">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Price Range : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="cquantity">
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
                                            <label class="control-label col-sm-2">Supplier ID : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="contID">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Supplier Name : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="cname">
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
                                            <label class="control-label col-sm-2">Budget : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="ccustomer">
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
                                            <label class="control-label col-sm-2">Supplier ID : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="contID">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Supplier Name : </label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="cname">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="control-label col-sm-2">Comment : </label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="cID">
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
                                        <h2> Recent Searches</h2> 
                                        <div style="margin-top: 20px;margin-bottom: 20px;" >
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Supplier ID</th>
                                                        <th>Supplier Name</th>
                                                        <th>Cargo Type</th>
                                                        <th>Quantity</th>
                                                        <th>Budget</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>02</td>
                                                        <td>Gunma Motorsports</td>
                                                        <td>Vehicle Spares</td>
                                                        <td>22</td>
                                                        <td>10,000$</td>
                                                    </tr>
                                                    <tr>
                                                        <td>03</td>
                                                        <td>Redsuns</td>
                                                        <td>Tyres</td>
                                                        <td>50</td>
                                                        <td>5000$</td>
                                                    </tr>
                                                    <tr>
                                                        <td>07</td>
                                                        <td>Wayne Ent.</td>
                                                        <td>Computers</td>
                                                        <td>100</td>
                                                        <td>250,000$</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="caontainer">
                                            <h2> Reviews</h2>
                                            <div style="margin-top: 20px;margin-bottom: 20px;">
                                                <p> <b>Alistair said</b> Redsuns tyres are great. got em for a great price too</p> 
                                                <p> <b>Mako said</b> Wayne Ent. is great. Will do business again.</p> 
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </section> 

                            <script>
                                function home() {
                                    document.getElementById("Whead").innerHTML = 'Cargo Sourcing Home';
                                    document.getElementById("ware_home_div").style.display = 'block';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }
                                function insertcargo() {
                                    document.getElementById("Whead").innerHTML = 'Insert Supplier Details';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'block';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'none';
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
                                function search1() {
                                    document.getElementById("Whead").innerHTML = 'Search for Suppliers';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'block';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }
                                function releasecargo() {
                                    document.getElementById("Whead").innerHTML = 'Review Suppliers ';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'block';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }

                                function history() {
                                    document.getElementById("Whead").innerHTML = 'Sourcing History';
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
