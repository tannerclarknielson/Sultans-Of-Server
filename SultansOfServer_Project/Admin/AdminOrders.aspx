<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminOrders.aspx.cs" Inherits="ContactResponses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [orders]" DeleteCommand="DELETE FROM [orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [orders] ([OrderDate], [Total], [Customer], [PhoneNumber]) VALUES (@OrderDate, @Total, @Customer, @PhoneNumber)" UpdateCommand="UPDATE [orders] SET [OrderDate] = @OrderDate, [Total] = @Total, [Customer] = @Customer, [PhoneNumber] = @PhoneNumber WHERE [OrderID] = @OrderID">
    <DeleteParameters>
        <asp:Parameter Name="OrderID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderDate" DbType="Date" />
        <asp:Parameter Name="Total" Type="Decimal" />
        <asp:Parameter Name="Customer" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="OrderDate" DbType="Date" />
        <asp:Parameter Name="Total" Type="Decimal" />
        <asp:Parameter Name="Customer" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
        <asp:Parameter Name="OrderID" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <h1 class="underlined">Responses</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="OrderID" CellSpacing="5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="Order #" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="Item" HeaderText="Item"  />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity"/>
            <asp:BoundField DataField="Total" HeaderText="Total" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"/>
        </Columns>



        <EditRowStyle BorderColor="#000066" />



        <HeaderStyle VerticalAlign="Middle" />



    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" DeleteCommand="DELETE FROM [orderdetails] WHERE [OrderID] = @OrderID AND [prod_id] = @prod_id" InsertCommand="INSERT INTO [orderdetails] ([prod_id], [Quantity], [Price]) VALUES (@prod_id, @Quantity, @Price)" SelectCommand="SELECT * FROM [orderdetails]" UpdateCommand="UPDATE [orderdetails] SET [Quantity] = @Quantity, [Price] = @Price WHERE [OrderID] = @OrderID AND [prod_id] = @prod_id">
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="prod_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="prod_id" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="prod_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderID,prod_id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="Order #" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="prod_id" HeaderText="prod_id" ReadOnly="True"/>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
        </Columns>
    </asp:GridView>




</asp:Content>

