using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone3
{
    public partial class addclub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addc(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            String clubn = clubname.Text;
            String clubloc = clublocation.Text;
            SqlCommand addclubtoclubs = new SqlCommand("addClub", conn);
           addclubtoclubs.CommandType = CommandType.StoredProcedure;
            addclubtoclubs.Parameters.Add(new SqlParameter("@name",clubn));
            addclubtoclubs.Parameters.Add(new SqlParameter("@location",clubloc));
            conn.Open();
           addclubtoclubs.ExecuteNonQuery();
           conn.Close();
            Response.Redirect("SystemAdmin.aspx");
        }

        protected void clubname_TextChanged(object sender, EventArgs e)
        {

        }
    }
}