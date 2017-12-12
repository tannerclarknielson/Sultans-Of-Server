using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class FlavorVoting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Label1.Text = RadioButtonList1.SelectedValue;

        string updateSQL = "UPDATE Flavors";
        updateSQL += "SET Votes = Votes + 1";
        updateSQL += "WHERE Flavor = '@flavor'";

        SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd = new SqlCommand(updateSQL, con);

        SqlParameter param = new SqlParameter();
        cmd.Parameters.AddWithValue("@flavor", RadioButtonList1.SelectedValue.ToString());
     
       
        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
            Label1.Text = "Thank you for submitting your new flavor idea!";
        }
        catch (Exception err)
        {
            Label1.Text = "An error occurred, please fill out all fields and submit again.";
            Label1.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        //Panel1.Visible = false;
    }
}