using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace North_West
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack==false)
            {
                if(Session["emailid"]!=null)
                {
                    lblUserName.Text = Session["UserName"].ToString();
                }
                else
                {
                    if (Session["emailid"] == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}