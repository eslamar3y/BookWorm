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
    public partial class shop_grid : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.getListView();
            }
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlCommand command = new SqlCommand("SELECT COUNT(ID) FROM Books",cn);
            int value = (int)command.ExecuteScalar();
            string number = value.ToString();
            Label1.Text = number;
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM BOOKS WHERE Sale > 0", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            SqlDataAdapter sda2 = new SqlDataAdapter("SELECT DISTINCT * FROM Category ", cn);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();
            SqlDataAdapter sda3 = new SqlDataAdapter("SELECT DISTINCT * FROM Category ", cn);
            DataTable dt3 = new DataTable();
            sda2.Fill(dt3);
            Repeater3.DataSource = dt3;
            Repeater3.DataBind();
            cn.Close();
        }
        private void getListView()
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from books where sale = 0", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
            cn.Close();
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.getListView();
        }
    }
}