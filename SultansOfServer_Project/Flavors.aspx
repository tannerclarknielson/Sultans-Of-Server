<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flavors.aspx.cs" Inherits="Flavors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Flavors</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Flavors</h1>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT [FlavorID], [Flavor], [Ingredients], [ImagePath], [OneScoop] FROM [Flavors]"></asp:SqlDataSource>
   
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="FlavorID" OnSelectedIndexChanged="ListView1_SelectedIndexChanged1">
    
        <LayoutTemplate>
            <div class="row">
                <div runat="server" id="itemPlaceHolder"></div>
            </div>
        </LayoutTemplate>
            
        <ItemTemplate>
            <div class="col-sm-4">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath", "/Flavors/{0}") %>' />
                <h2><%# Eval("Flavor") %> - <%# Eval("OneScoop" , "{0:c}") %></h2>
                <p>Ingredients: <%# Eval("Ingredients") %></p>
                <asp:Button ID="Button1" runat="server" Text="Add to Cart" CommandName="Select"/>
            </div>

            <asp:HiddenField ID="flavor_id" runat="server" Value='<%# Eval("FlavorID") %>'/>
            <asp:HiddenField ID="flavor_name" runat="server" Value='<%# Eval("Flavor") %>'/>
            <asp:HiddenField ID="scoop_price" runat="server" Value='<%# Eval("OneScoop") %>'/>
        </ItemTemplate>
        
</asp:ListView>
     
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SingleOrder.aspx">View Cart</asp:HyperLink>
       
</asp:Content>
