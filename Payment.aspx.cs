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

namespace NorthWestupdated
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["emailid"] != null)
                {
                    lblmsg.Visible = false;

                }
                else
                {
                    Response.Redirect("Login.aspx");

                }
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fduploadpayments.PostedFile.FileName);
            string extension = Path.GetExtension(filename);
            string contentType = fduploadpayments.PostedFile.ContentType;
            HttpPostedFile file = fduploadpayments.PostedFile;
            byte[] document = new byte[file.ContentLength];
            file.InputStream.Read(document, 0, file.ContentLength);

            if (extension != ".xlsx")
            {
                Response.Write("<script>alert('This is Invalid File')</script>");

                return;
            }
            else
            {
                String name1;
                String name2;
                String name3;
                String name4;
                String name5;
                String name6;
                String name7;
                String name8;
                String name9;
                String name10;
                String name11;
                String name12;
                String name13;
                String name14;
                String name15;
                String name16;
                String name17;
                String name18;
                String name19;
                String name20;
                String name21;
                String name22;
                String name23;
                String name24;
                String name25;
                String name26;
                String name27;
                String name28;
                String name29;
                String name30;
                String name31;
                String name32;
                String name33;
                String name34;
                String name35;
                String name36;
                String name37;
                String name38;
                String name39;
                String name40;
                String name41;
                String name42;
                String name43;
                String name44;
                String name45;
                String name46;
                String name47;
                String name48;
                String name49;
                String name50;
                String name51;
                String name52;
                String name53;
                String name54;
                String name55;
                String name56;
                String name57;
                String name58;
                String name59;
                String name60;
                String name61;
                String name62;
                String name63;
                String name64;
                String name65;
                String name66;
                String name67;
                String name68;
                String name69;
                String name70;
                String name71;
                String name72;
                String name73;
                String name74;
                String name75;
                String name76;
                String name77;
                String name78;
                String name79;
                String name80;
                String name81;
                String name82;
                String name83;
                String name84;
                String name85;
                String name86;
                String name87;
                String name88;
                String name89;
                String name90;
                String name91;
                String name92;
                String name93;


                string path = Path.GetFileName(fduploadpayments.FileName);
                path = path.Replace(" ", "");
                fduploadpayments.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source ='" + ExcelPath + "'; Extended Properties=Excel 12.0");
                mycon.Open();

                OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
                OleDbDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    name1 = dr[0].ToString();
                    name2 = dr[1].ToString();
                    name3 = dr[2].ToString();
                    name4 = dr[3].ToString();
                    name5 = dr[4].ToString();
                    name6 = dr[5].ToString();
                    name7 = dr[6].ToString();
                    name8 = dr[7].ToString();
                    name9 = dr[8].ToString();
                    name10 = dr[9].ToString();
                    name11 = dr[10].ToString();
                    name12 = dr[11].ToString();
                    name13 = dr[12].ToString();
                    name14 = dr[13].ToString();
                    name15 = dr[14].ToString();
                    name16 = dr[15].ToString();
                    name17 = dr[16].ToString();
                    name18 = dr[17].ToString();
                    name19 = dr[18].ToString();
                    name20 = dr[19].ToString();
                    name21 = dr[20].ToString();
                    name22 = dr[21].ToString();
                    name23 = dr[22].ToString();
                    name24 = dr[23].ToString();
                    name25 = dr[24].ToString();
                    name26 = dr[25].ToString();
                    name27 = dr[26].ToString();
                    name28 = dr[27].ToString();
                    name29 = dr[28].ToString();
                    name30 = dr[29].ToString();
                    name31 = dr[30].ToString();
                    name32 = dr[31].ToString();
                    name33 = dr[32].ToString();
                    name34 = dr[33].ToString();
                    name35 = dr[34].ToString();
                    name36 = dr[35].ToString();
                    name37 = dr[36].ToString();
                    name38 = dr[37].ToString();
                    name39 = dr[38].ToString();
                    name40 = dr[39].ToString();
                    name41 = dr[40].ToString();
                    name42 = dr[41].ToString();
                    name43 = dr[42].ToString();
                    name44 = dr[43].ToString();
                    name45 = dr[44].ToString();
                    name46 = dr[45].ToString();
                    name47 = dr[46].ToString();
                    name48 = dr[47].ToString();
                    name49 = dr[48].ToString();
                    name50 = dr[49].ToString();
                    name51 = dr[50].ToString();
                    name52 = dr[51].ToString();
                    name53 = dr[52].ToString();
                    name54 = dr[53].ToString();
                    name55 = dr[54].ToString();
                    name56 = dr[55].ToString();
                    name57 = dr[56].ToString();
                    name58 = dr[57].ToString();
                    name59 = dr[58].ToString();
                    name60 = dr[59].ToString();
                    name61 = dr[60].ToString();
                    name62 = dr[61].ToString();
                    name63 = dr[62].ToString();
                    name64 = dr[63].ToString();
                    name65 = dr[64].ToString();
                    name66 = dr[65].ToString();
                    name67 = dr[66].ToString();
                    name68 = dr[67].ToString();
                    name69 = dr[68].ToString();
                    name70 = dr[69].ToString();
                    name71 = dr[70].ToString();
                    name72 = dr[71].ToString();
                    name73 = dr[72].ToString();
                    name74 = dr[73].ToString();
                    name75 = dr[74].ToString();
                    name76 = dr[75].ToString();
                    name77 = dr[76].ToString();
                    name78 = dr[77].ToString();
                    name79 = dr[78].ToString();
                    name80 = dr[79].ToString();
                    name81 = dr[80].ToString();
                    name82 = dr[81].ToString();
                    name83 = dr[82].ToString();
                    name84 = dr[83].ToString();
                    name85 = dr[84].ToString();
                    name86 = dr[85].ToString();
                    name87 = dr[86].ToString();
                    name88 = dr[87].ToString();
                    name89 = dr[88].ToString();
                    name90 = dr[89].ToString();
                    name91 = dr[90].ToString();
                    name92 = dr[91].ToString();
                    name93 = dr[92].ToString();
                    savedata(name1, name2, name3, name4, name5, name6, name7, name8, name9, name10, name11, name12, name13, name14, name15, name16, name17, name18, name19, name20, name21, name22, name23, name24, name25, name26, name27, name28, name29, name30, name31, name32, name33, name34, name35, name36, name37, name38, name39, name40, name41, name42, name43, name44, name45, name46, name47, name48, name49, name50, name51, name52, name53, name54, name55, name56, name57, name58, name59, name60, name61, name62, name63, name64, name65, name66, name67, name68, name69, name70, name71, name72, name73, name74, name75, name76, name77, name78, name79, name80, name81, name82, name83, name84, name85, name86, name87, name88, name89, name90, name91, name92, name93);
                }


                mycon.Close();
                dr.Close();

            }
        }

        private void savedata(String a1, String a2, String a3, String a4, String a5, String a6, String a7, String a8, String a9, String a10, String a11, String a12, String a13, String a14, String a15, String a16, String a17, String a18, String a19, String a20, String a21, String a22, String a23, String a24, String a25, String a26, String a27, String a28, String a29, String a30, String a31, String a32, String a33, String a34, String a35, String a36, String a37, String a38, String a39, String a40, String a41, String a42, String a43, String a44, String a45, String a46, String a47, String a48, String a49, String a50, String a51, String a52, String a53, String a54, String a55, String a56, String a57, String a58, String a59, String a60, String a61, String a62, String a63, String a64, String a65, String a66, String a67, String a68, String a69, String a70, String a71, String a72, String a73, String a74, String a75, String a76, String a77, String a78, String a79, String a80, String a81, String a82, String a83, String a84, String a85, String a86, String a87, String a88, String a89, String a90, String a91, String a92, String a93)
        {

            //Label lblProductid = (Label)gd.FindControl("lblProductid");
            //Label lblname = (Label)gd.FindControl("lblname");

            //SqlCommand com = new SqlCommand("PaymentsProc", conn);
            //com.CommandType = CommandType.StoredProcedure;
            //com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            //com.Parameters.AddWithValue("@mode", 12);
            //SqlDataAdapter adp = new SqlDataAdapter(com);
            //DataTable ds = new DataTable();
            //adp.Fill(ds);
            //if (ds.Rows.Count > 0)
            //{
            //    if (TextBox3.Text == ds.Rows[0]["PaymentNo"].ToString())
            //    {
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Payment No Already inserted please check then upload.');", true);
            //        return;
            //    }
            //    else
            //    { 
            SqlCommand cmd = new SqlCommand("PaymentsProc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 1);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            cmd.Parameters.AddWithValue("@PaymentNo", TextBox3.Text);
            cmd.Parameters.AddWithValue("@GSTIN", a1);
            cmd.Parameters.AddWithValue("@UploadPaymentDate", txtdate.Text);
            cmd.Parameters.AddWithValue("@Name_of_Seller", a2);
            cmd.Parameters.AddWithValue("@seller_ID", a3);
            cmd.Parameters.AddWithValue("@Invoice_Number", a4);
            cmd.Parameters.AddWithValue("@Invoice_Date", a5);
            cmd.Parameters.AddWithValue("@Transaction_Type", a6);
            cmd.Parameters.AddWithValue("@Order_ID", a7);
            cmd.Parameters.AddWithValue("@Shipment_Id", a8);
            cmd.Parameters.AddWithValue("@Delivery_Date", a9);
            cmd.Parameters.AddWithValue("@Order_Date", a10);
            cmd.Parameters.AddWithValue("@Shipment_Item_Id", a11);
            cmd.Parameters.AddWithValue("@Quantity", a12);
            cmd.Parameters.AddWithValue("@Item_Description", a13);
            cmd.Parameters.AddWithValue("@Hsn_sac", a14);
            cmd.Parameters.AddWithValue("@CF_Sku", a15);
            cmd.Parameters.AddWithValue("@Bill_From_City", a16);
            cmd.Parameters.AddWithValue("@Bill_From_State", a17);
            cmd.Parameters.AddWithValue("@Bill_From_Country", a18);
            cmd.Parameters.AddWithValue("@Bill_From_Postal_Code", a19);
            cmd.Parameters.AddWithValue("@Ship_From_City", a20);
            cmd.Parameters.AddWithValue("@Ship_From_State", a21);
            cmd.Parameters.AddWithValue("@Ship_From_Country", a22);
            cmd.Parameters.AddWithValue("@Ship_From_Postal_Code", a23);
            cmd.Parameters.AddWithValue("@Ship_To_City", a24);
            cmd.Parameters.AddWithValue("@Ship_To_State", a25);
            cmd.Parameters.AddWithValue("@Ship_To_Country", a26);
            cmd.Parameters.AddWithValue("@Ship_To_Postal_Code", a27);
            cmd.Parameters.AddWithValue("@Invoice_Amount", a28);
            cmd.Parameters.AddWithValue("@Tax_Exclusive_Gross", a29);
            cmd.Parameters.AddWithValue("@Total_Tax_Amount", a30);
            cmd.Parameters.AddWithValue("@Cgst_Rate", a31);
            cmd.Parameters.AddWithValue("@Sgst_Rate", a32);
            cmd.Parameters.AddWithValue("@Utgst_Rate", a33);
            cmd.Parameters.AddWithValue("@Igst_Rate", a34);
            cmd.Parameters.AddWithValue("@Cgst_Tax", a35);
            cmd.Parameters.AddWithValue("@Sgst_Tax", a36);
            cmd.Parameters.AddWithValue("@Utgst_Tax", a37);
            cmd.Parameters.AddWithValue("@Igst_Tax", a38);
            cmd.Parameters.AddWithValue("@Order_Deadweight", a39);
            cmd.Parameters.AddWithValue("@Weight_Factor", a40);
            cmd.Parameters.AddWithValue("@Order_Chargeable_Weight", a41);
            cmd.Parameters.AddWithValue("@Used_Default_Weight", a42);
            cmd.Parameters.AddWithValue("@Used_co_LM", a43);
            cmd.Parameters.AddWithValue("@Shipping_Amount", a44);
            cmd.Parameters.AddWithValue("@Shipping_Amount_Basis", a45);
            cmd.Parameters.AddWithValue("@Shipping_Cgst_Tax", a46);
            cmd.Parameters.AddWithValue("@Shipping_Sgst_Tax", a47);
            cmd.Parameters.AddWithValue("@Shipping_Utgst_Tax", a48);
            cmd.Parameters.AddWithValue("@Shipping_Igst_Tax", a49);
            cmd.Parameters.AddWithValue("@Commission_Amount", a50);
            cmd.Parameters.AddWithValue("@Commission_Amount_Basis", a51);
            cmd.Parameters.AddWithValue("@Commission_Rate", a52);
            cmd.Parameters.AddWithValue("@Commission_Cgst_Tax", a53);
            cmd.Parameters.AddWithValue("@Commission_Sgst_Tax", a54);
            cmd.Parameters.AddWithValue("@Commission_Utgst_Tax", a55);
            cmd.Parameters.AddWithValue("@Commission_Igst_Tax", a56);
            cmd.Parameters.AddWithValue("@Payment_Gateway_Fees_Amount", a57);
            cmd.Parameters.AddWithValue("@PG_Fees_Basis", a58);
            cmd.Parameters.AddWithValue("@PG_Fees_Rate", a59);
            cmd.Parameters.AddWithValue("@PG_Fees_Cgst_Tax", a60);
            cmd.Parameters.AddWithValue("@PG_Fees_Sgst_Tax", a61);
            cmd.Parameters.AddWithValue("@PG_Fees_Utgst_Tax", a62);
            cmd.Parameters.AddWithValue("@PG_Fees_Igst_Tax", a63);
            cmd.Parameters.AddWithValue("@COD_Amount", a64);
            cmd.Parameters.AddWithValue("@COD_Basis", a65);
            cmd.Parameters.AddWithValue("@COD_Cgst_Tax", a66);
            cmd.Parameters.AddWithValue("@COD_Sgst_Tax", a67);
            cmd.Parameters.AddWithValue("@COD_Utgst_Tax", a68);
            cmd.Parameters.AddWithValue("@COD_Igst_Tax", a69);
            cmd.Parameters.AddWithValue("@Fulfillment_Fee", a70);
            cmd.Parameters.AddWithValue("@FulFillment_Basis", a71);
            cmd.Parameters.AddWithValue("@FulFillment_Cgst_Tax", a72);
            cmd.Parameters.AddWithValue("@FulFillment_Sgst_Tax", a73);
            cmd.Parameters.AddWithValue("@FulFillment_Utgst_Tax", a74);
            cmd.Parameters.AddWithValue("@FulFillment_Igst_Tax", a75);
            cmd.Parameters.AddWithValue("@Other_Adjustments_Penalties", a76);
            cmd.Parameters.AddWithValue("@Net_Order_Value_payable_to_Seller", String.Format("{0:0.00}", a77));
            cmd.Parameters.AddWithValue("@Tcs_Cgst_Rate", a78);
            cmd.Parameters.AddWithValue("@Tcs_Cgst_Tax", a79);
            cmd.Parameters.AddWithValue("@Tcs_Sgst_Rate", a80);
            cmd.Parameters.AddWithValue("@Tcs_Sgst_Tax", a81);
            cmd.Parameters.AddWithValue("@Tcs_Utgst_Rate", a82);
            cmd.Parameters.AddWithValue("@Tcs_Utgst_Tax", a83);
            cmd.Parameters.AddWithValue("@Tcs_Igst_Rate", a84);
            cmd.Parameters.AddWithValue("@Tcs_Igst_Tax", a85);
            cmd.Parameters.AddWithValue("@Total_TCS", a86);
            cmd.Parameters.AddWithValue("@Payment_Date", a87);
            cmd.Parameters.AddWithValue("@Final_Amount_Payable_to_seller", String.Format("{0:0.00}", a88));
            cmd.Parameters.AddWithValue("@Fulfillment_Channel", a89);
            cmd.Parameters.AddWithValue("@Payment_Method_Code", a90);
            cmd.Parameters.AddWithValue("@Refund_Reason", a91);
            cmd.Parameters.AddWithValue("@Refund_Status", a92);
            cmd.Parameters.AddWithValue("@Refund_Date", a93);
            SqlDataAdapter adp1 = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            adp1.Fill(dt1);
            lblmsg.Visible = true;
            //Response.Write("<script>alert('Payments Uploded')</script>");
            //    }
            //}
            //else
            //{
            //    SqlCommand cmd = new SqlCommand("PaymentsProc", conn);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@mode", 1);
            //    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            //    cmd.Parameters.AddWithValue("@PaymentNo", TextBox3.Text);
            //    cmd.Parameters.AddWithValue("@GSTIN", a1);
            //    cmd.Parameters.AddWithValue("@UploadPaymentDate", txtdate.Text);
            //    cmd.Parameters.AddWithValue("@Name_of_Seller", a2);
            //    cmd.Parameters.AddWithValue("@seller_ID", a3);
            //    cmd.Parameters.AddWithValue("@Invoice_Number", a4);
            //    cmd.Parameters.AddWithValue("@Invoice_Date", a5);
            //    cmd.Parameters.AddWithValue("@Transaction_Type", a6);
            //    cmd.Parameters.AddWithValue("@Order_ID", a7);
            //    cmd.Parameters.AddWithValue("@Shipment_Id", a8);
            //    cmd.Parameters.AddWithValue("@Delivery_Date", a9);
            //    cmd.Parameters.AddWithValue("@Order_Date", a10);
            //    cmd.Parameters.AddWithValue("@Shipment_Item_Id", a11);
            //    cmd.Parameters.AddWithValue("@Quantity", a12);
            //    cmd.Parameters.AddWithValue("@Item_Description", a13);
            //    cmd.Parameters.AddWithValue("@Hsn_sac", a14);
            //    cmd.Parameters.AddWithValue("@CF_Sku", a15);
            //    cmd.Parameters.AddWithValue("@Bill_From_City", a16);
            //    cmd.Parameters.AddWithValue("@Bill_From_State", a17);
            //    cmd.Parameters.AddWithValue("@Bill_From_Country", a18);
            //    cmd.Parameters.AddWithValue("@Bill_From_Postal_Code", a19);
            //    cmd.Parameters.AddWithValue("@Ship_From_City", a20);
            //    cmd.Parameters.AddWithValue("@Ship_From_State", a21);
            //    cmd.Parameters.AddWithValue("@Ship_From_Country", a22);
            //    cmd.Parameters.AddWithValue("@Ship_From_Postal_Code", a23);
            //    cmd.Parameters.AddWithValue("@Ship_To_City", a24);
            //    cmd.Parameters.AddWithValue("@Ship_To_State", a25);
            //    cmd.Parameters.AddWithValue("@Ship_To_Country", a26);
            //    cmd.Parameters.AddWithValue("@Ship_To_Postal_Code", a27);
            //    cmd.Parameters.AddWithValue("@Invoice_Amount", a28);
            //    cmd.Parameters.AddWithValue("@Tax_Exclusive_Gross", a29);
            //    cmd.Parameters.AddWithValue("@Total_Tax_Amount", a30);
            //    cmd.Parameters.AddWithValue("@Cgst_Rate", a31);
            //    cmd.Parameters.AddWithValue("@Sgst_Rate", a32);
            //    cmd.Parameters.AddWithValue("@Utgst_Rate", a33);
            //    cmd.Parameters.AddWithValue("@Igst_Rate", a34);
            //    cmd.Parameters.AddWithValue("@Cgst_Tax", a35);
            //    cmd.Parameters.AddWithValue("@Sgst_Tax", a36);
            //    cmd.Parameters.AddWithValue("@Utgst_Tax", a37);
            //    cmd.Parameters.AddWithValue("@Igst_Tax", a38);
            //    cmd.Parameters.AddWithValue("@Order_Deadweight", a39);
            //    cmd.Parameters.AddWithValue("@Weight_Factor", a40);
            //    cmd.Parameters.AddWithValue("@Order_Chargeable_Weight", a41);
            //    cmd.Parameters.AddWithValue("@Used_Default_Weight", a42);
            //    cmd.Parameters.AddWithValue("@Used_co_LM", a43);
            //    cmd.Parameters.AddWithValue("@Shipping_Amount", a44);
            //    cmd.Parameters.AddWithValue("@Shipping_Amount_Basis", a45);
            //    cmd.Parameters.AddWithValue("@Shipping_Cgst_Tax", a46);
            //    cmd.Parameters.AddWithValue("@Shipping_Sgst_Tax", a47);
            //    cmd.Parameters.AddWithValue("@Shipping_Utgst_Tax", a48);
            //    cmd.Parameters.AddWithValue("@Shipping_Igst_Tax", a49);
            //    cmd.Parameters.AddWithValue("@Commission_Amount", a50);
            //    cmd.Parameters.AddWithValue("@Commission_Amount_Basis", a51);
            //    cmd.Parameters.AddWithValue("@Commission_Rate", a52);
            //    cmd.Parameters.AddWithValue("@Commission_Cgst_Tax", a53);
            //    cmd.Parameters.AddWithValue("@Commission_Sgst_Tax", a54);
            //    cmd.Parameters.AddWithValue("@Commission_Utgst_Tax", a55);
            //    cmd.Parameters.AddWithValue("@Commission_Igst_Tax", a56);
            //    cmd.Parameters.AddWithValue("@Payment_Gateway_Fees_Amount", a57);
            //    cmd.Parameters.AddWithValue("@PG_Fees_Basis", a58);
            //    cmd.Parameters.AddWithValue("@PG_Fees_Rate", a59);
            //    cmd.Parameters.AddWithValue("@PG_Fees_Cgst_Tax", a60);
            //    cmd.Parameters.AddWithValue("@PG_Fees_Sgst_Tax", a61);
            //    cmd.Parameters.AddWithValue("@PG_Fees_Utgst_Tax", a62);
            //    cmd.Parameters.AddWithValue("@PG_Fees_Igst_Tax", a63);
            //    cmd.Parameters.AddWithValue("@COD_Amount", a64);
            //    cmd.Parameters.AddWithValue("@COD_Basis", a65);
            //    cmd.Parameters.AddWithValue("@COD_Cgst_Tax", a66);
            //    cmd.Parameters.AddWithValue("@COD_Sgst_Tax", a67);
            //    cmd.Parameters.AddWithValue("@COD_Utgst_Tax", a68);
            //    cmd.Parameters.AddWithValue("@COD_Igst_Tax", a69);
            //    cmd.Parameters.AddWithValue("@Fulfillment_Fee", a70);
            //    cmd.Parameters.AddWithValue("@FulFillment_Basis", a71);
            //    cmd.Parameters.AddWithValue("@FulFillment_Cgst_Tax", a72);
            //    cmd.Parameters.AddWithValue("@FulFillment_Sgst_Tax", a73);
            //    cmd.Parameters.AddWithValue("@FulFillment_Utgst_Tax", a74);
            //    cmd.Parameters.AddWithValue("@FulFillment_Igst_Tax", a75);
            //    cmd.Parameters.AddWithValue("@Other_Adjustments_Penalties", a76);
            //    cmd.Parameters.AddWithValue("@Net_Order_Value_payable_to_Seller", String.Format("{0:0.00}", a77));
            //    cmd.Parameters.AddWithValue("@Tcs_Cgst_Rate", a78);
            //    cmd.Parameters.AddWithValue("@Tcs_Cgst_Tax", a79);
            //    cmd.Parameters.AddWithValue("@Tcs_Sgst_Rate", a80);
            //    cmd.Parameters.AddWithValue("@Tcs_Sgst_Tax", a81);
            //    cmd.Parameters.AddWithValue("@Tcs_Utgst_Rate", a82);
            //    cmd.Parameters.AddWithValue("@Tcs_Utgst_Tax", a83);
            //    cmd.Parameters.AddWithValue("@Tcs_Igst_Rate", a84);
            //    cmd.Parameters.AddWithValue("@Tcs_Igst_Tax", a85);
            //    cmd.Parameters.AddWithValue("@Total_TCS", a86);
            //    cmd.Parameters.AddWithValue("@Payment_Date", a87);
            //    cmd.Parameters.AddWithValue("@Final_Amount_Payable_to_seller", String.Format("{0:0.00}", a88));
            //    cmd.Parameters.AddWithValue("@Fulfillment_Channel", a89);
            //    cmd.Parameters.AddWithValue("@Payment_Method_Code", a90);
            //    cmd.Parameters.AddWithValue("@Refund_Reason", a91);
            //    cmd.Parameters.AddWithValue("@Refund_Status", a92);
            //    cmd.Parameters.AddWithValue("@Refund_Date", a93);
            //    SqlDataAdapter adp1 = new SqlDataAdapter(cmd);
            //    DataTable dt1 = new DataTable();
            //    adp1.Fill(dt1);
            //    lblmsg.Visible = true;
        }


        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand com = new SqlCommand("PaymentsProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            // com.Parameters.AddWithValue("@PaymentNo", TextBox3.Text);
            com.Parameters.AddWithValue("@UserID", Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 12);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                if (TextBox3.Text == dr["PaymentNo"].ToString())
                {
                    Response.Write("<script>alert('Payment No. Already exits')</script>");
                    return;
                }
                else
                {

                }
            }
            conn.Close();
            dr.Close();
        }
    }

}