<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactResponses.aspx.cs" Inherits="ContactResponses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [contact]" DeleteCommand="DELETE FROM [contact] WHERE [con_id] = @con_id" InsertCommand="INSERT INTO [contact] ([con_date], [con_firstname], [con_lastname], [con_email], [con_message]) VALUES (@con_date, @con_firstname, @con_lastname, @con_email, @con_message)" UpdateCommand="UPDATE [contact] SET [con_date] = @con_date, [con_firstname] = @con_firstname, [con_lastname] = @con_lastname, [con_email] = @con_email, [con_message] = @con_message WHERE [con_id] = @con_id">
        <DeleteParameters>
            <asp:Parameter Name="con_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="con_date" />
            <asp:Parameter Name="con_firstname" Type="String" />
            <asp:Parameter Name="con_lastname" Type="String" />
            <asp:Parameter Name="con_email" Type="String" />
            <asp:Parameter Name="con_message" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="con_date" />
            <asp:Parameter Name="con_firstname" Type="String" />
            <asp:Parameter Name="con_lastname" Type="String" />
            <asp:Parameter Name="con_email" Type="String" />
            <asp:Parameter Name="con_message" Type="String" />
            <asp:Parameter Name="con_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h1 class="underlined">Responses</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="con_id" CellSpacing="5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="con_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="con_id" Visible="false" DataFormatString="{0:d}" />
            <asp:BoundField DataField="con_date" HeaderText="Submitted" SortExpression="con_date" />
            <asp:BoundField DataField="con_firstname" HeaderText="First Name"/>
            <asp:BoundField DataField="con_lastname" HeaderText="Last Name"/>
            <asp:BoundField DataField="con_email" HeaderText="Email" SortExpression="con_email" />
            <asp:BoundField DataField="con_message" HeaderText="Message 1"/>
        </Columns>



        <EditRowStyle BorderColor="#000066" />



        <HeaderStyle VerticalAlign="Middle" />



    </asp:GridView>




</asp:Content>

