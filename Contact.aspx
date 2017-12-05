<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="row"></div>
    <h1 class="underlined">Contact Us</h1> <br />
    
    <asp:Panel ID="Panel1" runat="server">

    <h2><asp:Label ID="lblContactFN" runat="server" Text="First Name"></asp:Label></h2> 

    <asp:TextBox ID="txtContactFN" runat="server"></asp:TextBox> <br />


    <h2><asp:Label ID="lblContactLN" runat="server" Text="Last Name"></asp:Label></h2>

    <asp:TextBox ID="txtContactLN" runat="server"></asp:TextBox> <br /> 

    <h2><asp:Label ID="lblContactEmail" runat="server" Text="Email"></asp:Label></h2>
    <asp:TextBox ID="txtContactEmail" runat="server" TextMode="Email"></asp:TextBox> <br />

    <h2><asp:Label ID="lblContactMessage" runat="server" Text="Message/Inquiry"></asp:Label></h2>

    <asp:TextBox ID="txtContactMessage" runat="server" TextMode="MultiLine" Height="200px" Width="500px"></asp:TextBox> <br />

    <h2><asp:Button ID="btnContactSubmit" runat="server" Text="Submit" OnClick="btnContactSubmit_Click" /></h2><br />

    </asp:Panel>

    <asp:Label ID="lblContactSubmit" runat="server"></asp:Label>
        
       
</asp:Content>

