<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CafeMenu.aspx.cs" Inherits="CafeMenu" %>

<%@ Register Src="~/UserControl.ascx" TagPrefix="uc1" TagName="UserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Cafe Menu</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-sm-10 col-xs-6">
            <h1 class="underlined">Creamery Cafe</h1>
        </div>
        <div class="col-sm-2 col-xs-6">
            <uc1:UserControl runat="server" ID="UserControl" />
        </div>
    </div>
    
    <div class="row">
        
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:5050_sultans_serverConnectionString %>" SelectCommand="SELECT [prod_id], [prod_name], [prod_price], [prod_image] FROM [cafemenu] WHERE ([isicecream] = @isicecream)">
                 <SelectParameters>
                     <asp:Parameter DefaultValue="0" Name="isicecream" Type="Int32" />
                 </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="prod_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" >
        <LayoutTemplate>
            <div class="row">
                <div runat="server" id="itemPlaceHolder"></div>
            </div> 
        </LayoutTemplate>
       
        <ItemTemplate>
            <div class="col-sm-4 col-xs-6">
                <div class="row">
                    <div class="col-sm-6">
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("prod_image", "Images/{0}") %>' style="display:block;margin-left:auto;margin-right:auto;"/>
                    </div>
                    <div class="col-sm-6">
                        <h4 class="card-title" style="text-align:center;"><asp:Label ID="Label1"  runat="server" Text='<%# Eval("prod_name") %>'></asp:Label></h4>
                        <p style="text-align:center;"><asp:Label ID="Label2" runat="server" Text='<%# Eval("prod_price", "{0:c}") %>'></asp:Label></p>
                        <br />
                        <p style="text-align:center;">
                        <asp:Button ID="Button1" runat="server" Text="Add To Cart" CommandName="Select"/>
                        </p>
                    </div>
                </div>
            </div>

            <asp:HiddenField ID="hf_id" runat="server" Value='<%# Eval("prod_id") %>'/>
            <asp:HiddenField ID="hf_name" runat="server" Value='<%# Eval("prod_name") %>'/>
            <asp:HiddenField ID="hf_price" runat="server" Value='<%# Eval("prod_price") %>'/>
            
        </ItemTemplate>
    </asp:ListView>
    </div>
</asp:Content>

