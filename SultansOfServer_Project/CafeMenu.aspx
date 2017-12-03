﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CafeMenu.aspx.cs" Inherits="CafeMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Cafe Menu</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1 class="underlined">Creamery Cafe </h1>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=stairway.usu.edu;Initial Catalog=5050_sultans_server;Persist Security Info=True;User ID=5050_sultans_server;Password=aggieicecream" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [prod_id], [prod_name], [prod_price], [prod_image] FROM [cafemenu]"></asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" >
        <LayoutTemplate>
           <table>
               <tr id="groupPlaceHolder" runat="server"></tr>
               <tr>
                   <td> </td>
               </tr>
           </table>
               
        </LayoutTemplate>
        <GroupTemplate>
                    <tr>
                        <td id="itemPlaceHolder" runat="server"></td>
                    </tr>
                </GroupTemplate>
        <ItemTemplate>
            <div class="col-sm-3">
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_image", "Images/{0}") %>'/>
                        </td>
                        <td align="center">
                            <h4 class="card-title">
                            <asp:Label ID="Label1"  runat="server" Text='<%# Eval("prod_name") %>'></asp:Label> </h4>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("prod_price", "{0:c}") %>'></asp:Label>
                        <br />
                            <asp:Button ID="Button1" runat="server" Text="Add To Cart" OnClick="Button1_Click"/>
                            <br /> <br />
                        </td>
                    </tr>
                    <br />
                </table>
            </td>
                </div>
            
        </ItemTemplate>

    </asp:ListView>

       
    </div>
   


</asp:Content>

