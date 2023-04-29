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
    public partial class adminM : System.Web.UI.MasterPage
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
                cn.Open();
                string isadmin = Session["username"].ToString();
                SqlCommand is_admin = new SqlCommand("Select is_admin from accounts where username = '" + isadmin + "';", cn);
                string admin = is_admin.ExecuteScalar().ToString();
                if (admin == "False")
                {
                    Response.Redirect("default.aspx");
                }
                adminName.Text = isadmin;
                cn.Close();
            }
            else
            {
                Response.Redirect("reglog.aspx");
            }
        }
    }
}