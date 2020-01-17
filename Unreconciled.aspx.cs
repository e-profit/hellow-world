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
    public partial class Unreconciled : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        double a, b, c;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["emailid"] != null)
                {
                    BindGridView();
                    loadcat();
                    CalculationFor_TotalCost();
                    CalculationFor_Net_Order_Value_payable_to_Seller();
                    CalculationFor_Net_Order_Value_payable_to_Seller_rto();
                    CalculationFor_Net_Order_Value_payable_to_Seller_DTO();
                    CalculationFor_Net_Payout();
                    CalculationFor_Profit();
                    //Fatch_valueFor_OrderSummary();
                    // lnkDelivered_Click( );
                    insertdatain_Profit_CalcTable();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        public void BindGridView()
        {
            SqlCommand com = new SqlCommand("PaymentsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 9);
            
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                // GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Data";
            }

        }
        protected void loadcat()
        {
            try
            {
                foreach (GridViewRow item in GridView1.Rows)
                {
                    Label lbldate = (Label)item.FindControl("lbldate");
                    string date = lbldate.Text;
                    var last10 = date.Substring(date.Length - 19, 10);
                    lbldate.Text = last10.ToString();
                }
            }
            catch (Exception ex)
            {

                
            }
        }
        protected void CalculationFor_TotalCost()
        {
            try
            {
                foreach (GridViewRow item in GridView1.Rows)
                {
                    Label lblunits = (Label)item.FindControl("lblunits");
                    Label lblproductcost = (Label)item.FindControl("lblproductcost");
                    Label TotalCost = (Label)item.FindControl("lblunitcostamount");

                    int Total = (Convert.ToInt32(lblunits.Text) * Convert.ToInt32(lblproductcost.Text));

                    TotalCost.Text = Total.ToString();
                }
            }
            catch (Exception ex)
            {

                
            }
        }
        protected void CalculationFor_Net_Order_Value_payable_to_Seller()
        {

            foreach (GridViewRow item in GridView1.Rows)
            {
                try
                {
                    LinkButton lnkDelivered = (LinkButton)item.FindControl("lnkDelivered");
                    LinkButton lnkorderno = (LinkButton)item.FindControl("lnkorderno");
                    Label lblsellersku = (Label)item.FindControl("lblsellersku");
                    double count = 0;

                    SqlCommand com = new SqlCommand("PaymentsProc", conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Order_ID", lnkorderno.Text);
                    com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
                    com.Parameters.AddWithValue("@mode", 4);
                    conn.Open();
                    count = (double)com.ExecuteScalar();
                    conn.Close();
                    lnkDelivered.Text = count.ToString();

                }
                catch (Exception ex)
                {

                    conn.Close();
                }
            }

        }
        protected void CalculationFor_Net_Order_Value_payable_to_Seller_rto()
        {

            foreach (GridViewRow item in GridView1.Rows)
            {
                try
                {
                    LinkButton lnkrto = (LinkButton)item.FindControl("lnkrto");
                    LinkButton lnkorderno = (LinkButton)item.FindControl("lnkorderno");
                    Label lblsellersku = (Label)item.FindControl("lblsellersku");

                    double count = 0;

                    SqlCommand com = new SqlCommand("PaymentsProc", conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Order_ID", lnkorderno.Text);
                    com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
                    com.Parameters.AddWithValue("@mode", 5);
                    conn.Open();
                    count = (double)com.ExecuteScalar();
                    conn.Close();
                    lnkrto.Text = count.ToString();

                }
                catch (Exception ex)
                {
                    conn.Close();

                }
            }

        }
        protected void CalculationFor_Net_Order_Value_payable_to_Seller_DTO()
        {

            foreach (GridViewRow item in GridView1.Rows)
            {
                try
                {
                    LinkButton lnkdto = (LinkButton)item.FindControl("lnkdto");
                    LinkButton lnkorderno = (LinkButton)item.FindControl("lnkorderno");
                    Label lblsellersku = (Label)item.FindControl("lblsellersku");

                    double count;

                    SqlCommand com = new SqlCommand("PaymentsProc", conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Order_ID", lnkorderno.Text);
                    com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
                    com.Parameters.AddWithValue("@mode", 6);
                    conn.Open();
                    count = (double)com.ExecuteScalar();
                    conn.Close();
                    lnkdto.Text = count.ToString();

                }
                catch (Exception ex)
                {
                    conn.Close();

                }
            }

        }

        protected void CalculationFor_Net_Payout()
        {

            try
            {
                foreach (GridViewRow item in GridView1.Rows)
                {

                    Label lblnetpayout = (Label)item.FindControl("lblnetpayout");
                    LinkButton lnkDelivered = (LinkButton)item.FindControl("lnkDelivered");
                    LinkButton lnkdto = (LinkButton)item.FindControl("lnkdto");
                    LinkButton lnkrto = (LinkButton)item.FindControl("lnkrto");

                    if (lnkDelivered.Text != "")
                    {
                        a = Convert.ToDouble(lnkDelivered.Text);
                    }
                    else
                    {
                        lnkDelivered.Text = "0";
                    }
                    if (lnkdto.Text != "")
                    {
                        b = Convert.ToDouble(lnkdto.Text);
                    }
                    else
                    {
                        lnkdto.Text = "0";
                    }
                    if (lnkrto.Text != "")
                    {
                        c = Convert.ToDouble(lnkrto.Text);
                    }
                    else
                    {
                        lnkrto.Text = "0";
                    }

                    double Result = a + b + c;


                    lblnetpayout.Text = Result.ToString();

                }
            }
            catch (Exception ex)
            {

                
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delivery")
            {
                //string orderno = Convert.ToString(e.CommandArgument.ToString());

                ////GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                ////TextBox txtDescription = (TextBox)row.FindControl("txtDescription");


                //Label lblsellersku = (Label)GridView1.Rows[0].Cells[3].FindControl("lblsellersku");
                //SqlCommand com = new SqlCommand("PaymentsProc", conn);
                //com.CommandType = CommandType.StoredProcedure;
                //com.Parameters.AddWithValue("@Order_ID", orderno);

                //com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
                //com.Parameters.AddWithValue("@mode", 8);
                //SqlDataAdapter adp = new SqlDataAdapter(com);
                //DataTable dt = new DataTable();
                //adp.Fill(dt);
                //if (dt.Rows.Count > 0)
                //{

                //    GridView2.DataSource = dt;
                //    GridView2.DataBind();

                //}
                //else
                //{
                //    dt.Rows.Add(dt.NewRow());
                //    GridView2.DataSource = dt;
                //    GridView2.DataBind();
                //    GridView2.Rows[0].Cells.Clear();
                //    GridView2.Rows[0].Cells.Add(new TableCell());
                //    // GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                //    GridView2.Rows[0].Cells[0].Text = "No Data";
                //}
            }
        }

        protected void lnkDelivered_Click(object sender, EventArgs e)
        {
            // string orderno = Convert.ToString(e.CommandArgument.ToString());
            //LinkButton lnkDelivered = (sender as LinkButton);
            //string[] commandArguments = lnkDelivered.CommandArgument.Split(',');
            ////GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
            ////TextBox txtDescription = (TextBox)row.FindControl("txtDescription");


            //Label lblsellersku = (Label)GridView1.Rows[0].Cells[3].FindControl("lblsellersku");
            //SqlCommand com = new SqlCommand("PaymentsProc", conn);
            //com.CommandType = CommandType.StoredProcedure;
            //com.Parameters.AddWithValue("@Order_ID", commandArguments);

            //com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
            //com.Parameters.AddWithValue("@mode", 8);
            //SqlDataAdapter adp = new SqlDataAdapter(com);
            //DataTable dt = new DataTable();
            //adp.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{

            //    GridView2.DataSource = dt;
            //    GridView2.DataBind();

            //}
            //else
            //{
            //    dt.Rows.Add(dt.NewRow());
            //    GridView2.DataSource = dt;
            //    GridView2.DataBind();
            //    GridView2.Rows[0].Cells.Clear();
            //    GridView2.Rows[0].Cells.Add(new TableCell());
            //    // GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
            //    GridView2.Rows[0].Cells[0].Text = "No Data";
            //}

        }

        protected void CalculationFor_Profit()
        {

            foreach (GridViewRow item in GridView1.Rows)
            {
                try
                {
                    // LinkButton lnkDelivered = (LinkButton)item.FindControl("lnkDelivered");
                    LinkButton lnkorderno = (LinkButton)item.FindControl("lnkorderno");
                    Label lblsellersku = (Label)item.FindControl("lblsellersku");
                    Label lblunitcostamount = (Label)item.FindControl("lblunitcostamount");
                    Label lblnetpayout = (Label)item.FindControl("lblnetpayout");
                    Label Profit = (Label)item.FindControl("Profit");
                    //double count = 0;
                    conn.Open();
                    SqlCommand com = new SqlCommand("PaymentsProc", conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Order_ID", lnkorderno.Text);

                    com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
                    com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    com.Parameters.AddWithValue("@mode", 7);
                    SqlDataReader dr = com.ExecuteReader();
                    while (dr.Read())
                    {
                        double result = Convert.ToDouble(lblnetpayout.Text) - Convert.ToDouble(lblunitcostamount.Text);
                        Profit.Text = result.ToString();
                    }

                    conn.Close();
                    dr.Close();
                }
                catch (Exception ex)
                {

                    conn.Close();
                }
            }

        }
        protected void Fatch_valueFor_OrderSummary()
        {

            //foreach (GridViewRow item in GridView1.Rows)
            //{
            //    try
            //    {
            //        // LinkButton lnkDelivered = (LinkButton)item.FindControl("lnkDelivered");
            //        LinkButton lnkDelivered = (LinkButton)item.FindControl("lnkDelivered");
            //        Label lblsellersku = (Label)item.FindControl("lblsellersku");

            //        //double count = 0;

            //        SqlCommand com = new SqlCommand("PaymentsProc", conn);
            //        com.CommandType = CommandType.StoredProcedure;
            //        com.Parameters.AddWithValue("@Order_ID", it.CommandArgument.ToString());

            //        com.Parameters.AddWithValue("@Shipment_Item_Id", lblsellersku.Text);
            //        com.Parameters.AddWithValue("@mode", 8);
            //        SqlDataAdapter adp = new SqlDataAdapter(com);
            //        DataSet ds = new DataSet();
            //        adp.Fill(ds);
            //        GridView2.DataSource = ds;
            //        GridView2.DataBind();
            //        //SqlDataReader dr = com.ExecuteReader();
            //while (dr.Read())
            //{
            //    double result = Convert.ToDouble(lblunitcostamount.Text) - Convert.ToDouble(lblnetpayout.Text);
            //    Profit.Text = result.ToString();
            //}

            //conn.Close();
            //dr.Close();
            //    }
            //    catch (Exception ex)
            //    {


            //    }
            //}

        }
        public void insertdatain_Profit_CalcTable()
        {

            try
            {

                foreach (GridViewRow gd in GridView1.Rows)
                {
                    LinkButton orderno = (LinkButton)gd.FindControl("lnkorderno");
                    Label Seller_SKU = (Label)gd.FindControl("lblsellersku");
                    Label productname = (Label)gd.FindControl("lblproductname");
                    Label Cost = (Label)gd.FindControl("lblproductcost");
                    Label lbldate = (Label)gd.FindControl("lbldate");
                    Label lblunits = (Label)gd.FindControl("lblunits");

                    Label lblunitcostamount = (Label)gd.FindControl("lblunitcostamount");
                    LinkButton lnkDelivered = (LinkButton)gd.FindControl("lnkDelivered");
                    double Delivered = 0;
                    Delivered = Convert.ToDouble(lnkDelivered.Text);
                    LinkButton lnkdto = (LinkButton)gd.FindControl("lnkdto");
                    double DTO = 0;
                    DTO = Convert.ToDouble(lnkdto.Text);
                    LinkButton lnkrto = (LinkButton)gd.FindControl("lnkrto");
                    double RTO = 0;
                    RTO = Convert.ToDouble(lnkrto.Text);
                    Label lblnetpayout = (Label)gd.FindControl("lblnetpayout");
                    Label Profit = (Label)gd.FindControl("Profit");

                    //if (OrderNo == orderno.Text)
                    //{

                    SqlCommand com1 = new SqlCommand("Item_Wise_UnreconciledProc", conn);
                    com1.CommandType = CommandType.StoredProcedure;
                    com1.Parameters.AddWithValue("@Date", lbldate.Text);
                    com1.Parameters.AddWithValue("@TotalCost", lblunitcostamount.Text);
                    com1.Parameters.AddWithValue("@Delivered", Delivered);
                    com1.Parameters.AddWithValue("@DTO", DTO);
                    com1.Parameters.AddWithValue("@RTO", RTO);
                    com1.Parameters.AddWithValue("@Units", lblunits.Text);
                    com1.Parameters.AddWithValue("@NetPayout", lblnetpayout.Text);
                    com1.Parameters.AddWithValue("@ProductName", productname.Text);
                    com1.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    com1.Parameters.AddWithValue("@SKUName", Seller_SKU.Text);
                    com1.Parameters.AddWithValue("@OrderNo", orderno.Text);
                    com1.Parameters.AddWithValue("@ProductCost", Cost.Text);
                    com1.Parameters.AddWithValue("@Profit", Profit.Text);
                    com1.Parameters.AddWithValue("@mode", 1);
                    SqlDataAdapter adp1 = new SqlDataAdapter(com1);
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);

                }
            }
            catch (Exception ex)
            {


            }


        }


    }
}