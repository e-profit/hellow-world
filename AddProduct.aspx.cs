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
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {

                conn.Close();

            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                conn.Open();
                SqlCommand com = new SqlCommand("ProductsProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Product_Name", txtProductName.Text);
                com.Parameters.AddWithValue("@ProductCost", int.Parse(txtCost.Text));
                com.Parameters.AddWithValue("@Product_Weight", int.Parse(txtweight.Text));
                com.Parameters.AddWithValue("@UserID",Session["UserID"]);
                com.Parameters.AddWithValue("@Status", "1");
                com.Parameters.AddWithValue("@mode", 1);
                int i =com.ExecuteNonQuery();
                if(i==1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Insert Product.');", true);
                    txtCost.Text = "";
                    txtProductName.Text = "";
                    txtweight.Text = "";
                }
                else
                {
                    if (i == -1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product name already exits please try again and Choose another name.');", true);
                    }
                   
                }
               
                conn.Close();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('some thing went wrong.');", true);

            }
            
          
        }

        protected void txtProductName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                    conn.Open();
                    SqlCommand com = new SqlCommand("ProductsProc", conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Product_Name", txtProductName.Text);
                    com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    com.Parameters.AddWithValue("@mode", 2);
                    SqlDataReader dr = com.ExecuteReader();
                    if (dr.Read())
                    {
                        if (txtProductName.Text == dr["Product_Name"].ToString())
                        {
                            Response.Write("<script>alert('Product Name Already exits')</script>");

                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Some thing went worng please try Again.');", true);
                        }
                        dr.Close();
                        conn.Close();
                    }
            }
            catch (Exception ex)
            {

                
            }
            
           
        }

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
                try
                {
                    String sname;
                    String fname;
                    String mname;
                    string path = Path.GetFileName(fduploadproduct.FileName);
                    path = path.Replace(" ", "");
                    fduploadproduct.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                    String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                    OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source ='" + ExcelPath + "'; Extended Properties=Excel 12.0");
                    mycon.Open();
                   
                    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);


                    OleDbDataReader dr = cmd.ExecuteReader();
                    
                    while (dr.Read())
                    {

                        sname = dr[0].ToString();
                        fname = dr[1].ToString();
                        mname = dr[2].ToString();
                        if (sname != "" && fname != "" && mname != "")
                        {
                            
                            savedata(sname, fname, mname);
                          
                        }
                        
                    }
                    Response.Write("<script>alert('Upload successfully')</script>");
                    mycon.Close();
                   
                    dr.Close();
                    

                }
                catch (Exception ex)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Some thing went worng please try Again.');", true);
                }
            }
        }
        private void savedata(String sname1, String fname1, String mname1)
        {
            try
            {
               


                SqlCommand com = new SqlCommand("ProductsProc", conn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Product_Name", sname1);
                com.Parameters.AddWithValue("@ProductCost", fname1);
                com.Parameters.AddWithValue("@Product_Weight", mname1);
                com.Parameters.AddWithValue("@Status", "1");
                com.Parameters.AddWithValue("@UserID", Session["UserID"]);
                com.Parameters.AddWithValue("@mode", 1);
                conn.Close();
                conn.Open();
                int i = com.ExecuteNonQuery();
                conn.Close();
                if (i == -1)
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product name already exits please try again and Choose another name.');", true);
                    txtCost.Text = "";
                    txtProductName.Text = "";
                    txtweight.Text = "";
                }
                
                   
                


            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Some thing went worng please try Again.');", true);

            }

        }

       
       

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.ContentType = "application/xlsx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=ProductFormate.xlsx");
            Response.TransmitFile(Server.MapPath("~/Formate/AddProduct/ProductFormate.xlsx"));
            Response.End();
        }
    }
}