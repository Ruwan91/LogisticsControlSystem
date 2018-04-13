<%-- 
    Document   : payroll
    Created on : Mar 14, 2018, 4:57:23 PM
    Author     : CCA
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Payroll Management</title>

    </head>
    <body id="wareH" style="display: block;" >
        <div class="warehousingfullbody container" style="background-color: #ffffff;box-shadow: 0 0 3px black;width: 100%;padding-top: 5px;padding-left: 0px;">
            <header>
                <div class="header container" style="width: 100%;">

                    <div class="warehousinghead container" style="background-color: #e1e1ec;    box-shadow: 0 0 5px black; width: 100%;"><h1 id="nnnnnn">Payroll Management</h1></div>

                    <div class="mainbtn container" style="margin-top:5px;margin-left: 0%;">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" onclick="home()">Employee Details</a></li>
                            <li><a data-toggle="tab"  onclick="insertcargo()">Employee Registration</a></li>
                            <li><a data-toggle="tab" onclick="search1()">Search</a></li>
                            <li><a data-toggle="tab" onclick="releasecargo()">Allowance</a></li>
                            <li><a data-toggle="tab" onclick="warehousingspace()">Update Salary</a></li>
                            <li><a data-toggle="tab" onclick="history()">Payment</a></li>
                            <li><a data-toggle="tab" onclick="history()">Reports</a></li>

                        </ul>
                    </div>
                </div>
            </header>

            <div class="warehousecontent container" style="width: 100%;margin-left: 0%;margin-top: 5px;padding-left: 0px;padding-right: 0px;">
                <div class="container" style="margin-left: 30%;"><h1 id="Whead">Employee Details</h1></div>
                <section>
                    <div class="warehousing_home container tab-content" id="ware_home_div" style="box-shadow: 0 0 1px black;display: block;">
                        <div class="content tab-pane fade in active">

                            <div style="margin-top: 50px;margin-bottom: 500px;">
                                <div class="form-group" >
                                    <label class="control-label col-sm-2">Search Name : </label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="cname">
                                    </div><button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Search</button>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Employee ID</th>
                                                <th>First Name</th>
                                                <th>Surname</th>
                                                <th>Date of Birth</th>
                                                <th>Gender</th>
                                                <th>Contact</th>
                                                <th>Address</th>
                                                <th>Designation</th>
                                                <th>Date hired</th>
                                                <th>Basic Salary</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>23</td>
                                                <td>Vishwa</td>
                                                <td>Yapa</td>
                                                <td>1/6/1994</td>
                                                <td>Male</td>
                                                <td>0771678567</td>
                                                <td>Kaduwela Malabe</td>
                                                <td>Import Manager</td>
                                                <td>1/5/2018</td>
                                                <td>500000</td>
                                            </tr>
                                            <tr>
                                                <td>24</td>
                                                <td>rishitha</td>
                                                <td>Bandara</td>
                                                <td>1/6/1994</td>
                                                <td>Male</td>
                                                <td>066890768</td>
                                                <td>Battaramulla<td>
                                                <td>Cleark</td>
                                                <td>1/2/2018</td>
                                                <td>20000</td>
                                            </tr>
                                            <tr>
                                                <td>25</td>
                                                <td>Sanjeewani</td>
                                                <td>Hettiarachchi</td>
                                                <td>1/7/1993</td>
                                                <td>Female</td>
                                                <td>077167789</td>
                                                <td>Rajagiriya</td>
                                                <td>Assisatnt Manager</td>
                                                <td>5/2/2018</td>
                                                <td>30000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                </section>

                <section>


                    <%--Insertion Form--%>


                    <div class="insert-cargo container" id="insertcargo" style="display:none;margin-left: 0%;padding-left: 0px;margin-top: 10px;box-shadow: 0 0 1px black;">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Employee ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="eID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">First Name : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cname">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Surname : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Date of birth : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Gender : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cquantity">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Contact : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ccustomer">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Address : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cuID">
                                </div>
                            </div> 
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Designation : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2"> Date Hired : </label>
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
                                <label class="control-label col-sm-2">Employee ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                    <button type="submit" class="btn btn-default" style="margin-left: 110%;margin-bottom: 10px;">Search</button>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">First Name : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cname">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Surname : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Date of birth : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Gender  : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cquantity">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Contact : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ccustomer">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Address : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cuID">
                                </div>
                            </div> 
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Designation: </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
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
                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Update</button>

                        </form>
                    </div>  
                </section>
                <%--Allowance Form --%>
                <section>
                    <div class="release container" id="releaseC_div" style="box-shadow: 0 0 1px black;display: none">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Employee ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2"> Name : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cname">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Basic Salary : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Department : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Overtime: </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cquantity">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Bonus : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ccustomer">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Total overtime : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cuID">
                                </div>
                            </div> 
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Rate per hour:   </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="crental">
                                </div>
                            </div>  <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Calculate</button>

                            <div class="form-group" >
                                <label class="control-label col-sm-2">Total Allowance : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="due_date">
                                </div>
                            </div>



                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>


                        </form>
                    </div>  
                </section> 
                <%--Allowance Form End--%>



                <section>
                    <div class="space container" id="Wspace_div" style="box-shadow: 0 0 1px black;display: none;font-size: 15px;">
                        <form class="form-horizontal" action="#" style="margin-top: 5px;margin-left: 15%;">
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Employee ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="contID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2"> Name : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cname">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Designation : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cID">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Basic Salary : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Updating percentage : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-2">Updating Amount : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctype">
                                </div>
                            </div>






                            <div class="form-group" >
                                <label class="control-label col-sm-2">Updated amount </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ccustomer">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Total Salary : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cuID">
                                </div>
                            </div> 
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Updated Reason : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cuID">
                                </div>
                            </div> 



                            <button type="submit" class="btn btn-default" style="margin-left: 60%;margin-bottom: 30px;">Submit</button>


                        </form>


                    </div>   

                </section> 
                <section>
                    <div class="history container" id="historyC_div" style="box-shadow: 0 0 1px black;display: none">
                        <div class="content tab-pane fade in active">
                            <h2> Payroll</h2> 
                            <div class="form-group" >
                                <label class="control-label col-sm-2">Enter employee ID : </label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="cuID">
                                </div>
                            </div> 
                            <button type="submit" class="btn btn-default" style="margin-left: 0%;margin-bottom: 30px;">Search</button>
                            <div style="margin-top: 50px;margin-bottom: 800px;" >
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Employee ID</th>
                                            <th> Name</th>
                                            <th>Designation</th>
                                            <th>Basic Salary</th>
                                            <th>Allowances</th>
                                            <th>Updated amount</th>
                                            <th>EPF</th>
                                            <th>Final payment</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>23</td>
                                            <td>vishwa</td>
                                            <td>Import Manager</td>
                                            <td>50000</td>
                                            <td>30000</td>
                                            <td>1000</td>
                                            <td>789</td>
                                            <td>51456</td>
                                        </tr>
                                        <tr>
                                            <td>24</td>
                                            <td>rishitha</td>
                                            <td>cleark</td>
                                            <td>20000</td>
                                            <td>2000</td>
                                            <td>null</td>
                                            <td>539</td>
                                            <td>22435</td>
                                        </tr>
                                        <tr>
                                            <td>25</td>
                                            <td>Sangeewani</td>
                                            <td>Assistant Manager</td>
                                            <td>30000</td>
                                            <td>2500</td>
                                            <td>1000</td>
                                            <td>450</td>
                                            <td>32167</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            </section>   
                            <section>








                            </section> 

                            <script>
                                function home() {
                                    document.getElementById("Whead").innerHTML = 'Employee Details';
                                    document.getElementById("ware_home_div").style.display = 'block';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }
                                function insertcargo() {
                                    document.getElementById("Whead").innerHTML = 'Add Employee Details';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'block';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }
                                function search1() {
                                    document.getElementById("Whead").innerHTML = 'Search Employee Details';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'block';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }
                                function releasecargo() {
                                    document.getElementById("Whead").innerHTML = 'Allowance ';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'block';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'none';

                                }
                                function warehousingspace() {
                                    document.getElementById("Whead").innerHTML = 'Update Salary';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'block';
                                    document.getElementById("historyC_div").style.display = 'none';
                                }
                                function history() {
                                    document.getElementById("Whead").innerHTML = 'Payment';
                                    document.getElementById("ware_home_div").style.display = 'none';
                                    document.getElementById("insertcargo").style.display = 'none';
                                    document.getElementById("searchC_div").style.display = 'none';
                                    document.getElementById("releaseC_div").style.display = 'none';
                                    document.getElementById("Wspace_div").style.display = 'none';
                                    document.getElementById("historyC_div").style.display = 'block';

                                }
                                function acd() {
                                    document.getElementById("Whead").innerHTML = 'Payment';
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
