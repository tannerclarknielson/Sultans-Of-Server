<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminOrders.aspx.cs" Inherits="ContactResponses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT [OrderID], [Item], [Quantity], [Total], [CustomerName], [PhoneNumber] FROM [orders]" DeleteCommand="DELETE FROM [orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [orders] ([Item], [Quantity], [Total], [CustomerName], [PhoneNumber]) VALUES (@Item, @Quantity, @Total, @CustomerName, @PhoneNumber)" UpdateCommand="UPDATE [orders] SET [Item] = @Item, [Quantity] = @Quantity, [Total] = @Total, [CustomerName] = @CustomerName, [PhoneNumber] = @PhoneNumber WHERE [OrderID] = @OrderID">
    <DeleteParameters>
        <asp:Parameter Name="OrderID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Item" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="Total" Type="Decimal" />
        <asp:Parameter Name="CustomerName" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Item" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="Total" Type="Decimal" />
        <asp:Parameter Name="CustomerName" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
        <asp:Parameter Name="OrderID" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <h1 class="underlined">Responses</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="OrderID" CellSpacing="5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"/>
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total"/>
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"/>
        </Columns>



        <EditRowStyle BorderColor="#000066" />



        <HeaderStyle VerticalAlign="Middle" />



    </asp:GridView>




</asp:Content>

