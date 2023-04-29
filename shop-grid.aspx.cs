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
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            if (!this.IsPostBack)
            {
                this.getListView();
            }
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
            SqlDataAdapter sda4 = new SqlDataAdapter("SELECT TOP 3id,discount,img,SUBSTRING(title, 1, 20) AS ntitle FROM BOOKS ORDER BY NEWID()", cn);
            DataTable dt4 = new DataTable();
            sda4.Fill(dt4);
            Repeater4.DataSource = dt4;
            Repeater4.DataBind();
            SqlDataAdapter sda5 = new SqlDataAdapter("SELECT TOP 3id,discount,img,SUBSTRING(title, 1, 20) AS ntitle FROM BOOKS ORDER BY NEWID()", cn);
            DataTable dt5 = new DataTable();
            sda5.Fill(dt5);
            Repeater5.DataSource = dt5;
            Repeater5.DataBind();
            cn.Close();
        }
        private void getListView()
        {
            cn.Open();
            if (Request.QueryString["search"] != null)
            {
                string search = Request.QueryString["search"];
                SqlDataAdapter sda = new SqlDataAdapter("select id,price,img,SUBSTRING(title, 1, 20) AS ntitle from books where title LIKE '%"+search+"%'", cn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            else if (Request.QueryString["cat"] != null)
            {
                string cat = Request.QueryString["cat"];
                SqlDataAdapter sda = new SqlDataAdapter("select id,price,img,SUBSTRING(title, 1, 20) AS ntitle from books where CatName = '" + cat + "'", cn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            else
            {
                SqlDataAdapter sda = new SqlDataAdapter("select id,price,img,SUBSTRING(title, 1, 20) AS ntitle from books where sale = 0", cn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
            cn.Close();
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.getListView();
        }
    }
}