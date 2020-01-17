using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class MapedSKU : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {



                if (Session["emailid"] != null)
                {
                    loadmapedsku();
                    updateskuname_and_showmaped_data();
                    updateProductName_and_showmaped_data();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }



            }
           
            
           
        }
        public void loadmapedsku()
        {
            SqlCommand com = new SqlCommand("Map_SKU_Proc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID",Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        public void updateskuname_and_showmaped_data()
        {
            foreach (GridViewRow gd in GridView1.Rows)
            {
                Label lblskuid = (Label)gd.FindControl("lblSkuID");
                Label Label1SKUNMAE = (Label)gd.FindControl("Label1");
               
                SqlCommand com = new SqlCommand("ADDSKUProc", conn);
                com.CommandType = CommandType.StoredProcedure;   
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@SKUID", lblskuid.Text);
                com.Parameters.AddWithValue("@mode", 16);
                SqlDataAdapter adp = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                adp.Fill(ds);
                if (ds.Rows.Count > 0)
                {
                    

                        string sku = ds.Rows[0]["Name"].ToString();
                        SqlCommand com1 = new SqlCommand("ADDSKUProc", conn);
                        com1.CommandType = CommandType.StoredProcedure;
                        com1.Parameters.AddWithValue("@SKUID", lblskuid.Text);
                        com1.Parameters.AddWithValue("@Name", sku);
                        com1.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        com1.Parameters.AddWithValue("@mode", 15);
                        SqlDataAdapter adp1 = new SqlDataAdapter(com1);
                        DataTable ds1 = new DataTable();
                        adp1.Fill(ds1);
                        loadmapedsku();
                   
                }
            }
        }

        public void updateProductName_and_showmaped_data()
        {
            foreach (GridViewRow gd in GridView1.Rows)
            {
              
               
                Label lblProductid = (Label)gd.FindControl("lblProductid");
                Label lblname = (Label)gd.FindControl("lblname");

                SqlCommand com = new SqlCommand("ProductsProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@ProductID", lblProductid.Text);
                com.Parameters.AddWithValue("@mode", 13);
                SqlDataAdapter adp = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                adp.Fill(ds);
                if (ds.Rows.Count > 0)
                {
                    

                        string ProductID = ds.Rows[0]["Product_Name"].ToString();
                        SqlCommand com1 = new SqlCommand("ProductsProc", conn);
                        com1.CommandType = CommandType.StoredProcedure;
                        com1.Parameters.AddWithValue("@ProductID", lblProductid.Text);
                        com1.Parameters.AddWithValue("@Product_Name", ProductID);
                        com1.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        com1.Parameters.AddWithValue("@mode", 14);
                        SqlDataAdapter adp1 = new SqlDataAdapter(com1);
                        DataTable ds1 = new DataTable();
                        adp1.Fill(ds1);
                        loadmapedsku();
                    
                }
            }
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           // Label lblid = (Label)GridView1.Rows[e.RowIndex].FindControl("Labeids");
          
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "Unmaped")
            {
                
                string SKUID = e.CommandArgument.ToString();
               // Label skuname = (Label)GridView1.Rows[0].FindControl("Label1");

                SqlCommand com = new SqlCommand("Map_SKU_Proc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@SKUID", SKUID);
                com.Parameters.AddWithValue("@UserID",Session["UserID"]);
                com.Parameters.AddWithValue("@mode", 3);
                SqlDataAdapter adp = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                

                SqlCommand cmd1 = new SqlCommand("ADDSKUProc", conn);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@SKUID", SKUID);
                cmd1.Parameters.AddWithValue("@UserID",Session["UserID"]);
                cmd1.Parameters.AddWithValue("@mode", 7);
                SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                adp1.Fill(ds1);
                GridView1.EditIndex = -1;
                loadmapedsku();
            }
          
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("Map_SKU_Proc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@mode", 5);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@Name", txtsearchmapedSKUName.Text);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}