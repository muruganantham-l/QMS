<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DownloadWorkOrder.aspx.cs" Inherits="DownloadWorkOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    

      <table>
        <tr>
            <td></td>
            <td></td>
            <td > 
                 
                 <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Calibri" Font-Size="Large" Text="Download Work Order" Width="265px" style="text-align: center"></asp:Label>               
            </td>
            <td>
                <br />
            </td>

        </tr>
        <tr>
            <td>
                <label ></label>
            </td>
        </tr>
        <tr>
             
            <td>
              
                <asp:Label Text="Work Order Year" Width=200 runat="server"></asp:Label>
            </td>
            <td>
               <ej:DateTimePicker ID="DateTime"  ShowPopupButton="true"  TimePopupWidth="150" TimeDisplayFormat="yyyy" Width="280px" DateTimeFormat="yyyy" runat="server"></ej:DateTimePicker>
            </td>
            <td>
                <asp:Label runat="server" Width=100 ></asp:Label>
            </td>
            <td>

        
                 
                <%--<asp:Button ID="search_btn" runat="server" OnClick="search_btn_Click" Text="Search"  />--%>
             
                       <ej:Button ID="Button1" runat="server" Type="Button"   Text="Search"  ></ej:Button>
            </td>
        </tr>
    </table>
    
</asp:Content>

