﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Flavors : System.Web.UI.Page
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

    }

    protected void ListView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        string ID = ListView1.SelectedValue.ToString();

        int selectedItem = ListView1.SelectedIndex;

        HiddenField Name = (HiddenField)ListView1.Items[selectedItem].FindControl("flavor_name");
        string name = Name.Value;

        HiddenField Price = (HiddenField)ListView1.Items[selectedItem].FindControl("scoop_price");
        string stringprice = Price.Value;
        decimal price = Decimal.Parse(stringprice);

        SessionCart.AddItem(ID, name, price, 1);
    }
}