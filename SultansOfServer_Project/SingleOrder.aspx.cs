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

    }
}