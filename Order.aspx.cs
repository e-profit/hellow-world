using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class Order : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        String a1;
        String a2;
        String a3;
        String a4;
        String a5;
        String a6;
        String a7;
        String a8;
        String a9;
        String a10;
        String a11;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {



                if (Session["emailid"] != null)
                {
                   
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }



            }
        }
        protected void btnupload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fduploadorders.PostedFile.FileName);
            string extension = Path.GetExtension(filename);
            string contentType = fduploadorders.PostedFile.ContentType;
            HttpPostedFile file = fduploadorders.PostedFile;
            byte[] document = new byte[file.ContentLength];
            file.InputStream.Read(document, 0, file.ContentLength);

            if (extension != ".xlsx")
            {
                Response.Write("<script>alert('This is Invalid File')</script>");
                return;
            }
            else
            {

                string path = Path.GetFileName(fduploadorders.FileName);
                path = path.Replace(" ", "");
                fduploadorders.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source ='" + ExcelPath + "'; Extended Properties=Excel 12.0");
                mycon.Open();
                conn.Open();
                OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);


                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    a1 = dr[0].ToString();
                    a2 = dr[1].ToString();
                    a3 = dr[2].ToString();
                    a4 = dr[3].ToString();
                    a5 = dr[4].ToString();
                    a6 = dr[5].ToString();
                    a7 = dr[6].ToString();
                    a8 = dr[7].ToString();
                    a9 = dr[8].ToString();
                    a10 = dr[9].ToString();
                    a11 = dr[10].ToString();
                    savesku();
                    savedata(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);

                }
                dr.Close();
                mycon.Close();
                conn.Close();
            }
            // }
        }
        private void savedata(String b1, String b2, String b3, String b4, String b5, String b6, String b7, String b8, String b9, String b10, String b11)
        {
            

            try
            {
                conn.Close();
                conn.Open();
                SqlCommand com = new SqlCommand("OrdersProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Export_Date", Convert.ToDateTime(b1));
                com.Parameters.AddWithValue("@UserID",Session["UserID"]);
                com.Parameters.AddWithValue("@Payment_Method", b2);
                com.Parameters.AddWithValue("@Order_No", b3);
                com.Parameters.AddWithValue("@Seller_SKU", b4);
                com.Parameters.AddWithValue("@HSN_Code", b5);
                com.Parameters.AddWithValue("@Units",Convert.ToInt32(b6));
                com.Parameters.AddWithValue("@Product_No", b7);
                com.Parameters.AddWithValue("@Product_Name", b8);
                com.Parameters.AddWithValue("@Order_Origin_Amount", b9);
                com.Parameters.AddWithValue("@Order_Sales_Amount", b10);
                com.Parameters.AddWithValue("@Order_Payment_Amount", b11);
                com.Parameters.AddWithValue("@mode", 1);
                int i=com.ExecuteNonQuery();
                conn.Close();
                if (i == 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Orders Successfully Uploaded.');", true);
                }
                else
                {
                    if (i == -1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('some orders already exits please check then upload right data.');", true);
                    }
                }


            }
            catch (Exception ex)
            {


            }

        }

        
        public void savesku()
        {
            try
            {
               
               
                        SqlCommand com1 = new SqlCommand("ADDSKUProc", conn);
                        com1.CommandType = CommandType.StoredProcedure;
                        com1.Parameters.AddWithValue("@Name", a4.ToString());
                        com1.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        com1.Parameters.AddWithValue("@status", "1");
                        //com1.Parameters.AddWithValue("@MapedData", "0");
                        com1.Parameters.AddWithValue("@mode", 1);
                        SqlDataAdapter adp1 = new SqlDataAdapter(com1);
                        DataSet ds = new DataSet();
                        adp1.Fill(ds);
                  


            }

            catch (Exception ex)
            {

            }

        }
    }
}