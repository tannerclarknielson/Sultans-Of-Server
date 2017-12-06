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
        string ItemID = e.Keys["ID"].ToString();

        //call the remove method of the cart
        SessionCart.RemoveItem(ItemID);

        //rebind the ListView
        ListView1.DataBind();
    }

    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        //get the ID of the item to be updated
        string ItemID = e.Keys["ID"].ToString();

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
        Total.Text = String.Format("{0:c}", SessionCart.GetTotal());
    }

    //protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    //Check to make sure that the Checkout button was clicked
    //    if (e.CommandName == "Checkout")
    //    {
    //        //write the order to the database
    //        string username = User.Identity.Name; //gets username of currently logged in user
    //        DateTime orderdate = DateTime.Now;
    //        decimal subtotal = SessionCart.GetSubTotal();
    //        decimal shipping = SessionCart.GetShipping();
    //        decimal total = SessionCart.GetTotal();

    //        // create a DataTable object to store the order details
    //        DataTable items = new DataTable();

    //        //Add appropriate columns to items DataTable
    //        items.Columns.Add("ProductID", typeof(int));
    //        items.Columns.Add("Quantity", typeof(int));
    //        items.Columns.Add("Price", typeof(decimal));

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

}