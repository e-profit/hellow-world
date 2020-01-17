using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace WebApplication1
{
    public partial class ViewOrders : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["emailid"] != null)
                {
                    loaddatagridview();
                    loadcat();

                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            
        }
        public void loaddatagridview()
        {
            SqlCommand com = new SqlCommand("OrdersProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void loadcat()
        {
            foreach (GridViewRow item in GridView1.Rows)
            {
                Label lbldate = (Label)item.FindControl("lbldate");
                string date = lbldate.Text;
                var last10 = date.Substring(date.Length - 19, 10);
                lbldate.Text = last10.ToString();
            }
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("OrdersProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@mode", 4);
            com.Parameters.AddWithValue("@Order_No", txtsearchorderid.Text);
            //com.Parameters.AddWithValue("@fromdate", TextBox1.Text);
            //com.Parameters.AddWithValue("@todate", TextBox2.Text);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            //conn.Open();
            //string qry = "select * from Orders where UserID='"+Session["UserID"]+ "' and  Order_No like '%%'"+txtsearchorderid.Text+"'%%%' or Export_Date Between @fromdate='" + TextBox1.Text + "',@todate='" + TextBox2.Text + "'";
            //SqlCommand com = new SqlCommand(qry,conn);
            //SqlDataAdapter adp = new SqlDataAdapter(com);
            //DataSet ds = new DataSet();
            //adp.Fill(ds);
            //GridView1.DataSource = ds;
            //GridView1.DataBind();
        }






    }
}