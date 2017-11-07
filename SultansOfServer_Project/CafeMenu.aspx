<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CafeMenu.aspx.cs" Inherits="CafeMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            <table>
                <tr id="groupPlaceHolder" runat="server"></tr>  
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr>
            <td id ="itemPlaceHolder" runat="server"></td>
                </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <br />
                            <asp:Button ID="Button1" runat="server" Text="Order Now" />
                        </td>
                    </tr>
                </table>
            </td>
        </ItemTemplate>

    </asp:ListView>


</asp:Content>

