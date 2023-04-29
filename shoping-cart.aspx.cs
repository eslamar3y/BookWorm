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
    public partial class shoping_cart : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                DataTable dt = new DataTable();
                cn = new SqlConnection(@"Data Source=SAMAR3Y\SQLEXPRESS;Initial Catalog=BookWorm;Integrated Security=True");
                if (Session["Shopping_cart"] == null && Request.QueryString["add"] == null)
                {

                }
                if (Session["Shopping_cart"] == null && Request.QueryString["add"] != null)
                {
                    cn.Open();
                    //SqlDataAdapter sda = new SqlDataAdapter("select * from books where id = '" + Session["cur_id"].ToString() + "'", cn);
                    SqlDataAdapter sda = new SqlDataAdapter("select id,img,price,discount,SUBSTRING(title, 1, 20) AS title from books where id = '" + Session["cur_id"].ToString() + "'", cn);
                    sda.Fill(dt);
                    DataColumn dtqty = new DataColumn();
                    dtqty.DataType = typeof(Int32);
                    dtqty.ColumnName = "quantity";
                    dt.Columns.Add(dtqty);
                    DataColumn dtsid = new DataColumn();
                    dtsid.DataType = typeof(Int32);
                    dtsid.ColumnName = "sid";
                    dt.Columns.Add(dtsid);
                    DataColumn dttotalprice = new DataColumn();
                    dttotalprice.DataType = typeof(Int32);
                    dttotalprice.ColumnName = "totalprice";
                    dt.Columns.Add(dttotalprice);
                    foreach (DataRow row in dt.Rows)
                    {
                        int price = Convert.ToInt32(row["discount"]);
                        row["quantity"] = Session["cur_qty"].ToString();
                        int qty = Convert.ToInt32(row["quantity"]);
                        row["totalprice"] = qty * price;
                        row["sid"] = 1;
                    }
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    Session["Shopping_cart"] = dt;
                    thistotal.Text = "$";
                    thistotal.Text += grandtotal().ToString();
                    Session["grandtotal"] = grandtotal();
                    if (Session["discount"] != null)
                    {
                        int sale = Convert.ToInt32(Session["sale"]);
                        int discount = sale * Convert.ToInt32(Session["grandtotal"]) / 100;
                        Session["discount"] = discount;
                        Session["grandtotal"] = Convert.ToInt32(Session["grandtotal"]) - Convert.ToInt32(Session["discount"]);
                        thisdiscount.Text = "-$" + Session["discount"].ToString();
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    else
                    {
                        thisdiscount.Text = "-$0";
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    
                    SqlCommand cm2 = new SqlCommand("insert into shopping_session values ('"+Convert.ToInt32(Session["user_id"]) +"',0,CURRENT_TIMESTAMP);", cn);
                    cm2.ExecuteNonQuery();
                    SqlCommand SSID = new SqlCommand("Select id from shopping_session where user_id = '" + Convert.ToInt32(Session["user_id"]) + "'order by created_at DESC;", cn);
                    Session["session_id"] = SSID.ExecuteScalar().ToString();
                    DataRow[] myrow = dt.Select("ID= "+ Session["cur_id"].ToString() + "");
                    var sqty = myrow[0]["quantity"].ToString();
                    var stp = myrow[0]["totalprice"].ToString();
                    SqlCommand cm3 = new SqlCommand("insert into cart_item values ('"+ Convert.ToInt32(Session["session_id"]) + "','"+ Session["cur_id"].ToString() + "','"+sqty+"','"+stp+"',CURRENT_TIMESTAMP);", cn);
                    cm3.ExecuteNonQuery();
                    SqlCommand cm4 = new SqlCommand("update shopping_session set total = "+ grandtotal() + " where id = "+ Convert.ToInt32(Session["session_id"]) + "", cn);
                    cm4.ExecuteNonQuery();
                    if (Session["out"] != null)
                    {
                        Session["out"] = null;
                        //Response.Redirect("shop-details.aspx?id=" + Session["cur_id"].ToString());
                        Response.Redirect("shop-grid.aspx");
                    }
                    else {
                        Response.Redirect("shop-details.aspx?id=" + Session["cur_id"].ToString());
                        //Response.Redirect("shoping-cart.aspx");
                    }
                    cn.Close();
                }
                if (Session["Shopping_cart"] != null && Request.QueryString["add"] == null)
                {
                    dt = (DataTable)Session["Shopping_cart"];
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    thistotal.Text = "$";
                    thistotal.Text += grandtotal().ToString();
                    Session["grandtotal"] = grandtotal();
                    if (Session["discount"] != null)
                    {
                        int sale = Convert.ToInt32(Session["sale"]);
                        int discount = sale * Convert.ToInt32(Session["grandtotal"]) / 100;
                        Session["discount"] = discount;
                        Session["grandtotal"] = Convert.ToInt32(Session["grandtotal"]) - Convert.ToInt32(Session["discount"]);
                        thisdiscount.Text = "-$" + Session["discount"].ToString();
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    else
                    {
                        thisdiscount.Text = "-$0";
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                }
                if (Session["Shopping_cart"] != null && Request.QueryString["add"] != null)
                {
                    cn.Open();
                    dt = (DataTable)Session["Shopping_cart"];
                    DataRow[] foundid = dt.Select("id = '" + Session["cur_id"].ToString() + "'");
                    if (foundid.Length != 0)
                    {
                        Session["new_qty"] = foundid[0]["quantity"].ToString();
                        int srl = Convert.ToInt32(foundid[0]["sid"].ToString());
                        for (int i = 0; i <= dt.Rows.Count - 1; i++)
                        {
                            int numt;
                            numt = Convert.ToInt32(dt.Rows[i]["sid"].ToString());
                            if (numt == srl)
                            {
                                dt.Rows[i].Delete();
                                dt.AcceptChanges();
                                break;
                            }
                        }
                        for (int i = 1; i <= dt.Rows.Count; i++)
                        {
                            dt.Rows[i - 1]["sid"] = i;
                            dt.AcceptChanges();
                        }
                        Session["Shopping_cart"] = dt;
                    }
                    DataRow dr;
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    
                    //SqlDataAdapter sda = new SqlDataAdapter("select * from books where id = '" + Session["cur_id"].ToString() + "'", cn);
                    SqlDataAdapter sda = new SqlDataAdapter("select id,img,price,discount,SUBSTRING(title, 1, 20) AS title from books where id = '" + Session["cur_id"].ToString() + "'", cn);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    dr["sid"] = sr + 1;
                    dr["id"] = ds.Tables[0].Rows[0]["id"].ToString();
                    dr["title"] = ds.Tables[0].Rows[0]["title"].ToString();
                    dr["img"] = ds.Tables[0].Rows[0]["img"].ToString();
                    
                    if (Session["new_qty"] != null)
                    {
                        int cur_qty = Convert.ToInt32(Session["cur_qty"].ToString());
                        int new_qty = Convert.ToInt32(Session["new_qty"].ToString()) + cur_qty;
                        dr["quantity"] = new_qty;
                        
                    }
                    else {
                        dr["quantity"] = Session["cur_qty"].ToString();
                    }
                    dr["discount"] = ds.Tables[0].Rows[0]["discount"].ToString();
                    int qty = Convert.ToInt32(dr["quantity"]);
                    int price = Convert.ToInt32(dr["discount"]);
                    int totalprice = price * qty;
                    dr["totalprice"] = totalprice;
                    dt.Rows.Add(dr);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                    Session["Shopping_cart"] = dt;
                    thistotal.Text = "$";
                    thistotal.Text += grandtotal().ToString();
                    Session["grandtotal"] = grandtotal();
                    if (Session["discount"] != null)
                    {
                        int sale = Convert.ToInt32(Session["sale"]);
                        int discount = sale * Convert.ToInt32(Session["grandtotal"]) / 100;
                        Session["discount"] = discount;
                        Session["grandtotal"] = Convert.ToInt32(Session["grandtotal"]) - Convert.ToInt32(Session["discount"]);
                        thisdiscount.Text = "-$" + Session["discount"].ToString();
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    else
                    {
                        thisdiscount.Text = "-$0";
                        thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                    }
                    SqlCommand SSID = new SqlCommand("Select id from shopping_session where user_id = '" + Convert.ToInt32(Session["user_id"]) + "'order by created_at DESC;", cn);
                    Session["session_id"] = SSID.ExecuteScalar().ToString();
                    DataRow[] myrow = dt.Select("ID= " + Session["cur_id"].ToString() + "");
                    var sqty = myrow[0]["quantity"].ToString();
                    var stp = myrow[0]["totalprice"].ToString();
                    SqlCommand TID = new SqlCommand("Select id from cart_item where product_id = '" + Session["cur_id"].ToString() + "';", cn);
                    object notnullpls = TID.ExecuteScalar();
                    if (notnullpls != null)
                    {
                        string removeitem = TID.ExecuteScalar().ToString();
                        SqlCommand cm5 = new SqlCommand("delete from cart_item where id = " + removeitem + "", cn);
                        cm5.ExecuteNonQuery();
                    }
                    else
                    {
                        //cry
                    }
                    SqlCommand cm3 = new SqlCommand("insert into cart_item values ('" + Convert.ToInt32(Session["session_id"]) + "','" + Session["cur_id"].ToString() + "','" + sqty + "','" + stp + "',CURRENT_TIMESTAMP);", cn);
                    cm3.ExecuteNonQuery();
                    SqlCommand cm4 = new SqlCommand("update shopping_session set total = " + grandtotal() + " where id = " + Convert.ToInt32(Session["session_id"]) + "", cn);
                    cm4.ExecuteNonQuery();
                    Session["new_qty"] = null;
                    if (Session["out"] != null)
                    {
                        Session["out"] = null;
                        //Response.Redirect("shop-details.aspx?id=" + Session["cur_id"].ToString());
                        Response.Redirect("shop-grid.aspx");
                    }
                    else
                    {
                        Response.Redirect("shop-details.aspx?id=" + Session["cur_id"].ToString());
                        //Response.Redirect("shoping-cart.aspx");
                    }
                    cn.Close();
                }
                if (Session["Shopping_cart"] != null && Request.QueryString["remove"] != null)
                {
                    cn.Open();
                    dt = (DataTable)Session["Shopping_cart"];
                    int srl = Convert.ToInt32(Request.QueryString["remove"].ToString());
                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        int sr;
                        sr = Convert.ToInt32(dt.Rows[i]["sid"].ToString());
                        if (sr == srl)
                        {
                            Session["Rpid"] = dt.Rows[i]["id"].ToString();
                            dt.Rows[i].Delete();
                            dt.AcceptChanges();
                            break;
                        }
                    }
                    for (int i = 1; i <= dt.Rows.Count; i++)
                    {
                        dt.Rows[i - 1]["sid"] = i;
                        dt.AcceptChanges();
                    }
                    Session["Shopping_cart"] = dt;
                    SqlCommand SSID = new SqlCommand("Select id from shopping_session where user_id = '" + Convert.ToInt32(Session["user_id"]) + "'order by created_at DESC;", cn);
                    Session["session_id"] = SSID.ExecuteScalar().ToString();
                    SqlCommand cm3 = new SqlCommand("delete from cart_item where session_id = "+ Convert.ToInt32(Session["session_id"]) + " and product_id = "+ Convert.ToInt32(Session["Rpid"]) +"", cn);
                    cm3.ExecuteNonQuery();
                    Session["Rpid"] = null;
                    SqlCommand cm4 = new SqlCommand("update shopping_session set total = " + grandtotal() + " where id = " + Convert.ToInt32(Session["session_id"]) + "", cn);
                    cm4.ExecuteNonQuery();
                    Response.Redirect("shoping-cart.aspx");
                    cn.Close();
                }
                if (Request.Form["promothis"] != null)
                {
                    string promocode = Request.Form["promocode"];
                    cn.Open();
                    SqlCommand cm = new SqlCommand("select * from PromoCode where promocode = '" + promocode + "'", cn);
                    SqlDataReader sdr = cm.ExecuteReader();
                    sdr.Read();
                    if (sdr.HasRows == true)
                    {
                        Session["promocode"] = sdr["promocode"];
                        Session["sale"] = sdr["sale"];
                        promoed.CssClass = "promosuc";
                        promoed.Text = "PromoCode Activated";
                        int total = grandtotal();
                        int sale = Convert.ToInt32(Session["sale"]);
                        int discount = sale * total / 100;
                        Session["grandtotal"] = grandtotal();
                        int ftotal = Convert.ToInt32(Session["grandtotal"]) - discount;
                        Session["grandtotal"] = ftotal;
                        Session["discount"] = discount;
                        thisdiscount.Text = "-$" + discount.ToString();
                        thisgrandtotal.Text = "$" + ftotal.ToString();
                        thisdiscount.CssClass = "showthis";
                    }
                    else
                    {
                        Session["promocode"] = null;
                        Session["sale"] = null;
                        promoed.CssClass = "promofail";
                        promoed.Text = "Invalid PromoCode";
                        Session["grandtotal"] = grandtotal();
                        if (Session["discount"] != null) {
                            int sale = Convert.ToInt32(Session["sale"]);
                            int discount = sale * Convert.ToInt32(Session["grandtotal"]) / 100;
                            Session["discount"] = discount;
                            Session["grandtotal"] = Convert.ToInt32(Session["grandtotal"]) - Convert.ToInt32(Session["discount"]);
                            thisdiscount.Text = "-$" + Session["discount"].ToString();
                            thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                        }
                        else
                        {
                            thisdiscount.Text = "-$0";
                            thisgrandtotal.Text = "$" + Session["grandtotal"].ToString();
                        }
                    }
                    cn.Close();
                }
            }
            else
            {
                Response.Redirect("reglog.aspx");
            }
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Shopping_cart"];
            if (dt != null)
            {
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
            else
            {
                Response.Redirect("shop-grid.aspx");
                return 0;
            }
        }
    }
}