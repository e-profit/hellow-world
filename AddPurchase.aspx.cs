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


namespace NorthWestupdated
{
    public partial class AddPurchase : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        String voucher;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                if (Session["emailid"] != null)
                {

                    loadGridview();
                    loadDropdown();

                }
                else
                {
                    Response.Redirect("Login.aspx");

                }
            }
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
                    cmd.Parameters.AddWithValue("@mode", 13);
                    cmd.Parameters.AddWithValue("@Product_Name", Name);
                    cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["UserID"].ToString());
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        myresult.Add(dr["Product_Name"].ToString());

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

        public void loadGridview()
        {
            SqlCommand cmd = new SqlCommand("Add_Purchase_Product_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@Voucher", lblvch.Text);
            cmd.Parameters.Add("@msg", SqlDbType.VarChar, 100);
            cmd.Parameters["@msg"].Direction = ParameterDirection.Output;
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        public void loadDropdown()
        {
            SqlCommand cmd = new SqlCommand("vendor_Details_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ddpartyname.DataSource = ds;
            ddpartyname.DataTextField = "Name";
            ddpartyname.DataValueField = "Vch_No";
            ddpartyname.DataBind();
            ddpartyname.Items.Insert(0, new ListItem("----Select Vendor Name----"));

        }



        protected void BtnSubmit_Click1(object sender, EventArgs e)
        {
            var r = new Random();
            voucher = r.Next(100, 999).ToString();

            SqlCommand cmd = new SqlCommand("vendor_Details_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@mode", 1);
            cmd.Parameters.AddWithValue("@Name", txtvendorname.Text);
            cmd.Parameters.AddWithValue("@Company_Name", txtcompanyname.Text);
            cmd.Parameters.AddWithValue("@FAX", txtfax.Text);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);
            cmd.Parameters.AddWithValue("@Contact", txtcontact.Text);
            cmd.Parameters.AddWithValue("@Business_Type", txtbusiness.Text);
            cmd.Parameters.AddWithValue("@Vch_No", voucher);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            loadDropdown();
            txtvendorname.Text = "";
            txtcompanyname.Text = "";
            txtfax.Text = "";
            txtemail.Text = "";
            txtcontact.Text = "";
            txtbusiness.Text = "";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Successfully Added.');", true);
        }

        protected void BtnAddProduct_Click1(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Add_Purchase_Product_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Product_Name", txtpname.Text);
            cmd.Parameters.AddWithValue("@Quantity", txtquantity.Text);
            cmd.Parameters.AddWithValue("@Voucher", lblvch.Text);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.Add("@msg", SqlDbType.VarChar, 100);
            cmd.Parameters["@msg"].Direction = ParameterDirection.Output;
            cmd.Parameters.AddWithValue("@mode", 4);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            string status = cmd.Parameters["@msg"].Value.ToString();
            txtpname.Text = "";
            txtquantity.Text = "";
            loadGridview();
            if (status.ToString() == "1")
            {

            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + status + "');", true);


            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblid");

            SqlCommand cmd = new SqlCommand("Add_Purchase_Product_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@Voucher", lblvch.Text);
            cmd.Parameters.AddWithValue("@Id", lblid.Text);
            cmd.Parameters.Add("@msg", SqlDbType.VarChar, 100);
            cmd.Parameters["@msg"].Direction = ParameterDirection.Output;
            cmd.Parameters.AddWithValue("@mode", 3);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView1.EditIndex = -1;
            loadGridview();
        }

        protected void ddpartyname_TextChanged(object sender, EventArgs e)
        {
            lblvch.Text = ddpartyname.SelectedItem.Value.ToString();
            loadGridview();
            txtdate.Text = "";
        }

        protected void BtnSaveAll_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gd in GridView1.Rows)
            {
                Label txt1 = (Label)gd.FindControl("Productname");
                Label txt2 = (Label)gd.FindControl("lblquantity");

                SqlCommand cmd = new SqlCommand("Add_Purchase_Proc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Product_Name", txt1.Text);
                cmd.Parameters.AddWithValue("@Quantity", txt2.Text);
                cmd.Parameters.AddWithValue("@Voutcher_No", lblvch.Text);
                cmd.Parameters.AddWithValue("@Date", txtdate.Text);
                cmd.Parameters.AddWithValue("@Name", ddpartyname.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.Add("@msg", SqlDbType.VarChar, 100);
                cmd.Parameters["@msg"].Direction = ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@mode", 3);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                string status = cmd.Parameters["@msg"].Value.ToString();
                if (status.ToString() == "1")
                {

                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + status + "');", true);


                }
            }
        }
    }
}