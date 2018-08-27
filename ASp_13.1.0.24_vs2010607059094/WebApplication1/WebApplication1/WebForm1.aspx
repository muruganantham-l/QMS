<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=13.1400.0.21, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89"
    Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
    <%@ Register Assembly="Syncfusion.EJ, Version=13.1400.0.21, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89"
    Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="themes/flat-lime/ej.web.all.min.css" rel="stylesheet" type="text/css" />
     <script src="scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.easing.1.3.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.globalize.min.js" type="text/javascript"></script>
    <script src="scripts/jsrender.min.js" type="text/javascript"></script>
    <script src="scripts/ej.web.all.min.js" type="text/javascript"></script>
    <script src="scripts/ej.webform.min.js" type="text/javascript"></script>
   
</head>
<body>
    <form id="form1" runat="server">
  <div>
        <ej:Grid ID="FlatGrid" runat="server" AllowSorting="True" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="80" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
    </form>
</body>
</html>
