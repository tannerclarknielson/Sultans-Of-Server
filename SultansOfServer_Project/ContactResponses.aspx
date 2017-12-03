<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactResponses.aspx.cs" Inherits="ContactResponses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [contact]"></asp:SqlDataSource>
    <h1 class="underlined">Responses</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="con_id">
        <Columns>
            <asp:BoundField DataField="con_id" HeaderText="con_id" InsertVisible="False" ReadOnly="True" SortExpression="con_id" Visible="false" DataFormatString="{0:d}" />
            <asp:BoundField DataField="con_date" HeaderText="Submitted" SortExpression="con_date" />
            <asp:BoundField DataField="con_firstname" HeaderText="First Name"/>
            <asp:BoundField DataField="con_lastname" HeaderText="Last Name"/>
            <asp:BoundField DataField="con_email" HeaderText="Email" SortExpression="con_email" />
            <asp:BoundField DataField="con_message" HeaderText="Message"/>
        </Columns>



    </asp:GridView>




</asp:Content>

