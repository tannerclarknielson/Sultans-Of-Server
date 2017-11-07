using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnContactSubmit_Click(object sender, EventArgs e)
    {
        txtContactFN.Visible = false;
        txtContactLN.Visible = false;
        txtContactEmail.Visible = false;
        lblContactFN.Visible = false;
        lblContactLN.Visible = false;
        lblContactEmail.Visible = false;
        lblContactMessage.Visible = false;
        lblContactSubmit.Text = "Thank you for contacting us " + txtContactFN.Text + ". If necessary, we will get back to you within 2-3 days.";


    }
}