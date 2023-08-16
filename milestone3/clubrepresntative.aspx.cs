using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace milestone3
{
    public partial class clubrepresntative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewmatch(object sender, EventArgs e)
        {
           /* SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            String allclubs = WebConfigurationManager.ConnectionStrings["club"].ToString();
            SqlCommand clubinfo = new SqlCommand("Club", conn);
            clubinfo.CommandType = CommandType.TableDirect;
            SqlDataReader clubdata = clubinfo.ExecuteReader(CommandBehavior.CloseConnection);
            while (clubdata.Read())
            {
                string clubname = clubdata.GetString
            }

            SqlCommand viewmatch = new SqlCommand("upcomingMatchesOfClub", conn);
            viewmatch.CommandType = CommandType.view();
            viewmatch.Parameters.Add(new SqlParameter("@name", clubn));
            conn.Open();
            viewmatch.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("clubrepresentative.aspx");*/
        
    }


        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}