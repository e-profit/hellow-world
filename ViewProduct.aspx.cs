using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication1
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    Load_Gridview();
                    txtsearchproductName.Text = "";
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        public void Load_Gridview()
        {
            SqlCommand com = new SqlCommand("ProductsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 3);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ProductsDetailGridview.DataSource = ds;
            ProductsDetailGridview.DataBind();
        }

        protected void ProductsDetailGridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProductsDetailGridview.EditIndex = -1;
            search();
        }

        protected void ProductsDetailGridview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProductsDetailGridview.EditIndex = e.NewEditIndex;
            search();
        }

        protected void ProductsDetailGridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Label lblproductid = (Label)ProductsDetailGridview.Rows[e.RowIndex].FindControl("lblproductids");
            TextBox txteditname = (TextBox)ProductsDetailGridview.Rows[e.RowIndex].FindControl("txteditname");
            TextBox txteditcost = (TextBox)ProductsDetailGridview.Rows[e.RowIndex].FindControl("txteditcost");
            TextBox txteditweight = (TextBox)ProductsDetailGridview.Rows[e.RowIndex].FindControl("txteditweight");

            SqlCommand com = new SqlCommand("ProductsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ProductID", lblproductid.Text);
            com.Parameters.AddWithValue("@Product_Name", txteditname.Text);
            com.Parameters.AddWithValue("@ProductCost", txteditcost.Text);
            com.Parameters.AddWithValue("@Product_Weight", txteditweight.Text);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 4);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ProductsDetailGridview.EditIndex = -1;
            search();
        }

        protected void ProductsDetailGridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblproductid = (Label)ProductsDetailGridview.Rows[e.RowIndex].FindControl("lblproductid");
            SqlCommand com = new SqlCommand("ProductsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ProductID", lblproductid.Text);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 5);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ProductsDetailGridview.EditIndex = -1;
            search();
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("ProductsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@mode", 9);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@Product_Name", txtsearchproductName.Text);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ProductsDetailGridview.DataSource = ds;
            ProductsDetailGridview.DataBind();
        }

        public void search()
        {

            for (int i = 0; i < ProductsDetailGridview.Rows.Count; i++)
            {
                SqlCommand com = new SqlCommand("ProductsProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@mode", 9);
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@Product_Name", txtsearchproductName.Text);
                SqlDataAdapter adp2 = new SqlDataAdapter(com);
                DataSet ds2 = new DataSet();
                adp2.Fill(ds2);
                ProductsDetailGridview.DataSource = ds2;
                ProductsDetailGridview.DataBind();
            }
            for (int i = 0; i == ProductsDetailGridview.Rows.Count; i++)
            {
                Load_Gridview();

            }

        }

    }
    
}