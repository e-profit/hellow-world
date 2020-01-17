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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack == false)
            {

                if (Session["emailid"] != null)
                {
                    loadDatalist();
                    showsum();
                    TotalSales();
                    TotalSku();
                    MapedSku();
                    UnMapedSku();
                    ActiveProduct();
                    InActiveProduct();
                    TotalProduct();
                    TotalPayments();
                    TotalOrdersProducts();

                    Totalincome();
                    default_profit();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }



            }
        }
        public void showsum()
        {
            try
            {
                string str = "select Total_Profit from Save_Data order by id";
                SqlCommand cmd = new SqlCommand(str, conn);

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                //Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                Label1.Text = (String.Format("{0:n0}", Double.Parse(ds.Tables[0].Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {


            }

        }

        public void TotalSales()
        {
            try
            {
                
                SqlCommand cmd = new SqlCommand("OrdersProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode",6);
              //  cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adp.Fill(ds);

                //lblsales.Text = ds.Tables[0].Rows[0][0].ToString();
                //double sales = Convert.ToDouble(ds.Tables[0].Rows[0][0].ToString());
                //int i = ((int)sales);
                //lblsales.Text = i.ToString();
                lblsales.Text = (String.Format("{0:n0}", Double.Parse(ds.Tables[0].Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {

                
            }

        }
        public void Totalincome()
        {
            try
            {

                SqlCommand cmd = new SqlCommand("Profit_CalcProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 3);
                //  cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adp.Fill(ds);


                //double paymentvalue = Convert.ToDouble(ds.Tables[0].Rows[0][0].ToString());
                //int i = ((int)paymentvalue);
                //Label1.Text = i.ToString();

                Label1.Text = (String.Format("{0:n0}", Double.Parse(ds.Tables[0].Rows[0][0].ToString())));

            }
            catch (Exception ex)
            {


            }

        }

        public void TotalSku()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ADDSKUProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 10);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                //totalsku.Text = dt.Rows[0][0].ToString();

                totalsku.Text = (String.Format("{0:n0}", Double.Parse(dt.Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {

                
            }

        }
        public void MapedSku()
        {
            try
            {

                SqlCommand cmd = new SqlCommand("ADDSKUProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 11);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                //mapedsku.Text = dt.Rows[0][0].ToString();

                mapedsku.Text = (String.Format("{0:n0}", Double.Parse(dt.Rows[0][0].ToString())));

            }
            catch (Exception ex )
            {

               
            }
        }


        public void UnMapedSku()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ADDSKUProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 12);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                //unmapedsku.Text = dt.Rows[0][0].ToString();

                unmapedsku.Text = (String.Format("{0:n0}", Double.Parse(dt.Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {

               
            }

        }


        public void ActiveProduct()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ProductsProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 10);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                //  activeproduct.Text = dt.Rows[0][0].ToString();

                activeproduct.Text = (String.Format("{0:n0}", Double.Parse(dt.Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {

                
            }

        }


        public void InActiveProduct()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ProductsProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 11);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                //inactiveproduct.Text = dt.Rows[0][0].ToString();

                inactiveproduct.Text = (String.Format("{0:n0}", Double.Parse(dt.Rows[0][0].ToString())));

            }
            catch (Exception ex)
            {

               
            }
        }

        public void TotalProduct()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ProductsProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 12);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                //totalproduct.Text = dt.Rows[0][0].ToString();
                totalproduct.Text = (String.Format("{0:n0}", Double.Parse(dt.Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {

                
            }

        }

        public void TotalPayments()
        {
            try
            {
                //string str = "select Allpayments from TotalPayments order by id";
                SqlCommand cmd = new SqlCommand("PaymentsProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID",Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 11);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                //lbltotalpayments.Text = ds.Tables[0].Rows[0][0].ToString();
              //  lbltotalpayments.Text = String.Format("{0:0.00}", ds.Tables[0].Rows[0][0].ToString());
                double paymentvalue = Convert.ToDouble(ds.Tables[0].Rows[0][0].ToString());
                int i = ((int)paymentvalue);
                //lbltotalpayments.Text = i.ToString();

                lbltotalpayments.Text = (String.Format("{0:n0}", Double.Parse(ds.Tables[0].Rows[0][0].ToString())));

            }
            catch (Exception ex)
            {

                
            }
        }

        public void TotalOrdersProducts()
        {
            try
            {


                SqlCommand cmd = new SqlCommand("OrdersProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 7);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);


                //lbltotalproduct.Text = ds.Tables[0].Rows[0][0].ToString();

                lbltotalproduct.Text = (String.Format("{0:n0}", Double.Parse(ds.Tables[0].Rows[0][0].ToString())));
            }
            catch (Exception ex)
            {

               
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DropDownList1.SelectedItem.Value == "1")
            {
                SqlCommand cmd = new SqlCommand("Profit_CalcProc", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@mode", 5);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewtop10.DataSource = ds;
                GridViewtop10.DataBind();
            }
            else
            {
                if (DropDownList1.SelectedItem.Value == "2")
                {
                    SqlCommand cmd = new SqlCommand("Profit_CalcProc", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@mode", 4);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    GridViewtop10.DataSource = ds;
                    GridViewtop10.DataBind();
                }
            }

        }
        public void loadDatalist()
        {
            SqlCommand cmd = new SqlCommand("Profit_CalcProc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridViewtop10.DataSource = ds;
            GridViewtop10.DataBind();

        }
        public void default_profit()
        {
            SqlCommand cmd = new SqlCommand("Profit_CalcProc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@mode", 5);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridViewtop10.DataSource = ds;
            GridViewtop10.DataBind();
        }
    }
}