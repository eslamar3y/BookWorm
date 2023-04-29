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
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
            cn.Open();
            if (Request.Form["submit"] != null)
            {
                string cat = Request.Form["selCat"];
                string title = Request.Form["title"];
                string price = Request.Form["price"];
                string sale = Request.Form["sale"];
                string stock = Request.Form["stock"];
                string author = Request.Form["author"];
                string desc = Request.Form["description"];
                SqlCommand cm = new SqlCommand("insert into books (title, price, Description, author, CatName, Sale, stock, count) values('" + title + "', '" + price + "', '" + desc + "', '" + author + "', '" + cat + "', '" + sale + "', '" + stock + "', '0')", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin3.aspx");
            }
            if (Request.Form["editpls"] != null)
            {
                string cat2 = Request.Form["selCat2"];
                string title2 = Request.Form["title2"];
                string price2 = Request.Form["price2"];
                string sale2 = Request.Form["sale2"];
                string stock2 = Request.Form["stock2"];
                string author2 = Request.Form["author2"];
                string desc2 = Request.Form["description2"];
                SqlCommand cm = new SqlCommand("update books set description = '" + desc2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm.ExecuteNonQuery();
                SqlCommand cm2 = new SqlCommand("update books set stock = '" + stock2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm2.ExecuteNonQuery();
                SqlCommand cm3 = new SqlCommand("update books set price = '" + price2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm3.ExecuteNonQuery();
                SqlCommand cm4 = new SqlCommand("update books set sale = '" + sale2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm4.ExecuteNonQuery();
                SqlCommand cm5 = new SqlCommand("update books set title = '" + title2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm5.ExecuteNonQuery();
                SqlCommand cm6 = new SqlCommand("update books set author = '" + author2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm6.ExecuteNonQuery();
                SqlCommand cm7 = new SqlCommand("update books set CatName = '" + cat2 + "' where id = '" + Session["edit"].ToString() + "'", cn);
                cm7.ExecuteNonQuery();
                Session["edit"] = null;
                Response.Redirect("admin3.aspx");
            }
            if (Request.QueryString["remove"] != null)
            {
                string Rid = Request.QueryString["remove"].ToString();
                SqlCommand cm = new SqlCommand("delete from books where ID = '" + Rid + "'", cn);
                cm.ExecuteNonQuery();
                Response.Redirect("admin3.aspx");
            }
            if (Request.QueryString["edit"] != null)
            {
                string eid = Request.QueryString["edit"].ToString();
                //img too
                SqlCommand Dcategory = new SqlCommand("Select CatName from books where id = '" + eid + "';", cn);
                SqlCommand Ddescription = new SqlCommand("Select Description from books where id = '" + eid + "';", cn);
                SqlCommand Dstock = new SqlCommand("Select stock from books where id = '" + eid + "';", cn);
                SqlCommand Dprice = new SqlCommand("Select price from books where id = '" + eid + "';", cn);
                SqlCommand Dsale = new SqlCommand("Select sale from books where id = '" + eid + "';", cn);
                SqlCommand Dtitle = new SqlCommand("Select title from books where id = '" + eid + "';", cn);
                SqlCommand Dauthor = new SqlCommand("Select author from books where id = '" + eid + "';", cn);
                Edescription.Text = Ddescription.ExecuteScalar().ToString();
                Estock.Text = Dstock.ExecuteScalar().ToString();
                Eprice.Text = Dprice.ExecuteScalar().ToString();
                Esale.Text = Dsale.ExecuteScalar().ToString();
                Etitle.Text = Dtitle.ExecuteScalar().ToString();
                Eauthor.Text = Dauthor.ExecuteScalar().ToString();
                Ecat.Text = Dcategory.ExecuteScalar().ToString();
                Session["edit"] = eid;
            }
            if (Request.QueryString["sort"] != null)
            {
                string sort = Request.QueryString["sort"];
                if (sort == "ALL")
                {
                    SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName, count, Sale, stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, stock, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode from books; ", cn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else if (sort == "count")
                {
                    SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName, count, Sale, stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, stock, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode  from books ORDER by count DESC ; ", cn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else if (sort == "sale")
                {
                    SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName, count, Sale, stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, stock, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode  from books ORDER by sale DESC ; ", cn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else if (sort == "stock")
                {
                    SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName, count, Sale, stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode  from books ORDER by CAST(stock AS int) ASC ;  ", cn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else
                {
                    sort = "ALL";
                    SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName, count, Sale, stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, stock, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode from books; ", cn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
            else {
                SqlDataAdapter sda = new SqlDataAdapter("Select ID,title,CatName, count, Sale, stock, CASE When stock = 0 THEN 'Out of Stock' When stock < 10 Then 'Almost' WHEN stock > 0 THEN 'In Stock' ELSE stock end as status, stock, CASE When stock = 0 THEN 'red' When stock < 10 Then 'yellow' WHEN stock > 0 THEN 'green' ELSE stock end as CCode from books; ", cn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            SqlDataAdapter sda2 = new SqlDataAdapter("Select CatName from Category", cn);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();
            Repeater3.DataSource = dt2;
            Repeater3.DataBind();
            cn.Close();
        }
    }
}