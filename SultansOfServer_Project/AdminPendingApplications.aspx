<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPendingApplications.aspx.cs" Inherits="AdminPendingApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="underlined">Pending Applications</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" Font-Bold="False" ForeColor="#333333" CellSpacing="2">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="app_firstname" HeaderText="First" SortExpression="app_firstname" />
            <asp:BoundField DataField="app_lastname" HeaderText="Last" SortExpression="app_lastname" />
            <asp:BoundField DataField="app_email" HeaderText="Email" SortExpression="app_email" />
            <asp:BoundField DataField="app_phone" HeaderText="Phone" SortExpression="app_phone" />
<%--            <asp:CheckBoxField DataField="app_gender" HeaderText="Gender" SortExpression="app_gender" />--%>
            <asp:BoundField DataField="app_employmentHistory" HeaderText="Employment History" SortExpression="app_employmentHistory" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Delete Applicant?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" DeleteCommand="DELETE FROM [Applications] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Applications] ([app_firstname], [app_lastname], [app_email], [app_phone], [app_gender], [app_employmentHistory]) VALUES (@app_firstname, @app_lastname, @app_email, @app_phone, @app_gender, @app_employmentHistory)" SelectCommand="SELECT * FROM [Applications]" UpdateCommand="UPDATE [Applications] SET [app_firstname] = @app_firstname, [app_lastname] = @app_lastname, [app_email] = @app_email, [app_phone] = @app_phone, [app_gender] = @app_gender, [app_employmentHistory] = @app_employmentHistory WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="app_firstname" Type="String" />
            <asp:Parameter Name="app_lastname" Type="String" />
            <asp:Parameter Name="app_email" Type="String" />
            <asp:Parameter Name="app_phone" Type="String" />
            <%--<asp:Parameter Name="app_gender" Type="String" />--%>
            <asp:Parameter Name="app_employmentHistory" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="app_firstname" Type="String" />
            <asp:Parameter Name="app_lastname" Type="String" />
            <asp:Parameter Name="app_email" Type="String" />
            <asp:Parameter Name="app_phone" Type="String" />
<%--            <asp:Parameter Name="app_gender" Type="Boolean" />--%>
            <asp:Parameter Name="app_employmentHistory" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

