using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;


public partial class Account_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUser_Click(object sender, EventArgs e)
    {

        //Instantiate a new UserManager object from the IdentityEF class that we imported.
        //This object is responsible for reading/writing data related to users of the application.
        var manager = new IdentityEF.UserManager();


        //Instantiate a new UserManager object from the IdentityEF class that we imported.
        //This object represents a user of our application.
        //We set the Username property of the ApplicationUser to the text entered in the UserName textbox.
        var user = new IdentityEF.ApplicationUser() { UserName = UserName.Text };


        //Call the Create method of the UserManager to create a new record for this user.  
        //Pass in the ApplicationUser object and the password that was entered.
        //This writes the user information to the Identity database and returns an IdentityResult object.
        IdentityResult result = manager.Create(user, Password.Text);

        //if the user information was recorded successfully, create a new OWIN cookie-based claims identity for the user and sign them in
        if (result.Succeeded)
        {
            //Create a new ClaimsIdentity for the user
            var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

            //Get a reference to the OWIN authentication middleware that will handle user authentication
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            //Use the authentication mamanger to sign in the user.
            //Pass in a new AuthenticationProperties object (allows for setting various properties of authentication.
            //Pass in the ClaimsIdentity object created above.
            authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

            //Redirect the user to the Profile page where they can add additional profile variables.
            Response.Redirect("~/Account/Profile.aspx");
        }
        else
        {
            //Report any errors that may have occurred.
            StatusMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}