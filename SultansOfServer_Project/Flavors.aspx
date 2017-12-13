<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Flavors.aspx.cs" Inherits="Flavors" %>

<%@ Register Src="~/UserControl.ascx" TagPrefix="uc1" TagName="UserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Flavors</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-sm-10 col-xs-6">
            <h1 class="underlined">Flavors</h1>
        </div>
        <div class="col-sm-2 col-xs-6">
            <uc1:UserControl runat="server" ID="UserControl" />
        </div>
    </div>
    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [cafemenu] WHERE ([isicecream] = @isicecream)">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="isicecream" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
   
<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="prod_id" OnSelectedIndexChanged="ListView1_SelectedIndexChanged1">
    
        <LayoutTemplate>
            <div class="row">
                <div runat="server" id="itemPlaceHolder"></div>
            </div>
        </LayoutTemplate>
            
        <ItemTemplate>
            <div class="col-sm-4">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_image", "/Flavors/{0}") %>' />
                <h2><%# Eval("prod_name") %> - <%# Eval("prod_price" , "{0:c}") %></h2>
                <p>Ingredients: <%# Eval("ingredients") %></p>
                <asp:Button ID="Button1" runat="server" Text="Add to Cart" CommandName="Select"/>
            </div>

            <asp:HiddenField ID="flavor_id" runat="server" Value='<%# Eval("prod_id") %>'/>
            <asp:HiddenField ID="flavor_name" runat="server" Value='<%# Eval("prod_name") %>'/>
            <asp:HiddenField ID="scoop_price" runat="server" Value='<%# Eval("prod_price") %>'/>
        </ItemTemplate>
        
</asp:ListView>
     
    
 
<br />
</asp:Content>
