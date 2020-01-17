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
    public partial class ViewSKU : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["emailid"] != null)
                {
                    Load_Gridview();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }
        public void Load_Gridview()
        {


            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID",Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 4);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            skugridview.DataSource = ds;
            skugridview.DataBind();


        }

        protected void skugridview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            skugridview.EditIndex = -1;
            Load_Gridview();
        }

       
        protected void skugridview_RowEditing(object sender, GridViewEditEventArgs e)
        {
            skugridview.EditIndex = e.NewEditIndex;
            Load_Gridview();
        }

        protected void skugridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblSKUIDs = (Label)skugridview.Rows[e.RowIndex].FindControl("lblSKUIDs");
            TextBox txtskuname = (TextBox)skugridview.Rows[e.RowIndex].FindControl("txteditskuname");

            conn.Open();
            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@SKUID", lblSKUIDs.Text);
            com.Parameters.AddWithValue("@Name", txtskuname.Text);
            com.Parameters.AddWithValue("@UserID",Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 8);
            com.ExecuteNonQuery();
            conn.Close();
            //SqlDataAdapter adp = new SqlDataAdapter(com);
            //DataTable dt = new DataTable();
            //adp.Fill(dt);
            skugridview.EditIndex = -1;
            Load_Gridview();
        }

        protected void skugridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblSKUID = (Label)skugridview.Rows[e.RowIndex].FindControl("lblSKUID");
            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@SKUID", lblSKUID.Text);
            com.Parameters.AddWithValue("@UserID",Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 5);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            skugridview.EditIndex = -1;
            Load_Gridview();
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@mode", 9);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@Name", txtsearchSKUName.Text);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            skugridview.DataSource = ds;
            skugridview.DataBind();
        }
    }
}