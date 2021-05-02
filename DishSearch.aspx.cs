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
    public partial class DishSearch : System.Web.UI.Page
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
            cmd.CommandText = "SELECT r.restaurant_name, d.dish_name, dr.dish_rate, lp.loyalty_point FROM dish d INNER JOIN dish_restaurant dr ON dr.dish_id = d.dish_id INNER JOIN restaurant r ON r.restaurant_id = dr.restaurant_id INNER JOIN loyalty_point lp ON lp.loyalty_id = dr.loyalty_id ";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("Dish_detail");

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
            string dishID = ddlDish.SelectedValue.ToString();

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT r.restaurant_name, d.dish_name, dr.dish_rate, lp.loyalty_point FROM dish d INNER JOIN dish_restaurant dr ON dr.dish_id = d.dish_id INNER JOIN restaurant r ON r.restaurant_id = dr.restaurant_id INNER JOIN loyalty_point lp ON lp.loyalty_id = dr.loyalty_id WHERE d.dish_id = " + dishID + " ";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("Dish_detail");

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