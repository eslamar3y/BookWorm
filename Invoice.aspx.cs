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
    public partial class Invoice : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Form["ctl00$body$PlaceOrder"] != null)
            {
                cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
                cn.Open();
                string firstname = Request.Form["ctl00$body$txt_firstname"];
                string lastname = Request.Form["ctl00$body$txt_lastname"];
                string country = Request.Form["ctl00$body$txt_country"];
                string city = Request.Form["ctl00$body$txt_city"];
                string address = Request.Form["ctl00$body$txt__street_address"];
                string email = Request.Form["ctl00$body$txt_mail"];
                string phone = Request.Form["ctl00$body$txt_phone"];
                string payment = Request.Form["ctl00$body$RadioButtonList1"];
                CLIENT.Text = firstname + " " + lastname;
                ADDRESS.Text = address;
                PHONE.Text = phone;
                string CurDate = DateTime.Now.ToString("yyyy-MM-dd");
                DATE.Text = CurDate;
                PAYMENT.Text = payment;
                string randomNumber = new Random().Next(0, 9999).ToString("D4");
                Invoice_Num.Text = randomNumber;
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Shopping_cart"];
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                thissubtotal.Text = grandtotal().ToString();
                if (Session["discount"] != null)
                {
                    thisdiscount.Text =Session["discount"].ToString();
                    thisgrandtotal.Text =Session["grandtotal"].ToString();
                }
                else
                {
                    thisdiscount.Text = "0";
                    thisgrandtotal.Text =Session["grandtotal"].ToString();
                }
                SqlCommand cm1 = new SqlCommand("insert into order_details values ("+Convert.ToInt32(Session["session_id"])+","+ Invoice_Num.Text + ",'Processing',"+ thisdiscount.Text + ","+ thisgrandtotal.Text + ",'"+ PAYMENT.Text + "',CURRENT_TIMESTAMP);", cn);
                cm1.ExecuteNonQuery();
                foreach (DataRow row in dt.Rows)
                {
                    string Cid = row["id"].ToString();
                    SqlCommand Dcount = new SqlCommand("Select count from books where id = '" + Cid + "';", cn);
                    int count = Convert.ToInt32(Dcount.ExecuteScalar().ToString());
                    count += 1;
                    SqlCommand cm = new SqlCommand("update books set count = '" + count + "' where id = '" + Cid + "'", cn);
                    cm.ExecuteNonQuery();
                }
                Session.Clear();
                Session.Abandon();
                cn.Close();
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