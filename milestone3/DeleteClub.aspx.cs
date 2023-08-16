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
    public partial class DeleteClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deletec(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            String clubn = clubname.Text;
           
            SqlCommand deleteclubfromclubs = new SqlCommand("deleteClub", conn);
            deleteclubfromclubs.CommandType = CommandType.StoredProcedure;
            deleteclubfromclubs.Parameters.Add(new SqlParameter("@clubname", clubn));
            
            conn.Open();
            deleteclubfromclubs.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("SystemAdmin.aspx");
        }
    }
}