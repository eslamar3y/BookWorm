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
    public partial class admin4 : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select *,CASE When status = 'Processing' THEN 'yellow' When status = 'Delivered' Then 'green' WHEN status = 'Canceled' THEN 'red' ELSE status end as  CCode from order_details;", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (Request.Form["editstatus"] != null)
            {
                string id = Request.Form["id"];
                string status = Request.Form["status"];
                SqlCommand cm = new SqlCommand("update order_details set status = '" + status + "' where id = '" + id + "'", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin4.aspx");
            }
            cn.Close();
        }
    }
}