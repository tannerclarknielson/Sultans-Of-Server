<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewFlavor.aspx.cs" Inherits="NewFlavor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>New Flavor</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>New Flavor Idea Form</h1>
    <br />
    <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label> 
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label> 
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label> 
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Flavor Name:"></asp:Label> 
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="New Flavor Idea:"></asp:Label> 
    <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
   
    <asp:Button ID="Button1" runat="server" Text="Submit Idea" OnClick="Button1_Click" />
    <br />
    <asp:label ID="Label6" runat="server" text=""></asp:label>



</asp:Content>

