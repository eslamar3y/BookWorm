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
    public partial class admin5 : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select * from PromoCode", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            cn.Close();
            if (Request.Form["submit"] != null)
            {
                cn.Open();
                string promoCode = Request.Form["promo-code"];
                string addSale = Request.Form["add-sale"];
                SqlCommand cm = new SqlCommand("insert into PromoCode (PROMOCODE, SALE) values('" + promoCode + "', '" + addSale + "')", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin5.aspx");
                cn.Close();
            }
            if (Request.Form["submit2"] != null)
            {
                cn.Open();
                string id = Request.Form["id"];
                string sale = Request.Form["sale"];
                SqlCommand cm = new SqlCommand("update PromoCode set SALE = '" + sale + "' where PROMOCODE_ID = '" + id + "'", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin5.aspx");
                cn.Close();
            }
        }
    }
}