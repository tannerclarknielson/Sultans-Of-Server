<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flavors.aspx.cs" Inherits="Flavors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Flavors</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Flavors</h1>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT [FlavorID], [Flavor], [Ingredients], [ImagePath] FROM [Flavors]"></asp:SqlDataSource>
   
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyName="FlavorID">
    
        <LayoutTemplate>
            <div class="row">
                <div runat="server" id="itemPlaceHolder"></div>
            </div>
        </LayoutTemplate>
            
        <ItemTemplate>
            <div class="col-sm-4">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' />
                <%-- <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath", "SultansOfServer_Project/Images/Flavors/{0}") %>' />--%>
                 <h2><%# Eval("Flavor") %></h2>
                 <p>Ingredients: <%# Eval("Ingredients") %></p>
            </div>
        </ItemTemplate>
        
</asp:ListView>
</asp:Content>
