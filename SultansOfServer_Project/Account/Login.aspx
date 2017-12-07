<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h2><%: Title %></h2>

    <section id="loginForm">
        <div class="form-horizontal">

            <hr />
            <asp:PlaceHolder runat="server" ID="StatusBox" Visible="false">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="StatusText" />
                </p>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">

                <h4>Enter your user name and password.  <a href="Register.aspx">Register</a> if you don't have an account.</h4>
                <br />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                            CssClass="text-danger" ErrorMessage="The user name field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <div class="checkbox">
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="SignIn" Text="Log in" CssClass="btn btn-default" />
                    </div>
                </div>

            </asp:PlaceHolder>
        </div>

        <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
            <div>
                <div>
                    <asp:Button runat="server" OnClick="SignOut" Text="Log out" />
                </div>
            </div>
        </asp:PlaceHolder>
    </section>

</asp:Content>

