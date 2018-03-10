<%-- 
    Document   : index
    Created on : Feb 18, 2018, 7:05:19 PM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TO DO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  


<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>


    </head>


    <body >
        <div class="body container" ng-app="myApp">
            <header>
                <div class="head container" style="background-color: greenyellow;">
                    <h1>Cargo Management System</h1>
                </div> 
            
            </header>
            
            <div class="content container" style="background-color: blueviolet;padding-right: 0px !important;padding-left: 0px !important;">
            
                <div class="sidebar container"  style="background-color: brown;width: 25%;margin-left: 0px;float: left;">
                    <h3>side bar</h3>
                    <ul><li><a href="#/!" >Menu1</a></li>
                        
                        <li><a href="#!warehousing" >Warehousing</a></li>
                    </ul>
                </div>
                <div class="container" style="background-color: cyan;width: 75%;padding-right: 0px;margin-left: 25%;padding-left: 0px;">
                    <h1>content</h1>
   
                 <%-- AngularJS  codes  --%>
                 
                 <div ng-view class="container" style="background-color: black;width: 100%;padding-right: 0px;">
                     
                 </div>
                    
                   </div>         
                             <script>
                                var app   = angular.module("myApp", ["ngRoute"]);
                                  app.config(function($routeProvider) {
                                  $routeProvider.

                               
                                   when("/warehousing",{
                                      templateUrl : "warehousing.jsp"
                                   });

                                 });
                             </script>
                 <%-- AngularJS  END  --%>
 
                </div>
     
            	
            <footer>
                <div class="footer container" style="background-color: yellow;"><h1>Footer</h1></div>
            </footer>
        </div>

    </body>
</html>

