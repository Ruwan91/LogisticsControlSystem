<%-- 
    Document   : map
    Created on : Mar 11, 2018, 9:46:10 AM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        html { height: 100% }
        body { height: 100%; margin: 0; padding: 0 }
        #map-canvas { height: 100%; width:100%;}
    </style>

    hi here is the sample code

<html>
    <head>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC_XsnwEZYZZbnhxJ_juCgl0hmpt04KD50&callback=initMap"></script>
        <script language="javascript" type="text/javascript">
            <%--uses google api --%>

            var map;
            var geocoder;
            function InitializeMap() {
                var l= document.getElementById("l").value;
                var lt= document.getElementById("lt").value;
                var latlng = new google.maps.LatLng(l,lt);
                var myOptions =
                        {
                            zoom: 4,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            disableDefaultUI: true
                        };
                map = new google.maps.Map(document.getElementById("map"), myOptions);
                
                var marker = new google.maps.Marker({
          position: latlng,
          map: map,
          title: 'Hello World!'
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
    </head>
    <body>
        <%-- Setting up map location --%>
        <%double a=6.124593;%>
        <%double b=81.101074;%>
        <input id="l" value="<%=a%>">
        <input id="lt" value="<%=b%>">
        <h2>Gecoding Demo JavaScript: </h2>
        <table>
            <tr>
                <td>
                    <input id="addressinput" type="text" style="width: 1000px" />   
                </td>
                <td>
                    <input id="Button1" type="button" value="Find" onclick="return Button1_onclick()" /></td>
            </tr>
            <tr>
                <td colspan ="2">
                    <div id ="map" style="height: 800px" >
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
