<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentMaintananceStatusReport.aspx.cs" Inherits="AgingReport.EquipmentMaintananceStatusReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Button1" runat="server" Text="Button" />
              <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
             <rsweb:ReportViewer ID="MyReportViewer" runat="server" Width="1000" Height="1000" PageCountMode="Actual" ShowRefreshButton="False" ShowFindControls="False" ShowPrintButton="true" ShowParameterPrompts="false" ShowPromptAreaButton="false">
            </rsweb:ReportViewer> 
        </div>
    </form>
</body>
</html>
