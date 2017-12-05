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
        //Bind the Listview to the shopping cart items

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
}