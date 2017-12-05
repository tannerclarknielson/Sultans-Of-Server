<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewJobForm.aspx.cs" Inherits="NewJobForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h1 class="underlined">Add new Job:</h1> 
    
    <br />
    
    <asp:Panel ID="Panel1" runat="server">

    <h2><asp:Label ID="lblJobName" runat="server" Text="Job Name"></asp:Label></h2> 

    <asp:TextBox ID="txtjobName" runat="server"></asp:TextBox> 
        
        <br />

    <h2><asp:Label ID="lbljobDescription" runat="server" Text="Job Description"></asp:Label></h2>

    <asp:TextBox ID="txtjobDescription" runat="server" TextMode="MultiLine" Height="200px" Width="500px"></asp:TextBox> 
        
        <br />

    <h2><asp:Button ID="btnContactSubmit" runat="server" Text="Submit" OnClick="btnContactSubmit_Click" /></h2>
        
        <br />

    </asp:Panel>

    <asp:Label ID="lblContactSubmit" runat="server"></asp:Label>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" href="NewJobForm.aspx">Add another job</asp:HyperLink></asp:LinkButton>

</asp:Content>

