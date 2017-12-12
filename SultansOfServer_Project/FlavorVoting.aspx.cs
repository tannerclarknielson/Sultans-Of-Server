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
        Panel2.Visible = false;
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        //update the votes for each flavor in the database
        string updateSQL = "UPDATE Flavors ";
        updateSQL += "SET Votes = Votes + 1 ";
        updateSQL += "WHERE Flavor = @Flavor";

        SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd = new SqlCommand(updateSQL, con);

        SqlParameter param = new SqlParameter();
        cmd.Parameters.AddWithValue("@Flavor", RadioButtonList1.SelectedValue);

        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
            Label1.Text = "Thank you for submitting your vote, here are the current results!";
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

        Panel1.Visible = false;
        Panel2.Visible = true;

        // selecting data from the database for Aggie Ice cream
        string selectSQL = "SELECT Votes FROM Flavors WHERE FlavorID = 1";

        SqlConnection con2 = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd2 = new SqlCommand(selectSQL, con2);
        SqlDataReader reader;

        try
        {
            con2.Open();
            reader = cmd2.ExecuteReader();
            reader.Read();

            Label2.Text = reader["Votes"].ToString();

            reader.Close();
        }
        catch(Exception err)
        {
            lblResults.Text = "Error selecting the votes. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con2.Close();
        }

        // selecting data from the database for Aggie Ice cream
        string selectSQL2 = "SELECT Votes FROM Flavors WHERE FlavorID = 2";

        SqlConnection con3 = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd3 = new SqlCommand(selectSQL2, con3);
        SqlDataReader reader2;

        try
        {
            con3.Open();
            reader2 = cmd3.ExecuteReader();
            reader2.Read();

            Label3.Text = reader2["Votes"].ToString();

            reader2.Close();
        }
        catch (Exception err)
        {
            lblResults.Text = "Error selecting the votes. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con3.Close();
        }

        // selecting data from the database for Aggie Ice cream
        string selectSQL3 = "SELECT Votes FROM Flavors WHERE FlavorID = 3";

        SqlConnection con4 = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd4 = new SqlCommand(selectSQL3, con4);
        SqlDataReader reader3;

        try
        {
            con4.Open();
            reader3 = cmd4.ExecuteReader();
            reader3.Read();

            Label4.Text = reader3["Votes"].ToString();

            reader3.Close();
        }
        catch (Exception err)
        {
            lblResults.Text = "Error selecting the votes. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con4.Close();
        }

        // selecting data from the database for Aggie Ice cream
        string selectSQL4 = "SELECT Votes FROM Flavors WHERE FlavorID = 4";

        SqlConnection con5 = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd5 = new SqlCommand(selectSQL4, con5);
        SqlDataReader reader4;

        try
        {
            con5.Open();
            reader4 = cmd5.ExecuteReader();
            reader4.Read();

            Label5.Text = reader4["Votes"].ToString();

            reader4.Close();
        }
        catch (Exception err)
        {
            lblResults.Text = "Error selecting the votes. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con5.Close();
        }

        // selecting data from the database for Aggie Ice cream
        string selectSQL5 = "SELECT Votes FROM Flavors WHERE FlavorID = 5";

        SqlConnection con6 = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd6 = new SqlCommand(selectSQL5, con6);
        SqlDataReader reader5;

        try
        {
            con6.Open();
            reader5 = cmd6.ExecuteReader();
            reader5.Read();

            Label6.Text = reader5["Votes"].ToString();

            reader5.Close();
        }
        catch (Exception err)
        {
            lblResults.Text = "Error selecting the votes. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con6.Close();
        }

        // selecting data from the database for Aggie Ice cream
        string selectSQL6 = "SELECT Votes FROM Flavors WHERE FlavorID = 6";

        SqlConnection con7 = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
        SqlCommand cmd7 = new SqlCommand(selectSQL6, con7);
        SqlDataReader reader6;

        try
        {
            con7.Open();
            reader6 = cmd7.ExecuteReader();
            reader6.Read();

            Label7.Text = reader6["Votes"].ToString();

            reader6.Close();
        }
        catch (Exception err)
        {
            lblResults.Text = "Error selecting the votes. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con7.Close();
        }

        Panel2.Visible = true;
    }
}