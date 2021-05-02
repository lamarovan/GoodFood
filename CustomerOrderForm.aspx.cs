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
    public partial class CustomerOrderForm : System.Web.UI.Page
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
            cmd.CommandText = "SELECT o.SN, c.customer_name, o.\"date\", da.delivery_point, d.dish_name, od.order_unit, o.status FROM orders o INNER JOIN order_details od ON od.order_id = o.order_id INNER JOIN dish d ON d.dish_id = od.dish_id INNER JOIN delivery_address da ON da.address_id = o.address_id INNER JOIN customer_order co ON co.order_id = o.order_id INNER JOIN customer c ON c.customer_id = co.customer_id";
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string customerID = ddlCustomer.SelectedValue.ToString();
            string orderID= ddlOrder.SelectedValue.ToString();
            Console.WriteLine(customerID);

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT o.SN, c.customer_name, o.\"date\", da.delivery_point, d.dish_name, od.order_unit, o.status FROM orders o INNER JOIN order_details od ON od.order_id = o.order_id INNER JOIN dish d ON d.dish_id = od.dish_id INNER JOIN delivery_address da ON da.address_id = o.address_id INNER JOIN customer_order co ON co.order_id = o.order_id INNER JOIN customer c ON c.customer_id = co.customer_id WHERE c.customer_id = " + customerID + " AND o.order_id= " + orderID + " ";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("cusotomerorderdetails");

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