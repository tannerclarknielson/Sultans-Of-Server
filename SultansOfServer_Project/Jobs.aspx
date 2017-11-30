<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" DeleteCommand="DELETE FROM [Jobs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Jobs] ([jobID], [jobName], [jobDescription]) VALUES (@jobID, @jobName, @jobDescription)" SelectCommand="SELECT [Id], [jobID], [jobName], [jobDescription] FROM [Jobs]" UpdateCommand="UPDATE [Jobs] SET [jobID] = @jobID, [jobName] = @jobName, [jobDescription] = @jobDescription WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="jobID" Type="String" />
            <asp:Parameter Name="jobName" Type="String" />
            <asp:Parameter Name="jobDescription" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="jobID" Type="String" />
            <asp:Parameter Name="jobName" Type="String" />
            <asp:Parameter Name="jobDescription" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowEditButton="True"/>
             <asp:CommandField ShowSelectButton="True"/>
            <asp:BoundField DataField="jobID" HeaderText="jobID" SortExpression="jobID" />
            <asp:BoundField DataField="jobName" HeaderText="jobName" SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="jobDescription" SortExpression="jobDescription" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</asp:Content>

