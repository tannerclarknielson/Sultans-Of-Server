<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CafeMenu.aspx.cs" Inherits="CafeMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Cafe Menu</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1 class="underlined">Creamery Cafe </h1>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=stairway.usu.edu;Initial Catalog=5050_sultans_server;Persist Security Info=True;User ID=5050_sultans_server;Password=aggieicecream" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [prod_id], [prod_name], [prod_price], [prod_image] FROM [cafemenu]"></asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="prod_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" >
        <LayoutTemplate>
            <div class="row">
                <div runat="server" id="itemPlaceHolder"></div>
            </div>

           <%--<table>
               <tr id="groupPlaceHolder" runat="server"></tr>
               <tr>
                   <td> </td>
               </tr>
           </table>--%>
               
        </LayoutTemplate>
       <%-- <GroupTemplate>
                    <tr>
                        <td id="itemPlaceHolder" runat="server"></td>
                    </tr>
                </GroupTemplate>--%>
        <ItemTemplate>
            <div class="col-sm-4 col-xs-6">
                <div class="row">
                    <div class="col-sm-6">
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_image", "Images/{0}") %>' style="display:block;margin-left:auto;margin-right:auto;"/>
                    </div>
                    <div class="col-sm-6">
                        <h4 class="card-title" style="text-align:center;"><asp:Label ID="Label1"  runat="server" Text='<%# Eval("prod_name") %>'></asp:Label></h4>
                        <p style="text-align:center;"><asp:Label ID="Label2" runat="server" Text='<%# Eval("prod_price", "{0:c}") %>'></asp:Label></p>
                        <br />
                        <p style="text-align:center;">
                        <asp:Button ID="Button1" runat="server" Text="Add To Cart" CommandName="Select"/>
                        </p>
                    </div>
                </div>
            </div>

            <asp:HiddenField ID="hf_id" runat="server" Value='<%# Eval("prod_id") %>'/>
            <asp:HiddenField ID="hf_name" runat="server" Value='<%# Eval("prod_name") %>'/>
            <asp:HiddenField ID="hf_price" runat="server" Value='<%# Eval("prod_price") %>'/>
            
        </ItemTemplate>

    </asp:ListView>
        <div class="col-sm-3">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SingleOrder.aspx">View Cart</asp:HyperLink>
        </div>

       
    </div>
   


</asp:Content>

