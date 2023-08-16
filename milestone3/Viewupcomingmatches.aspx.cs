using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone3
{
    public partial class Viewupcomingmatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                using (SqlCommand command = conn.CreateCommand())
                { String date =datee.Text;
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.availableMatchestoAttend(@username)", conn);
                    // cmd.CommandType=CommandType.StoredProcedure;  
                    cmd.Parameters.AddWithValue("@username", Convert.ToDateTime(date)); ;

                    conn.Open();
                  
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            // reader.GetInt32(0); // get first column from view, assume it's a 32-bit int
                            String hname = reader.GetString(1); 
                            String gname = reader.GetString(2); // get second column from view, assume it's a string
                            String sname = reader.GetString(4); // get second column from view, assume it's a string
                            String slname = reader.GetString(5); // get second column from view, assume it's a string
                            // get second column from view, assume it's a string
                            Label hhname = new Label();
                            hhname.Text =" host: "+hname+"guest: "+gname+"stadium name: "+sname+ "stadium location: "+slname;
                            availablem.Controls.Add(hhname);
                            // etc.
                        }
                    }
                }
            }
        }
    }
}