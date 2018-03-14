<%-- 
    Document   : map
    Created on : Mar 11, 2018, 9:46:10 AM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC_XsnwEZYZZbnhxJ_juCgl0hmpt04KD50&callback=initMap"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script language="javascript" type="text/javascript">
        <%--uses google api --%>

        var map;
        var geocoder;
        function InitializeMap() {
            var l = document.getElementById("l").value;
            var lt = document.getElementById("lt").value;
            var latlng = new google.maps.LatLng(l, lt);
            var myOptions =
                    {
                        zoom: 3,
                        center: latlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP,
                        disableDefaultUI: true
                    };
            map = new google.maps.Map(document.getElementById("map"), myOptions);

            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
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
    <%double a = 35.4506;%>
    <%double b = 139.6657;%>
    <input id="l" type="hidden" value="35.4506">
    <input id="lt" type="hidden" value="139.6657">
    <form class="form-control">
        <div class="form-group" style="width: 600px">
             <lable>Shipment Id</lable>
             <input id="shipmentid" type="text" class="form-control" style="width: 200px">
        </div>
        <div class="form-group">
            <button class="btn btn-primary" type="submit" onclick="return Button1_onclick()">Find Current Location</button>
        </div>
        <table class="table">
            <tr>
                <td colspan ="2">
                    <div id ="map" style="height: 600px; width: 700px" >
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
