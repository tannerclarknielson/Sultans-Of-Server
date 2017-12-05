using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class NewFlavor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string insertSQL = "INSERT INTO NewFlavor (FirstName, LastName, Email, NewFlavor, FlavorName)";
        insertSQL += "VALUES (@firstname, @lastname, @email, @newflavor, @flavorname)";

        SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd = new SqlCommand(insertSQL, con);

        SqlParameter param = new SqlParameter();
        cmd.Parameters.AddWithValue("@firstname", TextBox1.Text);
        cmd.Parameters.AddWithValue("@lastname", TextBox2.Text);
        cmd.Parameters.AddWithValue("@email", TextBox3.Text);
        cmd.Parameters.AddWithValue("@newflavor", TextBox4.Text);
        cmd.Parameters.AddWithValue("@flavorname", TextBox5.Text);

        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
            Label6.Text = "Thank you for submitting your new flavor idea!";
        }
        catch (Exception err)
        {
            Label6.Text = "An error occurred, please fill out all fields and submit again.";
            Label6.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        Label7.Visible = false;
        Panel1.Visible = false;
    }
}