<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SingleOrder.aspx.cs" Inherits="SingleOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            <thead>
                <tr>

                </tr>
            </thead>
        </LayoutTemplate>

        <ItemTemplate>
           <tr>
               <td>
                   <asp:Label ID="lblprod_name" runat="server" Text='<%# Eval("prod_name") %>'></asp:Label>
               </td>
               <td>
                   <asp:Label ID="lblprod_price" runat="server" Text='<%# Eval("prod_price") %>'></asp:Label>
               </td>
           </tr>


        </ItemTemplate>
    </asp:ListView>
   

</asp:Content>

