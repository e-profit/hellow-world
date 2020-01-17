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
    public partial class AddreturnUpload : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack == false)
            {
                showdata();
            }
        }
        protected void lnkformate_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/xlsx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=ReturnFormate.xlsx");
            Response.TransmitFile(Server.MapPath("~/Formate/ReturnFormate/ReturnFormate.xlsx"));
            Response.End();

        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fduploadreturn.PostedFile.FileName);
            string extension = Path.GetExtension(filename);
            string contentType = fduploadreturn.PostedFile.ContentType;
            HttpPostedFile file = fduploadreturn.PostedFile;
            byte[] document = new byte[file.ContentLength];
            file.InputStream.Read(document, 0, file.ContentLength);

            if (extension != ".xlsx")
            {
                //  file is Invalid  
                Response.Write("<script>alert('This is Invalid File')</script>");
                return;
            }
            else
            {
                String a1;
                String a2;
                String a3;
                String a4;
                String a5;
                String a6;
                String a7;
                String a8;
                string path = Path.GetFileName(fduploadreturn.FileName);
                path = path.Replace(" ", "");
                fduploadreturn.SaveAs(Server.MapPath("~/ExcelFile/") + path);
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
                    savedata(a1, a2, a3, a4, a5, a6, a7, a8);

                }
                dr.Close();
                mycon.Close();
            }
        }
        private void savedata(String b1, String b2, String b3, String b4, String b5, String b6, String b7, String b8)
        {
            try
            {
                SqlCommand com = new SqlCommand("Return_Entry_Proc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Market_Place", b1);
                DateTime dateTime = DateTime.Parse(b2);
                string h = dateTime.ToString("dd/MM/yyyy");
                com.Parameters.AddWithValue("@Date", h);
                com.Parameters.AddWithValue("@Order_Id", b3);
                com.Parameters.AddWithValue("@Quantity", b4);
                com.Parameters.AddWithValue("@Product_Name", b5);
                com.Parameters.AddWithValue("@Open_Close", b6);
                com.Parameters.AddWithValue("@Sellable", b7);
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@Other_Product_Recevied_Detail", b8);
                com.Parameters.AddWithValue("@mode", 1);
                SqlDataAdapter adp = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Orders Successfully Uploaded.');", true);
                showdata();
            }
            catch (Exception ex)
            {
            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand com = new SqlCommand("Return_Entry_Proc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Market_Place", ddmarketplace.SelectedItem.Value.ToString());
                com.Parameters.AddWithValue("@Date", txtdate.Text);
                com.Parameters.AddWithValue("@Order_Id", txtorderid.Text);
                com.Parameters.AddWithValue("@Quantity", txtquantity.Text);
                com.Parameters.AddWithValue("@Product_Name", txtproductname.Text);
                com.Parameters.AddWithValue("@Open_Close", ddopen.SelectedItem.Value.ToString());
                com.Parameters.AddWithValue("@Sellable", ddsellable.SelectedItem.Value.ToString());
                com.Parameters.AddWithValue("@Other_Product_Recevied_Detail", txtdetail.Text);
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@mode", 1);
                int i = com.ExecuteNonQuery();
                if (i == 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data Saved');", true);
                    txtdate.Text = "";
                    txtorderid.Text = "";
                    txtproductname.Text = "";
                    txtdetail.Text = "";
                    showdata();
                }
                else
                {
                    if (i == -1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(' already exits please try again and Choose another .');", true);
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('some thing went wrong.');", true);

            }
        }

        public void showdata()
        {
            SqlCommand cmd = new SqlCommand("Return_Entry_Proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 3);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Label1.Text = ds.Tables[0].Rows[0][1].ToString();
                Label2.Text = ds.Tables[0].Rows[0][2].ToString();
                Label3.Text = ds.Tables[0].Rows[0][3].ToString();
                Label8.Text = ds.Tables[0].Rows[0][4].ToString();
                Label4.Text = ds.Tables[0].Rows[0][5].ToString();
                Label5.Text = ds.Tables[0].Rows[0][6].ToString();
                Label6.Text = ds.Tables[0].Rows[0][7].ToString();
                Label7.Text = ds.Tables[0].Rows[0][8].ToString();

            }

        }
    }
}