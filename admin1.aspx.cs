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
    public partial class admin1 : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlCommand cm = new SqlCommand("select count(ID) from books", cn);
            int num = (int)cm.ExecuteScalar();
            Label1.Text = num.ToString();
            SqlCommand cm2 = new SqlCommand("select count(Account_ID) from Accounts where is_admin = 0", cn);
            int num2 = (int)cm2.ExecuteScalar();
            Label2.Text = num2.ToString();

            SqlDataAdapter sda = new SqlDataAdapter("Select top 7 Email, Password from Accounts order by DateOfCreation desc", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            SqlDataAdapter sda2 = new SqlDataAdapter("Select top 6 title, CatName, stock from books ", cn);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();
            cn.Close();
        }
    }
}