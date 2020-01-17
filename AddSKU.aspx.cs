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
    public partial class AddSKU : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {

                



            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand com = new SqlCommand("ADDSKUProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Name", txtSKUName.Text);

                com.Parameters.AddWithValue("@status", "1");
                com.Parameters.AddWithValue("@UserID",Session["UserID"]);
                com.Parameters.AddWithValue("@mode", 1);
                conn.Open();
                int i = com.ExecuteNonQuery();
                conn.Close();
                if (i == 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Insert SKU.');", true);
                    txtSKUName.Text = "";
                }
                else
                {
                    if (i == -1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('SKU name already exits please try again and Choose another name.');", true);
                    }
                }
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Some thing went wrong.');", true);
            }
        }

        protected void txtSKUName_TextChanged(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand com = new SqlCommand("ADDSKUProc", conn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Name", txtSKUName.Text);
            com.Parameters.AddWithValue("@UserID",Session["UserID"]);
            com.Parameters.AddWithValue("@mode", 2);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                if (txtSKUName.Text == dr["Name"].ToString())
                {
                    Response.Write("<script>alert('Name Already exits')</script>");
                }
                else
                {

                }
            }
            conn.Close();
            dr.Close();
        }

        //protected void lnkformate_Click(object sender, EventArgs e)
        //{
        //    Response.ContentType = "application/xlsx";
        //    Response.AppendHeader("Content-Disposition", "attachment; filename=SKUFormate.xlsx");
        //    Response.TransmitFile(Server.MapPath("~/Formate/SKUFormate/SKUFormate.xlsx"));
        //    Response.End();
        //}

        protected void btnupload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(fduploadproduct.PostedFile.FileName);
            string extension = Path.GetExtension(filename);
            string contentType = fduploadproduct.PostedFile.ContentType;
            HttpPostedFile file = fduploadproduct.PostedFile;
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

                String skuname;

                string path = Path.GetFileName(fduploadproduct.FileName);
                path = path.Replace(" ", "");
                fduploadproduct.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source ='" + ExcelPath + "'; Extended Properties=Excel 12.0");
                mycon.Open();
                conn.Open();
                OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    
                    skuname = dr[0].ToString();
                    // getrollno();
                    if (skuname != "")
                    {
                        savedata(skuname);
                    }

                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data Has Been Saved Successfully.');", true);


                mycon.Close();
                dr.Close();
                conn.Close();

            }

        }
        private void savedata(string skuname)
        {
            try
            {
                conn.Close();
                conn.Open();
                String query = "insert into ADDSKU(Name,status,UserID) values('" + skuname + "','" + "1" + "','" + Session["UserID"] + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {

              
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/xlsx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=SKUFormate.xlsx");
            Response.TransmitFile(Server.MapPath("~/Formate/SKUFormate/SKUFormate.xlsx"));
            Response.End();
        }
    }
}