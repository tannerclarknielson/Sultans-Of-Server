using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewJobForm : System.Web.UI.Page
{

   
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton1.Visible = false;
        LinkButton2.Visible = false;
    }

    protected void btnContactSubmit_Click(object sender, EventArgs e)
    {


        string insertSQL = "INSERT INTO Jobs (jobName,jobDescription)";
        insertSQL += "VALUES (@jobName, @jobDescription)";

        SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd = new SqlCommand(insertSQL, con);

        SqlParameter param = new SqlParameter();
        cmd.Parameters.AddWithValue("@jobName", txtjobName.Text);
        cmd.Parameters.AddWithValue("@jobDescription", txtjobDescription.Text);
        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
            LinkButton1.Visible = true;
            LinkButton2.Visible = true;
            lblContactSubmit.Text = "Job added successfully!";
            
        }
        catch (Exception err)
        {
            lblContactSubmit.Text = "Error inserting Job. ";
            lblContactSubmit.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        Panel1.Visible = false;
        
       
       
        
    }

}