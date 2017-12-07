<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageRoles.aspx.cs" Inherits="Admin_ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="StatusMessage" />
    </p>

    <div class="form-horizontal">

        <h3>Add New Role</h3>

        <asp:TextBox ID="txtAddRole" runat="server"></asp:TextBox>
        <asp:Button ID="btnAddRole" runat="server" Text="Add Role" OnClick="btnAddRole_Click" />
                       
        <h3>View/Update Roles</h3>

        <asp:GridView ID="gvwRoles" runat="server" DataKeyNames ="Id" AutoGenerateColumns="False" OnRowDeleting="gvwRoles_RowDeleting" OnRowEditing="gvwRoles_RowEditing" OnRowCancelingEdit="gvwRoles_RowCancelingEdit" OnRowUpdating="gvwRoles_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="RoleName" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField CommandName="Delete" Text="Delete" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Change Name"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <h3>View/Update User Roles</h3>

        <h4>Users</h4>
        <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="True"></asp:DropDownList>

        <h4>User Roles</h4>
        <asp:CheckBoxList ID="cblUserRoles" runat="server"></asp:CheckBoxList>
        <asp:Button ID="btnUpdateRoles" runat="server" Text="Update Roles" OnClick="btnUpdateRoles_Click" />
       
    </div>

</asp:Content>

