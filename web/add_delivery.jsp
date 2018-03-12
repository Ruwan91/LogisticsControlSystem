<%-- 
    Document   : add_delivery
    Created on : Mar 12, 2018, 8:19:57 PM
    Author     : Ruwan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="width: 500px">
            <div><h2>New Delivery</h2></div>
            <form action="#">
                <div class="form-group" >
                    <label>Vehicle Number</label>
                    <input type="text" class="form-control" placeholder="Enter Vehicle Number." id="vnumber" required="true">
                </div>
                <div class="form-group" >
                    <label>Vehicle Type</label>
                    <select class="form-control" id="vtypeid" name="vtypeid">
                        <option selected>Select Vehicle Type</option>
                        <option value="1">20'Container</option>
                        <option value="2">40'Container</option>
                        <option value="3">20'Refrigerated Lorry</option>
                        <option value="4">14'Refrigerated mini Lorry</option>
                        <option value="5">30'Cargo Truck</option>
                    </select>
                </div>
                <div class="form-group" >
                    <label>Delivery Destination</label>
                    <select class="form-control" id="ddid" name="ddid">
                        <option selected>Select Vehicle Type</option>
                        <option value="1">Slave Island - Colombo 2</option>
                        <option value="2">Kollupitiya  - Colombo 3</option>
                        <option value="3">Bambalapitiya - Colombo 4</option>
                        <option value="4">Narahenpita, Havelock Town , Kirulapona North - Colombo 5</option>
                        <option value="5">Wellawatta, Pamankada, Kirulapona South  - Colombo 6</option>
                        <option value="6">Cinnamon Garden  - Colombo 7</option>
                        <option value="7">Borella  - Colombo 8</option>
                        <option value="8">Dematagoda - Colombo 9</option>
                        <option value="9">Maradana, Panchikawatte - Colombo 10</option>
                        <option value="10">Pettah  - Colombo 11</option>
                        <option value="11">Hulsfdorf  - Colombo 12</option>
                        <option value="12">Kotahena, Kochchikade - Colombo 13</option>
                        <option value="13">Grandpass - Colombo 14</option>
                        <option value="14">Mattakkuliya, Modara, Mutwal, Madampitiya - Colombo 15</option>
                        <option value="15">Mount Lavinia</option>
                        <option value="16">Rathmalana</option>
                        <option value="17">Angulana</option>
                        <option value="18">Moratuwa</option>
                        <option value="19">Egodauyana</option>
                        <option value="20">Panadura</option>
                        <option value="21">Wadduwa</option>
                        <option value="22">Waskaduwa</option>
                        <option value="23">Kaluthara</option>
                        <option value="24">Maggona</option>
                        <option value="25">Beruwala</option>
                        <option value="26">Aluthgama</option>
                        <option value="27">Benthota</option>
                        <option value="28">Balapitiya</option>
                        <option value="29">Ambalangoda</option>
                        <option value="30">Hikkaduwa</option>
                        <option value="31">Rathgama</option>
                        <option value="32">Galle</option>
                        <option value="33">Koggala</option>
                        <option value="34">Waligama</option>
                        <option value="35">Mirissa</option>
                        <option value="36">Dikwalla</option>
                        <option value="37">Thangalla</option>
                        <option value="38">Pitigala</option>
                        <option value="39">Nigambo</option>
                        <option value="40">Ja-Ela</option>
                        <option value="41">Waththala</option>
                        <option value="42">Gampaha</option>
                        <option value="43">Veyangoda</option>
                        <option value="44">Katunayake</option>
                        <option value="45">Ragama</option>
                        <option value="46">Seeduwa</option>
                        <option value="47">Kotugoda</option>
                        <option value="48">Kadatha</option>
                        <option value="49">Paliyagoda</option>
                        <option value="50">Homagama</option>
                        <option value="51">Mirigama</option>
                        <option value="52">Chilaw</option>
                        <option value="53">Rambukkana</option>
                        <option value="54">Kurunagala</option>
                        <option value="55">Nikawaratiya</option>
                        <option value="56">Kandy</option>
                        <option value="57">Ginigathhena</option>
                        <option value="58">Walapane</option>
                        <option value="59">Hatton</option>
                        <option value="60">Nuwara Eliya</option>
                        <option value="61">Badulla</option>
                        <option value="62">Pelmadulla</option>
                        <option value="63">Embilipitiya</option>
                        <option value="64">Ella</option>
                        <option value="65">Buththala</option>
                        <option value="66">Katharagama</option>
                        <option value="67">Monaragala</option>
                        <option value="68">Mahiyanganaya</option>
                        <option value="69">Sigiriya</option>
                        <option value="70">Habarana</option>
                        <option value="71">Polonnaruwa</option>
                        <option value="72">Ambanpola</option>
                        <option value="73">Dambulla</option>
                        <option value="74">Bibile</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Driver ID</label>
                    <input type="text" class="form-control" placeholder="Enter Driver ID" id="driverid" required="true">
                </div>

                <div class="form-group">
                    <label>Date</label>
                    <input type="date" class="form-control" id="date" required="true">
                </div>
                <div class="form-group" >
                    <label>Invoice NO</label>
                    <input type="text" class="form-control" placeholder="Enter Invoice Number." id="invoiceId" required="true">
                </div>
                <div class="form-group">
                    <label>Destination Address</label>
                    <input type="text" class="form-control" placeholder="Address here" id="destaddress" required="true">
                </div>
                <button type="submit" class="btn btn-primary">Save & Print Delivery Report </button>
            </form>
        </div>
    </body>
</html>
