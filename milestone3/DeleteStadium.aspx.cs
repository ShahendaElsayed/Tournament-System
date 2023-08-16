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
    public partial class DeleteStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deletes(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            String stadn = Stadiumame.Text;

            SqlCommand deletestadfromstads = new SqlCommand("deleteStadium", conn);
            deletestadfromstads.CommandType = CommandType.StoredProcedure;
            deletestadfromstads.Parameters.Add(new SqlParameter("@name", stadn));

            conn.Open();
            deletestadfromstads.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("SystemAdmin.aspx");
        }
    }
}