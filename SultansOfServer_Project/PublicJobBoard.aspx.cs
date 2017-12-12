using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PublicJobBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnback.Visible = false;
    }

    protected void gvJobs_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvPublicBoard.Visible = false;
        dvPublicBoard.Visible = true;
        btnback.Visible = true;

    }
}