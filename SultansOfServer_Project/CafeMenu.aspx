<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CafeMenu.aspx.cs" Inherits="CafeMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=stairway.usu.edu;Initial Catalog=5050_sultans_server;Persist Security Info=True;User ID=5050_sultans_server;Password=aggieicecream" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [prod_id], [prod_name], [prod_price], [prod_image] FROM [cafemenu]"></asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
           <table>
               <tr id="itemPlaceHolder" runat="server"></tr>
               <tr>
                   <td colspan="3"> </td>
               </tr>
           </table>
               
        </LayoutTemplate>
       
        <ItemTemplate>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl="'<%# Eval("prod_image", "Images/t{0} %>"/>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <br />
                            <asp:Button ID="Button1" runat="server" Text="Order Now" />
                        </td>
                    </tr>
                </table>
            </td>
        </ItemTemplate>

    </asp:ListView>


</asp:Content>

