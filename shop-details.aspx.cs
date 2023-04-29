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
    public partial class shop_details : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] != null)
            {
                img.CssClass = "hidethis";
                cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
                string id = Request.QueryString["id"];
                cn.Open();
                SqlCommand Dcategory = new SqlCommand("Select CatName from books where id = '"+id+"';", cn);
                SqlCommand Ddescription = new SqlCommand("Select Description from books where id = '" + id + "';", cn);
                SqlCommand Dstatus = new SqlCommand("Select CASE When stock = 0 THEN 'Out of Stock' When stock <10 Then 'Almost' WHEN stock >0 THEN 'In Stock' ELSE stock end as status from books where id = '" + id + "';", cn);
                SqlCommand Dprice = new SqlCommand("Select price from books where id = '" + id + "';", cn);
                SqlCommand Ddiscount = new SqlCommand("Select discount from books where id = '" + id + "';", cn);
                SqlCommand Dtitle = new SqlCommand("Select title from books where id = '" + id + "';", cn);
                SqlCommand Dimg = new SqlCommand("Select img from books where id = '" + id + "';", cn);
                description.Text = Ddescription.ExecuteScalar().ToString();
                status.Text = Dstatus.ExecuteScalar().ToString();
                price.Text = "$";
                price.Text += Dprice.ExecuteScalar().ToString();
                discount.Text = "$";
                discount.Text += Ddiscount.ExecuteScalar().ToString();
                title.Text = Dtitle.ExecuteScalar().ToString();
                img.Text = "img/product/";
                img.Text += Dimg.ExecuteScalar().ToString();
                string category = Dcategory.ExecuteScalar().ToString();
                SqlDataAdapter sda = new SqlDataAdapter("Select top 4 sale,id,img,price,SUBSTRING(title, 1, 20) AS ntitle from books where CatName = '" + category + "' ORDER BY NEWID();", cn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                if (discount.Text == price.Text)
                {
                    container.CssClass = "hidethis";
                }
                if (Request.QueryString["add"] != null)
                {
                    if (Session["username"] != null)
                    {
                        if (Request.QueryString["out"] != null)
                        {
                            Session["out"] = Request.QueryString["out"];
                            string qty = Request.QueryString["add"];
                            Session["cur_id"] = id;
                            Session["cur_qty"] = qty;
                            Response.Redirect("shoping-cart.aspx?add=" + qty);
                        }
                        else {
                            string qty = Request.QueryString["add"];
                            Session["cur_id"] = id;
                            Session["cur_qty"] = qty;
                            Response.Redirect("shoping-cart.aspx?add=" + qty);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Login to add items to cart');</script>");
                        Response.Redirect("reglog.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("shop-grid.aspx");
            }
        }
    }
}