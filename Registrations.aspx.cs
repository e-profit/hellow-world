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
    public partial class Registrations : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand com1 = new SqlCommand("registrationProc", conn);
            com1.CommandType = CommandType.StoredProcedure;
            com1.Parameters.Add("@msg", SqlDbType.VarChar, 100);
            com1.Parameters["@msg"].Direction = ParameterDirection.Output;
            com1.Parameters.AddWithValue("@mode", 2);
            SqlDataReader dr = com1.ExecuteReader();
            if (dr.Read())
            {
                if (txtemail.Text == dr["Emailid"].ToString())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(' Email id Already Exits Please try again.');", true);
                }
                else
                {
                    SqlCommand com = new SqlCommand("registrationProc", conn);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@UserName", txtusername.Text);
                    com.Parameters.AddWithValue("@Emailid", txtemail.Text);
                    com.Parameters.AddWithValue("@Userrole", "A");
                    com.Parameters.AddWithValue("@Password", txtpassword.Text);
                    com.Parameters.Add("@msg", SqlDbType.VarChar, 100);
                    com.Parameters["@msg"].Direction = ParameterDirection.Output;
                    com.Parameters.AddWithValue("@mode", 1);
                    conn.Close();
                    conn.Open();
                    int i = com.ExecuteNonQuery();
                    conn.Close();
                    if (i == 1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration Successfully .');", true);
                        txtemail.Text = "";
                        txtpassword.Text = "";
                        txtusername.Text = "";
                    }
                    else
                    {
                        if (i == -1)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(' Email id Already Exits Please try again.');", true);
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Some thing worng please try again.');", true);
                        }
                    }

                    conn.Close();
                    dr.Close();

                }
            }
            else
            {
                if (txtusername.Text == "" && txtemail.Text == "" && txtpassword.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('please  fill all details.');", true);
                }
                else
                {
                    conn.Close();
                    dr.Close();
                    SqlCommand com2 = new SqlCommand("registrationProc", conn);
                    com2.CommandType = CommandType.StoredProcedure;
                    com2.Parameters.AddWithValue("@UserName", txtusername.Text);
                    com2.Parameters.AddWithValue("@Emailid", txtemail.Text);
                    com2.Parameters.AddWithValue("@Userrole", "A");
                    com2.Parameters.AddWithValue("@Password", txtpassword.Text);
                    com2.Parameters.Add("@msg", SqlDbType.VarChar, 100);
                    com2.Parameters["@msg"].Direction = ParameterDirection.Output;
                    com2.Parameters.AddWithValue("@mode", 1);
                    conn.Open();
                    com2.ExecuteNonQuery();
                    string status = com2.Parameters["@msg"].Value.ToString();
                    conn.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + status + "');", true);
                }
            }
        }
    }
}