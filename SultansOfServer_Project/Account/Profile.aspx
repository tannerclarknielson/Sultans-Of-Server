<%@ Page Title="Profile" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Account_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2>Welcome, <asp:loginname runat="server"></asp:loginname>.</h2>
    
    <p class="text-danger">
        <asp:Literal runat="server" ID="StatusMessage" />
    </p>

   <div class="form-horizontal">
        <h4>View/update your profile:</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-2 control-label">First Name*</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                <asp:RequiredFieldValidator id="reqFirstName" runat="server" ControlToValidate="txtFirstName"
                    CssClass="text-danger" ErrorMessage="The first name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-2 control-label">Last Name*</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                <asp:RequiredFieldValidator id="reqLastName" runat="server" ControlToValidate="txtLastName"
                    CssClass="text-danger" ErrorMessage="The last name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email*</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                <asp:RequiredFieldValidator id="reqEmail" runat="server" ControlToValidate="txtEmail"
                    CssClass="text-danger" ErrorMessage="The email field is required." />

            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail2" CssClass="col-md-2 control-label">Confirm Email*</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail2" CssClass="form-control" />
                <asp:RequiredFieldValidator id="reqEmail2" runat="server" ControlToValidate="txtEmail2"
                    CssClass="text-danger" ErrorMessage="The email confirmation is required." />
                <asp:CompareValidator id="compEmail2" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtEmail2"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The email addresses entered do not match." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBirthDate" CssClass="col-md-2 control-label">Birth Date</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtBirthDate" CssClass="form-control" />
                <asp:CompareValidator id="compBirthDate" runat="server" ControlToValidate="txtBirthDate" Operator="DataTypeCheck" Type="Date" 
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter a valid date." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStreet" CssClass="col-md-2 control-label">Street Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtStreet" CssClass="form-control" />
             </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCity" CssClass="col-md-2 control-label">City</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCity" CssClass="form-control" />
             </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtState" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtState" CssClass="form-control" />
             </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtZip" CssClass="col-md-2 control-label">Zip Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtZip" CssClass="form-control" />
             </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCountry" CssClass="col-md-2 control-label">Country</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCountry" CssClass="form-control" />
             </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Update Profile" CssClass="btn btn-default" id="btnUpdateProfile" OnClick="btnUpdateProfile_Click" />
            </div>
        </div>
    </div>
    
    
    
    
   
</asp:Content>

