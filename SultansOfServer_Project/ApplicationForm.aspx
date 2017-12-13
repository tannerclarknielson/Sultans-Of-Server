<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ApplicationForm.aspx.cs" Inherits="ApplicationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row"></div>
    <h1 class="underlined">Apply</h1> <br />
    
    <asp:Panel ID="Panel1" runat="server" MinimumValue="10">

    <h2><asp:Label ID="lblFN" runat="server" Text="First Name"></asp:Label></h2> 

    <asp:TextBox ID="txtFN" runat="server"></asp:TextBox> <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFN" ForeColor="Red" runat="server" ErrorMessage="*Enter First Name"></asp:RequiredFieldValidator>

    <h2><asp:Label ID="lblLN" runat="server" Text="Last Name"></asp:Label></h2>

    <asp:TextBox ID="txtLN" runat="server"></asp:TextBox> <br /> 

    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLN" ForeColor="Red" runat="server" ErrorMessage="*Enter Last Name"></asp:RequiredFieldValidator>


   <%-- <h2><asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label></h2>
        <asp:DropDownList ID="ddlGender" runat="server">

            <asp:ListItem Value="Male">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
            <asp:ListItem Value="NotDisclose">Prefer not to Disclose</asp:ListItem>
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlGender" ForeColor="Red" runat="server" ErrorMessage="*Select one"></asp:RequiredFieldValidator>--%>


    <h2><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></h2>
    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox> <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Email is required*" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>

    <h2><asp:Label ID="lblPhone" runat="server" Text="Phone Number (xxx)xxx-xxxx"></asp:Label></h2>

    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtPhoneNumber" runat="server" ForeColor="Red" ErrorMessage="*Enter Phone Number"></asp:RequiredFieldValidator>
<br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
ControlToValidate="txtPhoneNumber" ForeColor="Red" ErrorMessage="*Please enter a valid phone number"  
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
        <br /> 

    <h2><asp:Label ID="lblEmploymentHistory" runat="server" Text="Employment History"></asp:Label></h2>

    <asp:TextBox ID="txtEmploymentHistory" runat="server" TextMode="MultiLine" Height="200px" Width="500px"></asp:TextBox> <br />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtEmploymentHistory" ForeColor="Red" runat="server" ErrorMessage="*Tell us about yourself"></asp:RequiredFieldValidator>

    <h2><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></h2><br />

    </asp:Panel>

    <asp:Label ID="lblContactSubmit" runat="server"></asp:Label>
    
    <br />
    <br />

    <asp:LinkButton ID="btnBack" runat="server" href="PublicJobBoard.aspx">Back to Job Board</asp:LinkButton>
</asp:Content>

