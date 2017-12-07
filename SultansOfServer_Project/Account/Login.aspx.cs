using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //If user is already logged in, show a message with their username and a logout button
            if (User.Identity.IsAuthenticated)
            {
                StatusText.Text = string.Format("Hello {0}!!", User.Identity.GetUserName());
                StatusBox.Visible = true;
                LogoutButton.Visible = true;
            }

            //If the user is not logged in, show the login form.
            else
            {
                LoginForm.Visible = true;
            }
        }
    }

    //Method to authenticate a user
    protected void SignIn(object sender, EventArgs e)
    {

        //Instantiate a new UserManager object from the IdentityEF class that we imported.
        //This object is responsible for reading/writing data related to users of the application.
        var userManager = new IdentityEF.UserManager();


        //Call the Find method of the UserManager to attempt to locate the user credentials in the database
        //If the credentials are not found, the user variable will be null
        var user = userManager.Find(UserName.Text, Password.Text);

        //Create a boolean variable that denotes whether the user authentication should persist (the cookie does not expire)
        bool rememberme = RememberMe.Checked;

        //If the user variable is not null (meaning credentials are valid), sign the user in.
        if (user != null)
        {
            //Get a reference to the OWIN authentication middleware that will handle user authentication
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            //Create a new ClaimsIdentity for the user
            var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

            //Use the authentication mamanger to sign in the user.
            //Pass in a new AuthenticationProperties object (allows for setting various properties of authentication.
            //Pass in the ClaimsIdentity object created above.
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = rememberme }, userIdentity);


            //Redirect the user to the Profile page where they can add/modify additional profile variables.
            Response.Redirect("~/Account/Profile.aspx");
        }
        else
        {
            StatusText.Text = "Invalid username or password.";
            StatusBox.Visible = true;
        }
    }

    //Method to sign out a user
    protected void SignOut(object sender, EventArgs e)
    {
        //Get a reference to the OWIN authentication middleware that will handle user authentication
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

        //Call the SignOut method to revoke the ClaimsIdentity
        authenticationManager.SignOut();

        //Refresh the login page to show the Login form
        Response.Redirect("~/Account/Login.aspx");
    }

   
}