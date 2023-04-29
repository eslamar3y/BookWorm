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
    public partial class M : System.Web.UI.MasterPage
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable shopping_cart = new DataTable();
            shopping_cart = (DataTable)Session["Shopping_Cart"];
            if (shopping_cart != null)
            {
                items.Text = shopping_cart.Rows.Count.ToString();
                totalthis.Text = "$" + Session["grandtotal"].ToString();
            }
            else
            {
                items.Text = "0";
                totalthis.Text = "$0";
            }
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT DISTINCT * FROM Category", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (Request.QueryString["logout"] != null)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("default.aspx");
            }
            if (Session["username"] != null)
            {
                Login.CssClass = "hidethis";
                Logout.CssClass = "showthis";
                username.CssClass = "showthis lextra";
                username.Text = Session["username"].ToString();
                login2.CssClass = "hidethis";
                logout2.CssClass = "showthis";
                username2.CssClass = "showthis lextra";
                username2.Text = Session["username"].ToString();
            }
            else
            {
                Login.CssClass = "showthis";
                Logout.CssClass = "hidethis";
                username.CssClass = "hidethis";
                login2.CssClass = "showthis";
                logout2.CssClass = "hidethis";
                username2.CssClass = "hidethis";
            }
            string email = Request.Form["email"];
            Response.Write(email);
            cn.Close();
        }

    }
}