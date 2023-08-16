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
    public partial class AddStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adds(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            String stadn = Stadiumname.Text;
            String stadloc = stadiumlocation.Text;
            int stadcapacity = Int16.Parse(stadiumcapacity.Text);
            SqlCommand addstadtostads = new SqlCommand("addStadium", conn);
            addstadtostads.CommandType = CommandType.StoredProcedure;
            addstadtostads.Parameters.Add(new SqlParameter("@stadiumname", stadn));
            addstadtostads.Parameters.Add(new SqlParameter("@stadiumlocation", stadloc));
            addstadtostads.Parameters.Add(new SqlParameter("@stadiumcapacity", stadcapacity));

            conn.Open();
            addstadtostads.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("SystemAdmin.aspx");
        }
    }
}