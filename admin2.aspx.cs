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
    public partial class admin2 : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();

            if (Request.QueryString["remove"] != null)
            {
                string Rid = Request.QueryString["remove"].ToString();
                SqlCommand cm = new SqlCommand("delete from Accounts where Account_ID = '" + Rid + "'", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin2.aspx");
            }

            if (Request.QueryString["edit"] != null)
            {
                string eid = Request.QueryString["edit"].ToString();

                SqlCommand Demail = new SqlCommand("Select Email from Accounts where Account_ID = '" + eid + "';", cn);
                SqlCommand Dpass = new SqlCommand("Select Password from Accounts where Account_ID = '" + eid + "';", cn);
                C_id.Text = eid;
                Eemail.Text = Demail.ExecuteScalar().ToString();
                Epass.Text = Dpass.ExecuteScalar().ToString();
                Session["edit"] = eid;
            }

            if (Request.Form["btn_edit"] != null)
            {
                string email = Request.Form["email"];
                string password = Request.Form["password"];
                SqlCommand cm = new SqlCommand("update Accounts set Email = '" + email + "' where Account_ID = '" + Session["edit"].ToString() + "'", cn);
                cm.ExecuteNonQuery();
                SqlCommand cm2 = new SqlCommand("update Accounts set password = '" + password + "' where Account_ID = '" + Session["edit"].ToString() + "'", cn);
                cm2.ExecuteNonQuery();
                Session["edit"] = null;
                Response.Redirect("admin2.aspx");
            }

            SqlDataAdapter sda = new SqlDataAdapter("Select Account_ID,Username,Email,Password,Phone, Address, SUBSTRING(CONVERT(varchar(250),DateOfCreation), 1, 11) as date from Accounts where is_admin = 0 ", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            cn.Close();
        }
    }
}