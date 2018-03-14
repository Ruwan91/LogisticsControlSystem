<%-- 
    Document   : home
    Created on : Mar 12, 2018, 5:02:38 PM
    Author     : ishan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
          <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> 
    <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> 


 

  



 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body >
        <div class="home container" id="home" style="display: block;background-color: white;">
            

<div id="chartContainer" style="width: 100%; height: 300px ; display: block;"></div> 
        </div>
        
        <script type="text/javascript"> 
  

 
	$("#chartContainer").CanvasJSChart({ 
		title: { 
			text: "Imported Cargo   - This Week",
			fontSize: 24,
                        
		}, 
		axisY: { 
			title: "Products in %" 
		}, 
		legend :{ 
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
				{ label: "Normal Cargo",  y: 30.3, legendText: "Normal Cargo"}, 
				{ label: "Danger Cargo",    y: 19.1, legendText: "Danger Cargo"  }, 
				{ label: "Food Cargo",   y: 4.0,  legendText: "Food Cargo" }, 
				{ label: "Refregirator Cargo",       y: 3.8,  legendText: "Refregirator Cargo"}, 
				
			] 
		} 
		] 
	}); 

</script> 
    </body>
</html>
