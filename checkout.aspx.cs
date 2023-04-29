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
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            if (Session["Shopping_cart"] != null && Session["username"] != null)
            {
                RadioButtonList1.Items.Add(new ListItem("Check Payment", "Check Payment"));
                RadioButtonList1.Items.Add(new ListItem("Paypal", "Paypal"));
                dt = (DataTable)Session["Shopping_cart"];
                if (dt.Rows.Count != 0)
                {
                    cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
                    cn.Open();
                    SqlCommand name = new SqlCommand("Select username from accounts where Account_id = '" + Session["user_id"].ToString() + "';", cn);
                    SqlCommand address = new SqlCommand("Select address from accounts where Account_id = '" + Session["user_id"].ToString() + "';", cn);
                    SqlCommand phone = new SqlCommand("Select phone from accounts where Account_id = '" + Session["user_id"].ToString() + "';", cn);
                    SqlCommand email = new SqlCommand("Select email from accounts where Account_id = '" + Session["user_id"].ToString() + "';", cn);
                    txt_firstname.Text = name.ExecuteScalar().ToString();
                    txt__street_address.Text = address.ExecuteScalar().ToString();
                    txt_phone.Text = phone.ExecuteScalar().ToString();
                    txt_mail.Text = email.ExecuteScalar().ToString();
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    thissubtotal.Text = "$";
                    thissubtotal.Text += grandtotal().ToString();
                    if (Session["discount"] != null)
                    {
                        thisdiscount.Text = "-$" + Session["discount"].ToString();
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    else
                    {
                        thisdiscount.Text = "-$0";
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    cn.Close();
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Shopping_cart"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }
    }
}