<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FlavorVoting.aspx.cs" Inherits="FlavorVoting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Flavor Voting</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="underlined">Vote for your favorite flavor!</h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT [Flavor] FROM [Flavors]"></asp:SqlDataSource>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Flavor" DataValueField="Flavor"></asp:RadioButtonList>
    <asp:Button ID="Button1" runat="server" Text="Vote" OnClick="Button1_Click1" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>

