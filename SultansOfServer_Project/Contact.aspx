<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <h1>Contact Us</h1> <br />

    <asp:Label ID="lblContactFN" runat="server" Text="First Name"></asp:Label>
    <asp:TextBox ID="txtContactFN" runat="server"></asp:TextBox> <br />
    <asp:Label ID="lblContactLN" runat="server" Text="Last Name"></asp:Label>
    <asp:TextBox ID="txtContactLN" runat="server"></asp:TextBox> <br />
    <asp:Label ID="lblContactEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtContactEmail" runat="server" TextMode="Email"></asp:TextBox> <br />
    <asp:Label ID="lblContactMessage" runat="server" Text="Message/Inquiry"></asp:Label>
    <asp:TextBox ID="txtContactMessage" runat="server" TextMode="MultiLine" Height="200px" Width="500px" AutoPostBack="True"></asp:TextBox> <br />
    <asp:Button ID="btnContactSubmit" runat="server" OnClick="btnContactSubmit_Click" Text="Submit" /><br />

    <asp:Label ID="lblContactSubmit" runat="server"></asp:Label>

        </div>
</asp:Content>

