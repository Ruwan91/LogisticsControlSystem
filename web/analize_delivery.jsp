<%-- 
    Document   : analize_delivery
    Created on : Mar 14, 2018, 6:55:47 AM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" href="#">
    </head>
    <body>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            // Load google charts
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            // Drawing the chart
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Task', '# Delivery'],
                    ['20 feet Container',100],
                    ['40 feet Container', 40],
                    ['20 feet Refrigerated Lorry', 8],
                    ['14 feet Refrigerated mini Lorry', 10],
                    ['30 feet Cargo Truck', 150],
                    ['Other', 20]
                ]);

                //Setting chart title and size
                var options = {'title': 'Usage of Delivery Vehicle Type', 'width': 550, 'height': 600};

                // Display the chart inside the <div> element with id="pieChart"
                var chart = new google.visualization.PieChart(document.getElementById('pieChart'));
                chart.draw(data, options);
            }
        </script>

        <div id="pieChart" ></div>
    </body>
</html>
