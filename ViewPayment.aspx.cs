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
using System.IO;
using System.Data.OleDb;


namespace WebApplication1
{
    public partial class Pay : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["emailid"] != null)
                {
                    loaddatagridview();
                    findproduct_name();
                    totoalsum();

                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }

        public void loaddatagridview()
        {
            SqlCommand com = new SqlCommand("PaymentsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        
        public void findproduct_name()
        {
            foreach (GridViewRow gd in GridView1.Rows)
            {
                Label lblsellersku = (Label)gd.FindControl("lblsellersku");
                Label lblproductname = (Label)gd.FindControl("lblproductname");

                conn.Open();
                SqlCommand com = new SqlCommand("Map_SKU_Proc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Name", lblsellersku.Text);
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@mode", 4);
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    if (lblsellersku.Text == dr["Name"].ToString())
                    {
                        lblproductname.Text = dr["Product_Name"].ToString();

                    }


                }
                conn.Close();
                dr.Close();

            }
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loaddatagridview();
        }
        protected void loadcat()
        {
            foreach (GridViewRow item in GridView1.Rows)
            {
                Label lbldate = (Label)item.FindControl("lblinvoicedate");
                string date = lbldate.Text;
                var last10 = date.Substring(date.Length - 19, 10);
                lbldate.Text = last10.ToString();
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("PaymentsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@mode", 10);
            com.Parameters.AddWithValue("@Order_ID", txtsearchorderid.Text);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        public void totoalsum()
        {
            SqlCommand com = new SqlCommand("PaymentsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 11);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            Label1.Text = dt.Rows[0][0].ToString();


        }

        
    }
}