using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
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

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Submit")
        {
            DateTime orderdate = DateTime.Now;
            decimal total = SessionCart.GetSubTotal();
            string customer = TextBox1.Text;
            string number = TextBox2.Text;

            DataTable items = new DataTable();

            items.Columns.Add("prod_id", typeof(int));
            items.Columns.Add("Quantity", typeof(int));
            items.Columns.Add("Price", typeof(decimal));

            foreach (CartItem i in SessionCart.Items)
            {
                items.Rows.Add(new object[] { i.ID, i.Quantity, i.Price });
            }

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["5050_sultans_serverConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("InsertOrder", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@OrderDate", orderdate);
            cmd.Parameters.AddWithValue("@Total", total);
            cmd.Parameters.AddWithValue("@Customer", customer);
            cmd.Parameters.AddWithValue("@PhoneNumber", number);
            cmd.Parameters.AddWithValue("@OrderItems", items);

            try
            {
                con.Open();
                int rowsaffected = cmd.ExecuteNonQuery();
                SessionCart = null;
            }

            catch (Exception err)
            {

            }

            finally
            {
                con.Close();
            }
        }
    }







    protected void btnSubmitOrder_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Label4.Text = "Thank you! Your order will be ready in 15-20 minutes. Please have payment ready at cash register.";
    }
}