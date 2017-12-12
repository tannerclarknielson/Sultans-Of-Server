<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PublicJobBoard.aspx.cs" Inherits="PublicJobBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="col-6-md">

       <h3>Job Board</h3>
    
    <asp:GridView ID="gvPublicBoard" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" AllowPaging="True" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvJobs_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="jobName" HeaderText="Job Title" SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="Job Description" SortExpression="jobDescription" />
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

    </div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT * FROM [Jobs]">
</asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="dvPublicBoard" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" Height="50px" Width="233px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Job ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="jobName" HeaderText="Job Name" SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="Job Description" SortExpression="jobDescription" />
            <asp:HyperLinkField NavigateUrl="ApplicationForm.aspx" Text="Apply" />
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
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

