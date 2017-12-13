using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public partial class ApplicationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnBack.Visible = true;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string insertSQL = "INSERT INTO Applications (app_firstname, app_lastname, app_email, app_phone/* app_gender*/, app_employmentHistory)";
        insertSQL += "VALUES (@app_firstname, @app_lastname, @app_email, @app_phone, /*@app_gender*/ @app_employmentHistory)";

        SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd = new SqlCommand(insertSQL, con);

        SqlParameter param = new SqlParameter();
        //cmd.Parameters.AddWithValue("@con_date", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@app_firstname", txtFN.Text);
        cmd.Parameters.AddWithValue("@app_lastname", txtLN.Text);
        cmd.Parameters.AddWithValue("@app_email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@app_employmentHistory", txtEmploymentHistory.Text);
        cmd.Parameters.AddWithValue("@app_phone", txtPhoneNumber.Text);
        //cmd.Parameters.AddWithValue("@app_gender", ddlGender.SelectedIndex);
        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
            lblContactSubmit.Text = "Thank you for applying, <strong>" + txtFN.Text + "</strong>. We will review your application and will get back to you via email.  The email we have on record is <strong> " + txtEmail.Text + "</strong>. If you have any questions give us a call!" /*DateTime.Today.AddDays(14).ToShortDateString()*/;
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