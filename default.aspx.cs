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
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.getListView();
            }
        }
        private void getListView()
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select top 8* from books", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
            SqlDataAdapter sda2 = new SqlDataAdapter("select * from Category", cn);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            ListView2.DataSource = dt2;
            ListView2.DataBind();
            SqlDataAdapter sda3 = new SqlDataAdapter("select top 3 posttitle,postimg,postmessages,postcontent,SUBSTRING(CONVERT(varchar(250),postdate), 1, 11) as date from blog order by postDate", cn);
            DataTable dt3 = new DataTable();
            sda3.Fill(dt3);
            ListView3.DataSource = dt3;
            ListView3.DataBind();
            cn.Close();
        }
    }
}