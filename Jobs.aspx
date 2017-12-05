<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-6-md">


    
    <asp:GridView ID="gvJobs" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" AllowPaging="True" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowSelectButton="True"/>
            <asp:BoundField DataField="jobName" HeaderText="jobName" SortExpression="jobName" />
            <asp:BoundField DataField="jobDescription" HeaderText="jobDescription" SortExpression="jobDescription" />
            <asp:CommandField ShowEditButton="True"/>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Delete Job?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" DeleteCommand="DELETE FROM [Jobs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Jobs] ([jobName], [jobDescription], [datePosted]) VALUES (@jobName, @jobDescription, @datePosted)" SelectCommand="SELECT [jobName], [jobDescription], [Id], [datePosted] FROM [Jobs]" UpdateCommand="UPDATE [Jobs] SET [jobName] = @jobName, [jobDescription] = @jobDescription, [datePosted] = @datePosted WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="jobName" Type="String" />
        <asp:Parameter Name="jobDescription" Type="String" />
        <asp:Parameter Name="datePosted" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="jobName" Type="String" />
        <asp:Parameter Name="jobDescription" Type="String" />
        <asp:Parameter Name="datePosted" Type="DateTime" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add new Job</asp:LinkButton>
    <br />
</asp:Content>

