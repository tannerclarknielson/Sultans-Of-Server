using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public partial class Contact : System.Web.UI.Page
{
    //string connectionString = WebConfigurationManager.ConnectionStrings["stairwaytoheave\stairway.5050_sultans_server.dbo"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }


  

    protected void btnContactSubmit_Click(object sender, EventArgs e)
    {
    

        string insertSQL = "INSERT INTO contact (con_firstname, con_lastname, con_email, con_message)";
        insertSQL += "VALUES (@con_firstname, @con_lastname, @con_email, @con_message)";

        SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd = new SqlCommand(insertSQL, con);

        SqlParameter param = new SqlParameter();
        cmd.Parameters.AddWithValue("@con_firstname", txtContactFN.Text);
        cmd.Parameters.AddWithValue("@con_lastname", txtContactLN.Text);
        cmd.Parameters.AddWithValue("@con_email", txtContactEmail.Text);
        cmd.Parameters.AddWithValue("@con_message", txtContactMessage.Text);

        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
            lblContactSubmit.Text = "Thank you for contacting us " + txtContactFN.Text + "! If necessary, we will get back to you by " + DateTime.Today.AddDays(3);
        }
        catch (Exception err)
        {
            lblContactSubmit.Text = "Error inserting record. ";
            lblContactSubmit.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        Panel1.Visible = false;
    }
}