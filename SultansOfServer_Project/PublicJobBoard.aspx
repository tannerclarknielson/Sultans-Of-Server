<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PublicJobBoard.aspx.cs" Inherits="PublicJobBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-6-md">

       <h3>Job Board</h3>
    
    <asp:GridView ID="gvPublicBoard" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" AllowPaging="True" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvJobs_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="jobName" HeaderText="Job " SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="Details" SortExpression="jobDescription" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#FFFF99" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    </div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [Jobs]">
</asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="dvPublicBoard" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" Height="50px" Width="233px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Job #" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="jobName" HeaderText="Title" SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="Details" SortExpression="jobDescription" />
            <asp:HyperLinkField NavigateUrl="ApplicationForm.aspx" Text="Apply" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [Jobs] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvPublicBoard" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:LinkButton ID="btnback" runat="server" href="PublicJobBoard.aspx">Back to Job Board</asp:LinkButton>
    <br />
    <br />
    <br />
</asp:Content>

