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
    public partial class RegLog : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True;MultipleActiveResultSets=true");
            if (Session["username"] == null)
            {
                if (Request.Form["login"] != null)
                {
                    string email = Request.Form["email"];
                    string password = Request.Form["pass"];
                    cn.Open();
                    SqlCommand cm = new SqlCommand("select * from accounts where email = '" + email + "' and password = '" + password + "' COLLATE Latin1_General_CS_AS", cn);
                    SqlDataReader sdr = cm.ExecuteReader();
                    sdr.Read();
                    if (sdr.HasRows == true)
                    {
                        Session["username"] = sdr["username"];
                        Session["user_id"] = sdr["Account_ID"];
                        Response.Redirect("default.aspx");
                    }
                    else
                    {
                        AExists2.Text = "Invalid Username or Email";
                        //Response.Write("<script>alert('Invalid Username or Email');</script>");
                        name.Text = semail.Text = spswd.Text = phone.Text = address.Text = null;
                    }
                    cn.Close();
                }
            }
            else {
                Response.Redirect("default.aspx");
            }
        }
        protected void Register(object sender, EventArgs e)
        {
            cn.Open();
            SqlCommand cm = new SqlCommand("select * from accounts where username = '" + name.Text + "' or email = '" + semail.Text + "'", cn);
            SqlDataReader sdr = cm.ExecuteReader();
            sdr.Read();
            if (sdr.HasRows == true)
            {
                AExists.Text = "This Username or Email Already Exists";
                //Response.Write("<script>alert('This Username or Email Already Exists');</script>");
            }
            else
            {
                string CurDate = DateTime.Now.ToString("yyyy-MM-dd");
                SqlCommand cm2 = new SqlCommand("insert into Accounts values ('" + name.Text + "','" + semail.Text + "','" + spswd.Text + "','" + phone.Text + "','" + address.Text + "','" + CurDate + "','');", cn);
                cm2.ExecuteNonQuery();
                name.Text = semail.Text = spswd.Text = phone.Text = address.Text = null;
                //SESSION REGQUIRED
                Response.Redirect("default.aspx");
                //SESSION REGQUIRED
            }
            cn.Close();
        }
    }
}