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
    public partial class admin3 : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=DESKTOP-IH30UIL\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName,stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, stock, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode from books; ", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            cn.Close();
        }
    }
}