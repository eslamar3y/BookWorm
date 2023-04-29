using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace back_end_project
{
    public partial class admin6 : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            if (Request.Form["submit"] != null)
            {
                cn.Open();
                string email = Request.Form["email"];
                SqlCommand cm = new SqlCommand("update Accounts set is_admin = '1' where Email = '" + email + "'", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin6.aspx");
                cn.Close();
            }
            if (Request.Form["submit2"] != null)
            {
                cn.Open();
                string email = Request.Form["email"];
                SqlCommand cm = new SqlCommand("update Accounts set is_admin = '0' where Email = '" + email + "'", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin6.aspx");
                cn.Close();
            }
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select Username, Email, Password, Phone, Address, SUBSTRING(CONVERT(varchar(250),DateOfCreation), 1, 11) as date from Accounts where is_admin = 1", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            cn.Close();
        }
    }
}