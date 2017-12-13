<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-6-md">

         <h1 class="underlined">Active Job Posts</h1> <br />
    
    <asp:GridView ID="gvJobs" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" AllowPaging="True" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="jobName" HeaderText="Job Title" SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="Job Description" SortExpression="jobDescription" />
            <asp:CommandField ShowEditButton="True"/>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Delete Job?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#99CCFF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    </div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" DeleteCommand="DELETE FROM [Jobs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Jobs] ([jobName], [jobDescription], [datePosted]) VALUES (@jobName, @jobDescription, @datePosted)" SelectCommand="SELECT * FROM [Jobs]" UpdateCommand="UPDATE [Jobs] SET [jobName] = @jobName, [jobDescription] = @jobDescription, [datePosted] = @datePosted WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="jobName" Type="String" />
        <asp:Parameter Name="jobDescription" Type="String" />
        <asp:Parameter Name="datePosted" Type="Object" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="jobName" Type="String" />
        <asp:Parameter Name="jobDescription" Type="String" />
        <asp:Parameter Name="datePosted" Type="Object" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add new Job</asp:LinkButton>
    <br />
</asp:Content>

