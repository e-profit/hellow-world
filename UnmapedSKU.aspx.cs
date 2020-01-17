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
    public partial class WebForm2 : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        String p;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                if (Session["UserID"] != null)
                {
                    loaddatagridview();
                    foreach (GridViewRow gd in GridView1.Rows)
                    {
                        if (GridView1.Rows.Count > 1)
                        {
                            GridView1.Rows[0].Enabled = false;

                        }
                        else
                        {
                            GridView1.Rows[0].Enabled = true;
                        }
                    }
                }

            }
        }
        public void loaddatagridview()
        {
            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 3);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            foreach (GridViewRow gd in GridView1.Rows)
            {
                if (GridView1.Rows.Count > 1)
                {
                    GridView1.Rows[0].Enabled = false;

                }
                else
                {
                    GridView1.Rows[0].Enabled = true;
                }
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {

            }
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label txtskuname = (Label)GridView1.Rows[e.RowIndex].FindControl("Label3");
            Label Labeid = (Label)GridView1.Rows[e.RowIndex].FindControl("Labeid");
            TextBox txtproducname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtProductName1");
            Label txtcost = (Label)GridView1.Rows[e.RowIndex].FindControl("Label6");
            Label txtweight = (Label)GridView1.Rows[e.RowIndex].FindControl("Label7");
            Label lblSKUID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblSKUID1");



            SqlCommand cmd = new SqlCommand("Map_SKU_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", txtskuname.Text);
            cmd.Parameters.AddWithValue("@Product_Name", txtproducname.Text);
            cmd.Parameters.AddWithValue("@Cost", txtcost.Text);
            cmd.Parameters.AddWithValue("@Weight", txtweight.Text);
            cmd.Parameters.AddWithValue("@Status", "1");
            cmd.Parameters.AddWithValue("@SKUID", lblSKUID.Text);
            cmd.Parameters.AddWithValue("@ProductID", lblproductid.Text);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@mode", 1);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            SqlCommand cmd1 = new SqlCommand("ADDSKUProc", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@SKUID", lblSKUID.Text);
            cmd1.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd1.Parameters.AddWithValue("@mode", 6);
            SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
            DataSet ds1 = new DataSet();
            adp1.Fill(ds1);
            GridView1.EditIndex = -1;
            search();
        }


        [WebMethod(EnableSession = true)]
        public static List<string> GetName(string Name)
        {
            List<string> myresult = new List<string>();
            if (myresult.Count == 0)
            {
                SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

                if (myresult.Count == 0)
                {
                    //string a=;
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("ProductsProc", connn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@mode", 6);
                    cmd.Parameters.AddWithValue("@Product_Name", Name);
                    cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"].ToString());
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        myresult.Add(dr["Product_Name"].ToString());
                        //HttpContext.Current.Session["id"] = dr["ProductID"].ToString();


                    }
                    dr.Close();
                    connn.Close();

                }
                else
                {
                }
            }
            return myresult;

        }

        protected void txtProductName_TextChanged(object sender, EventArgs e)
        {
            GridViewRow row = (sender as TextBox).NamingContainer as GridViewRow;
            TextBox txt = (TextBox)row.FindControl("txtProductName1");


            Label lblCost = (Label)row.FindControl("Label6");
            Label lblweight = (Label)row.FindControl("Label7");
            conn.Open();
            SqlCommand cmd = new SqlCommand("ProductsProc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Product_Name", txt.Text);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@mode", 7);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (txt.Text == dr["Product_Name"].ToString())

                {
                    lblCost.Text = dr["ProductCost"].ToString();
                    lblweight.Text = dr["Product_Weight"].ToString();
                    lblproductid.Text = dr["ProductID"].ToString();

                }

            }
            conn.Close();
            dr.Close();

        }


        protected void Search_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@mode", 9);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@Name", txtsearchunmapedSKUName.Text);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            foreach (GridViewRow gd in GridView1.Rows)
            {
                if (GridView1.Rows.Count > 1)
                {
                    GridView1.Rows[0].Enabled = false;

                }
                else
                {
                    GridView1.Rows[0].Enabled = true;
                }
            }

        }

        public void search()
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                SqlCommand com = new SqlCommand("ADDSKUProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@mode", 9);
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@Name", txtsearchunmapedSKUName.Text);
                SqlDataAdapter adp2 = new SqlDataAdapter(com);
                DataSet ds2 = new DataSet();
                adp2.Fill(ds2);
                GridView1.DataSource = ds2;
                GridView1.DataBind();
            }
            for (int i = 0; i == GridView1.Rows.Count; i++)
            {
                loaddatagridview();


            }





        }

        protected void btnsaveall_Click(object sender, EventArgs e)
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                Label txtskuname = (Label)GridView1.Rows[i].FindControl("Label3");
                Label Labeid = (Label)GridView1.Rows[i].FindControl("Labeid");
                TextBox txtproducname = (TextBox)GridView1.Rows[i].FindControl("txtProductName1");
                Label txtcost = (Label)GridView1.Rows[i].FindControl("Label6");
                Label txtweight = (Label)GridView1.Rows[i].FindControl("Label7");
                Label lblSKUID = (Label)GridView1.Rows[i].FindControl("lblSKUID1");

                if (txtcost.Text == "" && txtweight.Text == "")
                {

                }
                else
                {
                    SqlCommand cmd = new SqlCommand("Map_SKU_Proc", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", txtskuname.Text);
                    cmd.Parameters.AddWithValue("@Product_Name", txtproducname.Text);
                    cmd.Parameters.AddWithValue("@Cost", txtcost.Text);
                    cmd.Parameters.AddWithValue("@Weight", txtweight.Text);
                    cmd.Parameters.AddWithValue("@Status", "1");
                    cmd.Parameters.AddWithValue("@SKUID", lblSKUID.Text);
                    cmd.Parameters.AddWithValue("@ProductID", lblproductid.Text);
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@mode", 1);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);

                    SqlCommand cmd1 = new SqlCommand("ADDSKUProc", conn);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@SKUID", lblSKUID.Text);
                    cmd1.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmd1.Parameters.AddWithValue("@mode", 6);
                    SqlDataAdapter adp1 = new SqlDataAdapter(cmd1);
                    DataSet ds1 = new DataSet();
                    adp1.Fill(ds1);
                }

            }
            search();
            foreach (GridViewRow gd in GridView1.Rows)
            {
                if (GridView1.Rows.Count > 1)
                {
                    GridView1.Rows[0].Enabled = false;

                }
                else
                {
                    GridView1.Rows[0].Enabled = true;
                }
            }
        }
    }
}