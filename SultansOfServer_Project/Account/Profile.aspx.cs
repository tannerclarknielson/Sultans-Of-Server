using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;


public partial class Account_Profile : System.Web.UI.Page
{
    //Declare a UserManager and ApplicationUser variable that will be used on this page.
    IdentityEF.UserManager manager;
    IdentityEF.ApplicationUser user;


    protected void Page_Load(object sender, EventArgs e)
    {
        //Set the UserManager variable declared above to a new instance of the IdentityEF.UserManager class
        manager = new IdentityEF.UserManager();

        //Call the FindByName method of the UserManager to set the ApplicationUser variable to the user that is currently logged in
        user = manager.FindByName(User.Identity.Name);
    }

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {

        //If the user is not null, update the user's profile variables to the variables entered in the textboxes.
        //The BirthDate will need to be converted to a DateTime (be sure to check for nulls).
        //Be sure to also set the Email address, which is already included in the user's profile.
        //Report any error messages in the StatusMessage control on the page.
        if(user != null)
        {
            user.Firstname = txtFirstName.Text;
            user.Lastname = txtLastName.Text;
            if (txtBirthDate.Text != "")
                user.BirthDate = Convert.ToDateTime(txtBirthDate.Text);
            else
                user.BirthDate = null;
            user.Email = txtEmail.Text;
            user.Street = txtStreet.Text;
            user.City = txtCity.Text;
            user.State = txtState.Text;
            user.Zip = txtZip.Text;
            user.Country = txtCountry.Text;

            IdentityResult result = manager.Update(user);

            if (result.Succeeded)
            {
                StatusMessage.Text = "Profiile updated.";
            }
            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
        }
        else
        {
            StatusMessage.Text = "Account not found.";
        }
       

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {

        //If the user is not null, set the values of the TextBoxes to the user's profile variables
        //This is done in Page_PreRender so as to happen after any updates that take place in the btnUpdateProfile_Click event handler method
        if (user != null)
        {
            txtFirstName.Text = user.Firstname;
            txtLastName.Text = user.Lastname;
            if(user.BirthDate != null)
            txtBirthDate.Text = user.BirthDate.Value.ToString("MM/dd/yyyy");
            txtEmail.Text = user.Email;
            txtStreet.Text = user.Street;
            txtCity.Text = user.City;
            txtState.Text = user.State;
            txtZip.Text = user.Zip;
            txtCountry.Text = user.Country;

        }
        else
        {
            StatusMessage.Text = "Account not found.";
        }
    }
       
}

