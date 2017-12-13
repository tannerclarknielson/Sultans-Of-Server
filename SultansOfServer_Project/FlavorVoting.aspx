<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FlavorVoting.aspx.cs" Inherits="FlavorVoting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Flavor Voting</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="underlined">Vote for your favorite flavor!</h1>
    <asp:Panel ID="Panel1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT [Flavor] FROM [Flavors]"></asp:SqlDataSource>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Flavor" DataValueField="Flavor"></asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Flavor selection required" forecolor="red"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Vote" OnClick="Button1_Click1" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <div class="row">
            <div class="col-sm-2 col-xs-6">
                <p style="text-align:center;">Aggie Blue Mint</p>
                <p style="text-align:center;"><asp:Label ID="Label2" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="col-sm-2 col-xs-6">
                <p style="text-align:center;">Cookies & Cream</p>
                <p style="text-align:center;"><asp:Label ID="Label3" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="col-sm-2 col-xs-6">
                <p style="text-align:center;">True Aggie Night<p>
                <p style="text-align:center;"><asp:Label ID="Label4" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="col-sm-2 col-xs-6">
                <p style="text-align:center;">Cookie Dough</p>
                <p style="text-align:center;"><asp:Label ID="Label5" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="col-sm-2 col-xs-6">
                <p style="text-align:center;">Aggie Bull Tracks</p>
                <p style="text-align:center;"><asp:Label ID="Label6" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="col-sm-2 col-xs-6">
                <p style="text-align:center;">Chocolate Chip Mint</p>
                <p style="text-align:center;"><asp:Label ID="Label7" runat="server" Text="0"></asp:Label></p>
            </div>
        </div>
        <asp:Label ID="lblResults" runat="server" Text=""></asp:Label>
    </asp:Panel>
</asp:Content>

