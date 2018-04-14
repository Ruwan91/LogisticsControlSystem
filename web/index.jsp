<%-- 
    Document   : index
    Created on : Feb 18, 2018, 7:05:19 PM
    Author     : ISHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Logistic Management System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> 


        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>



        <style>

            @media (min-width: 1200px){.container {
                                           width: 100% !important;
                                           padding-right: 1px !important;padding-left: 1px !important;
                                           margin-left: 0px;margin-right: 0px;
                                       }}



            .navbar-text a:hover{background-color: white;color: black;}
            .navbar-text a:active{background-color: red;}
            .itemblock{overflow-wrap: break-word;padding: 0px;border-radius:10px;margin-top:5px;background-color: blue;box-shadow: 0 0 6px 0px black;}
            .navbar-nav li{border-left:1px solid white;} 
            .navbar-inverse .navbar-nav>li>a:hover {
                background-color: #7c7c7c8f;
            }
            #hmbdy{

                background-repeat: repeat;
            }

        </style>
    </head>
    <link rel="icon" href="istock-cargo-ship.jpg">

    <body id="hmbdy"  background="istock-cargo-ship.jpg" style="width: 100%;">
        <div class=" container" ng-app="myApp" >
            <header>
                <div class="head container" style="background-color:#12b2ef; ">
                    <a href="#/!" id="menue" style="text-decoration: none;color:black; " onclick=" location.reload();"><h1 style="font-family: baskerville Old Face;font-size: 50px;color: white;">Logistic Management System</h1></a>
                    <div class="container" style="margin-left: 80%;margin-bottom: 20px;">
                        <span class="text"><a href="signup.jsp" style="text-decoration: none; "  >Singn Up</a></span>
                        <span class="text"><a href="" style="text-decoration: none; ">Login</a></span>
                    </div>
                </div> 

            </header>

            <div class="body container" style="padding-right: 0px !important;padding-left: 0px !important;">

                <!-- Navigation Bar -->



                <div class="navbar navbar-inverse" style="background-color: #222222b8;   box-shadow: 0 0 2px 1px black;">
                    <div class="navbar-header" >
                        <span class="navbar-brand"><a href="#/!" id="homelink" style="text-decoration: none;color: white;" onclick=" location.reload();" >Home</a></span>
                    </div>

                    <button class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>


                    <div class="container">
                        <ul class="nav navbar-nav navbar-collapse collapse" id="menu" style="">
                            <li> <a href="#!customer" id="customer" >Customer</a></li>
                            <li>  <a href="#!order" id="order" >Order</a></li>
                            <li>  <a href="#!cargosoursing" id="cargosourcing" >Cargo Sourcing</a></li>
                            <li> <a href="#!payment" id="payment" >Finance</a></li>
                            <li>   <a href="#!delivery" id="delivery" onclick=" location.reload();">Delivery</a></li>
                            <li> <a href="#!tracking" id="tracking" >Tracking</a></li>
                            <li>  <a href="#!payroll" id="payroll" >Payroll</a></li>
                            <li> <a href="#!warehousing" id="warehousing" onclick=" location.reload();" >Warehousing</a></li>
                        </ul>
                    </div>

                </div>
                <div class="pages_content container" style="padding-right: 0px;padding-left: 0px;margin-top: 5px;">



                    <%-- AngularJS  codes  --%>

                    <div ng-view class="container" id="view" style="background-color: black;width: 100%;padding-right: 0px; padding-left: 0px;display: block;"></div>

                    <script>
                        var app = angular.module("myApp", ["ngRoute"]);
                        app.config(function ($routeProvider) {
                            $routeProvider.
                                    when("/warehousing", {
                                        templateUrl: "warehousing.jsp"
                                    }).
                                    when("/", {
                                        templateUrl: "home.jsp"
                                    }).
                                    when("/tracking", {
                                        templateUrl: "tracking22.jsp"
                                    }).
                                    when("/delivery", {
                                        templateUrl: "delivery.jsp"
                                    }).
                                    when("/payroll", {
                                        templateUrl: "payroll.jsp"
                                    }).
                                    when("/customer", {
                                        templateUrl: "customer.jsp"

                                    }).when("/order", {
                                templateUrl: "order.jsp"

                            }).when("/payment", {
                                templateUrl: "payment.jsp"

                            }).when("/cargosoursing", {
                                templateUrl: "cargosoursing.jsp"
                            });


                        });
                    </script>
                    <%-- AngularJS  END  --%>


                </div>         
                <script>

                </script>

            </div>


            <footer>
                <div class="footer container" style="margin-top: 5px;    box-shadow: 0 0 2px black;">
                    <div class="container col-sm-4">
                        <h5>Contact us</h5>
                    </div>
                    <div class="container col-sm-4">
                        <h5>Any suggestions</h5>
                    </div>
                    <div class="container col-sm-4">
                        <h5>Company</h5>
                    </div>

                </div>
            </footer>
        </div>

    </body>
</html>

