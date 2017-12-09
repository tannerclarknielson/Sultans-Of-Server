using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SingleOrder : System.Web.UI.Page
{
    private Cart SessionCart
    {
        get
        {
            if (Session["Cart"] == null)
                Session["Cart"] = new Cart();
            return (Cart)Session["Cart"];
        }
        set
        { Session["Cart"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ListView1.DataSource = SessionCart.Items;
        if (!IsPostBack)
            ListView1.DataBind();
    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        //get the ID of the item to be deleted
        //string ItemID = e.Keys["ID"].ToString();
        string ItemID = ListView1.DataKeys[e.ItemIndex].Value.ToString();

        //call the remove method of the cart
        SessionCart.RemoveItem(ItemID);

        //rebind the ListView
        ListView1.DataBind();
    }

    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        //get the ID of the item to be updated
        string ItemID = ListView1.DataKeys[e.ItemIndex].Value.ToString();

        //get the new quantity
        int newQuantity = Convert.ToInt32(e.NewValues["Quantity"].ToString());

        //update the quantity
        SessionCart.UpdateQuantity(newQuantity, ItemID);

        //rebind the ListView
        ListView1.DataBind();
    }



    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        //get reference to Quantity textbox
        TextBox txtQty = (TextBox)sender;

        //get reference to parent control (the ListViewItem of the textbox)
        ListViewItem lvItem = (ListViewItem)txtQty.Parent;

        //ge index of the item to be updated
        int index = lvItem.DataItemIndex;

        //get ID of item to be updated
        string ItemID = ListView1.DataKeys[index].Value.ToString();

        //get new quantity
        int newQuantity = Convert.ToInt32(txtQty.Text);

        //update quantity in cart
        SessionCart.UpdateQuantity(newQuantity, ItemID);

        //rebind listview
        ListView1.DataBind();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        Total.Text = String.Format("{0:c}", SessionCart.GetSubTotal());
    }

    //protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    //Check to make sure that the Checkout button was clicked
    //    if (e.CommandName == "Submit")
    //    {
    //        //write the order to the database
    //   
    //        DateTime orderdate = DateTime.Now;
    //        
    //        decimal total = SessionCart.GetSubTotal();

    //        // create a DataTable object to store the order details
    //        DataTable items = new DataTable();

    //        //Add appropriate columns to items DataTable
    //        items.Columns.Add("Item", typeof(string));
    //        items.Columns.Add("Quantity", typeof(int));
    //        items.Columns.Add("Total", typeof(decimal));
    //        items.Columns.Add("CustomerName", typeof(string));
    //        items.Columns.Add("PhoneNumber", typeof(string));

    //        //add Cart items to the table. Each item is a row in the table
    //        foreach (CartItem i in SessionCart.Items)
    //        {
    //            items.Rows.Add(new object[] { i.ID, i.Quantity, i.ExtendedPrice });
    //        }

    //        //ADO objects to perform the insert
    //        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Toys"].ConnectionString);
    //        SqlCommand cmd = new SqlCommand("InsertOrder", con);
    //        //Set up the command to execute a stored procedure
    //        cmd.CommandType = CommandType.StoredProcedure;

    //        //Attach required parameters to the command
    //        cmd.Parameters.AddWithValue("@UserName", username);
    //        cmd.Parameters.AddWithValue("@OrderDate", orderdate);
    //        cmd.Parameters.AddWithValue("@SubTotal", subtotal);
    //        cmd.Parameters.AddWithValue("@Shipping", shipping);
    //        cmd.Parameters.AddWithValue("@Total", total);
    //        cmd.Parameters.AddWithValue("@OrderItems", items);

    //        //connect to the database and execute the command
    //        try
    //        {
    //            con.Open();
    //            int rowsaffected = cmd.ExecuteNonQuery();
    //            //SessionCart = null;
    //            Response.Redirect("PaypalCheckout.aspx");
    //        }

    //        catch (Exception err)
    //        {
    //            //code here to handle any exceptions
    //        }

    //        finally
    //        {
    //            con.Close();
    //        }
    //    }
    //}




    //protected void btnSubmitOrder_Click(object sender, EventArgs e)
    //{
    //    string insertSQL = "INSERT INTO orders (con_date,con_firstname, con_lastname, con_email, con_message)";
    //    insertSQL += "VALUES (@con_date, @con_firstname, @con_lastname, @con_email, @con_message)";

    //    SqlConnection con = new SqlConnection("Data Source=stairway.usu.edu; Initial Catalog=5050_sultans_server;User ID=5050_sultans_server; Password=aggieicecream");
    //    SqlCommand cmd = new SqlCommand(insertSQL, con);

    //    SqlParameter param = new SqlParameter();
    //    cmd.Parameters.AddWithValue("@con_date", DateTime.Now.ToShortDateString());
    //    cmd.Parameters.AddWithValue("@con_firstname", txtContactFN.Text);
    //    cmd.Parameters.AddWithValue("@con_lastname", txtContactLN.Text);
    //    cmd.Parameters.AddWithValue("@con_email", txtContactEmail.Text);
    //    cmd.Parameters.AddWithValue("@con_message", txtContactMessage.Text);

    //    int added = 0;
    //    try
    //    {
    //        con.Open();
    //        added = cmd.ExecuteNonQuery(); //use for insert, update, delete commands
    //        lblContactSubmit.Text = "Thank you for contacting us " + txtContactFN.Text + "! If necessary, we will get back to you by " + DateTime.Today.AddDays(3).ToShortDateString();
    //    }
    //    catch (Exception err)
    //    {
    //        lblContactSubmit.Text = "Error inserting record. ";
    //        lblContactSubmit.Text += err.Message;
    //    }
    //    finally
    //    {
    //        con.Close();
    //    }
    //}
}