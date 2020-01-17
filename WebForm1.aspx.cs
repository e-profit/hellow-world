using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace NorthWestupdated
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text= Calendar1.SelectedDate.ToString();
            Calendar1.Visible = false;
        }
       
        protected void image_calendar_Click1(object sender, ImageClickEventArgs e)
        {
            calendar.Visible = true;
        }

        protected void calendar_SelectionChanged1(object sender, EventArgs e)
        {
            date_selected.Text = calendar.SelectedDate.ToShortDateString().ToString();
            calendar.Visible = false;
        }
    }
}