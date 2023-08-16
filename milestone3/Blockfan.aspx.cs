using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone3
{
    public partial class Blockfan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Blockf(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            String fann = fannationalid.Text;

            SqlCommand blockfan = new SqlCommand("blockFan", conn);
            blockfan.CommandType = CommandType.StoredProcedure;
            blockfan.Parameters.Add(new SqlParameter("@nid", fann));

            conn.Open();
            blockfan.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("SystemAdmin.aspx");
        }
    }
}