<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidateBEAssetInformation.aspx.cs" Inherits="AgingReport.ValidateBEAssetInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <hgroup class="title" >
                <h2 style="border-left: medium none #008080; border-right: medium none #008080; border-top: medium none #008080; border-bottom: medium solid #008080; font-family: Verdana, Geneva, Tahoma, sans-serif; font-weight: bold; font-size: large; font-style: oblique; font-variant: normal; text-transform: capitalize; color: #008080; text-decoration: blink; height: 70px; width: 100%;" class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quantum Medical Solutions
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" ForeColor="Black" style="text-align: right"  />
            &nbsp;
            <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/IndexPage.aspx" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" style="font-weight: 700; text-align: right;">Index Page</asp:LinkButton>
              &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Logout.aspx" Font-Bold="True" Font-Names="Calibri" Font-Size="Medium" style="font-weight: 700; text-align: right;">Logout</asp:LinkButton>
             </h2>
         </hgroup>
        <div title="Validate BE Asset Information"  style="height: 255px" >

            <table>
                <tr>
                    <td>
                        <asp:Label ID="l1" runat="server" Text="Validated"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="validate_flagDropDownList" runat="server" AutoPostBack="true" BackColor="White" DataTextField="flag_id" DataValueField="flag_txt" Width="200" Height="25" ></asp:DropDownList>
                    </td>
               
                    <td>
                        <asp:Label ID="Label2" runat="server" Width="100" ></asp:Label>
                    </td>
                
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Updated"></asp:Label>
                    </td>
                    <td>
                         <asp:DropDownList ID="updated_flagDropDownList" runat="server" AutoPostBack="true" BackColor="White" DataTextField="flag_id" DataValueField="flag_txt" Width="200" Height="25" ></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Width="100" ></asp:Label>
                    </td>
                    <td>
                     <asp:Button ID="search_btn" runat="server" Text="Search" OnClick="search_btn_Click" />
                        </td>
                </tr>
            </table>
             
            
            
           
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="be_number"
OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
<Columns>
    <asp:TemplateField HeaderText="BE Number" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblName" runat="server" Text='<%# Eval("be_number") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="be_number_txt" runat="server" Text='<%# Eval("be_number") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Manufacture" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Manufacture") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Manufacture_txt" runat="server" Text='<%# Eval("Manufacture") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Model" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="Model" runat="server" Text='<%# Eval("Model") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Model_txt" runat="server" Text='<%# Eval("Model") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Serial Number" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="SerialNumber" runat="server" Text='<%# Eval("SerialNumber") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="SerialNumber" runat="server" Text='<%# Eval("SerialNumber") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

     <asp:TemplateField HeaderText="BE Location" ItemStyle-Width="150">
        <ItemTemplate>
            <asp:Label ID="BELocation" runat="server" Text='<%# Eval("BELocation") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="BELocation" runat="server" Text='<%# Eval("BELocation") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>


    
    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150"/>
</Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
