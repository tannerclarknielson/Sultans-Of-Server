<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewFlavor.aspx.cs" Inherits="NewFlavor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>New Flavor</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="underlined">New Flavor Idea Form</h1>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Label">We want your input on new flavor ideas! Submit an idea and it could become a new flavor!</asp:Label>

    <asp:Panel ID="Panel1" runat="server">
    <h2><asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label></h2>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <h2><asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label></h2> 
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <h2><asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label></h2> 
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <h2><asp:Label ID="Label4" runat="server" Text="Flavor Name:"></asp:Label></h2> 
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <br />
    <h2><asp:Label ID="Label5" runat="server" Text="New Flavor Idea:"></asp:Label></h2> 
    <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
   
    <asp:Button ID="Button1" runat="server" Text="Submit Idea" OnClick="Button1_Click" />
    <br />
    </asp:Panel>
    <asp:label ID="Label6" runat="server" text=""></asp:label>



</asp:Content>

