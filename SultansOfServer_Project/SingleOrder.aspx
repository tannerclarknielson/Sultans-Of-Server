<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="SingleOrder.aspx.cs" Inherits="SingleOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <h1 class="underlined">Your Order</h1>
    <asp:ListView ID="ListView1" runat="server" OnItemDeleting="ListView1_ItemDeleting" DataKeyNames="ID">
        <LayoutTemplate>

            <table cellspacing="0">
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th >Total</th>
                    </tr>
                </thead>
                <tbody>
                     <tr runat="server" id="itemPlaceHolder"></tr>

                    <tr>
                        <td colspan="6"></td>
                    </tr>
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete">X</asp:LinkButton>
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image", "Images/{0}") %>'/>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price", "{0:c}") %>'></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtQty" runat="server" type="number" size="4" width="40px" OnTextChanged="txtQty_TextChanged" title="Qty" value="1" min="0" step="1" Text='<%# Bind("Quantity") %>' AutoPostBack="true"></asp:TextBox>
                    <asp:Button ID="btnQty" Visible="false" runat="server" Text="Update Quantity" CommandName="Update" />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ExtendedPrice", "{0:c}") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>

    </asp:ListView>

    <%--<table cellspacing="0">
        <tbody>

            <tr>
                <th>Order Total</th>
                <td><strong>
                    <asp:Label ID="Total" runat="server"></asp:Label></strong></td>
            </tr>
        </tbody>
    </table>--%>
        <br />
        <h5>Order Total</h5>
        <strong> <asp:Label ID="Total" runat="server"></asp:Label></strong> <br />  <br />
        <h4>Name</h4>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> <br />
        <h5>Phone Number</h5>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <br /> <br />
        <asp:Button ID="btnSubmitOrder" runat="server" Text="Submit Order" CommandName="Submit" />
   

</asp:Content>

