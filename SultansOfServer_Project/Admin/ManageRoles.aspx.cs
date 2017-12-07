using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using IdentityEF;

public partial class Admin_ManageRoles : System.Web.UI.Page
{
    //create a RoleManager variable
    IdentityEF.RoleManager rolemanager;

    //create a UserManager variable
    IdentityEF.UserManager usermanager;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //instantiate usermanager and rolemanager
        rolemanager = new IdentityEF.RoleManager();
        usermanager = new IdentityEF.UserManager();

       
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //populate roles GridView
        gvwRoles.DataSource = rolemanager.Roles.ToList();
        gvwRoles.DataBind();

        //populate list of users in dropdownlist
        ddlUsers.DataSource = usermanager.Users.ToList();
        ddlUsers.DataTextField = "UserName";
        ddlUsers.DataValueField = "Id";
        if(!IsPostBack)
         ddlUsers.DataBind();

        //populate checkboxlist with roles
        cblUserRoles.DataSource = rolemanager.Roles.ToList();
        cblUserRoles.DataTextField = "Name";
        cblUserRoles.DataValueField = "Name";
        cblUserRoles.DataBind();

        //check the roles that the selected user is in
        string userID = ddlUsers.SelectedValue;

        //loop through roles checkboxlist
        foreach (ListItem li in cblUserRoles.Items)
        {
            if (usermanager.IsInRole(userID, li.Value))
            {
                li.Selected = true;
            }
        }


        //usermanager.IsInRole();
    }



        protected void btnAddRole_Click(object sender, EventArgs e)
    {
        if (!rolemanager.RoleExists(txtAddRole.Text))
        {
            IdentityRole newRole = new IdentityRole(txtAddRole.Text);
            IdentityResult result = rolemanager.Create(newRole);

            //if the role was created, notify user
            if (result.Succeeded)
            {
                StatusMessage.Text = "Role created";
                txtAddRole.Text = "";
            }

            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
        }
          
    }

    protected void gvwRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string roleId = gvwRoles.DataKeys[e.RowIndex].Value.ToString();
        IdentityRole roleToDelete = rolemanager.FindById(roleId);

        if (roleToDelete != null)
        {
            IdentityResult result = rolemanager.Delete(roleToDelete);
            StatusMessage.Text = result.Succeeded ? "Role deleted" : result.Errors.FirstOrDefault();
        }
        
    }

    protected void gvwRoles_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //set EditIndex of GridView to row that was clicked
        gvwRoles.EditIndex = e.NewEditIndex;
     
    }

    protected void gvwRoles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //set editindex of gridview back to -1
        gvwRoles.EditIndex = -1;
    }

    protected void gvwRoles_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //get role id
        string roleId = gvwRoles.DataKeys[e.RowIndex].Value.ToString();

        //get new role name from textbox
        TextBox txtRoleName = (TextBox)gvwRoles.Rows[e.RowIndex].FindControl("TextBox1");

        string newRoleName = txtRoleName.Text;

        IdentityRole roleToUpdate = rolemanager.FindById(roleId);

        //update the role if it was found
        if (roleToUpdate != null)
        {
            roleToUpdate.Name = newRoleName;
            IdentityResult result = rolemanager.Update(roleToUpdate);
            StatusMessage.Text = result.Succeeded ? "Role updated." : result.Errors.FirstOrDefault();
        }

        //reset the edit index back to -1
        gvwRoles.EditIndex = -1;
    }

    protected void btnUpdateRoles_Click(object sender, EventArgs e)
    {
        //get userid
        string userID = ddlUsers.SelectedValue;

        //loop through the roles list and add/remove user from roles as necessary
        foreach(ListItem li in cblUserRoles.Items)
        {
            if (usermanager.IsInRole(userID, li.Value) && li.Selected == false)
            {
                //remover user from role
                IdentityResult resultRemove = usermanager.RemoveFromRole(userID, li.Value);
                StatusMessage.Text = resultRemove.Succeeded ? "Role removed" : resultRemove.Errors.FirstOrDefault();
            }
            else if (!usermanager.IsInRole(userID, li.Value) && li.Selected == true)
            {
                //remover user from role
                IdentityResult resultAdd = usermanager.AddToRole(userID, li.Value);
                StatusMessage.Text = resultAdd.Succeeded ? "Role added" : resultAdd.Errors.FirstOrDefault();
            }

        }
    }
}