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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {






            }

        }

        protected void Btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrations.aspx");
        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand com1 = new SqlCommand("registrationProc", conn);
            com1.CommandType = CommandType.StoredProcedure;
            com1.Parameters.AddWithValue("@Emailid", txtemailid.Text);
            com1.Parameters.AddWithValue("@Password", txtpassword.Text);
            com1.Parameters.Add("@msg", SqlDbType.VarChar, 100);
            com1.Parameters["@msg"].Direction = ParameterDirection.Output;
            com1.Parameters.AddWithValue("@mode", 2);
            SqlDataReader dr = com1.ExecuteReader();
            while (dr.Read())
            {
                if (txtemailid.Text == dr["Emailid"].ToString() && txtpassword.Text == dr["Password"].ToString())
                {
                    Session["emailid"] = txtemailid.Text;
                    Session["UserID"] = dr["UserID"].ToString();
                    Session["Userrole"] = dr["Userrole"].ToString();
                    Session["UserName"] = dr["UserName"].ToString();
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('your emailid and password not match.');", true);
                }
                
            }
            conn.Close();
            dr.Close();
        }
    }
}