using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFood
{
    public partial class OrderActivityForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // default load data
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT od.restaurant_id, r.restaurant_name, SUM(od.order_unit) no_of_dish 
                                FROM order_details od
                                JOIN orders o ON o.order_id = od.order_id
                                JOIN restaurant r ON r.restaurant_id = od.restaurant_id
                                group by od.restaurant_id, r.restaurant_name
                                ORDER BY no_of_dish DESC";
            ;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("order_activity");

            using (OracleDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }

            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        { 
            string mon = txtMonth.Text.ToString();

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM(SELECT od.restaurant_id, r.restaurant_name, SUM(od.order_unit) no_of_dish FROM order_details od JOIN orders o ON o.order_id = od.order_id JOIN restaurant r ON r.restaurant_id = od.restaurant_id WHERE to_char(TO_DATE(o.\"date\", 'MM/DD/YYYY'), 'mon') = '" + mon + "' group by od.restaurant_id, r.restaurant_name ORDER BY no_of_dish DESC) WHERE rownum <= 5";
            ;
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("DELIVERY_ADDRESS");

            using (OracleDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }

            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}