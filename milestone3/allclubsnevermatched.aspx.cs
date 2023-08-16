using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace milestone3
{
    public partial class clubsNeverMatched : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                using (SqlCommand command = conn.CreateCommand())
                {
                    command.CommandText = "select * from  clubsNeverMatched ";

                    conn.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            
                           // reader.GetInt32(0); // get first column from view, assume it's a 32-bit int
                          String name=  reader.GetString(1); // get second column from view, assume it's a string
                            Label cname = new Label();
                            cname.Text = name;
                            neverm.Controls.Add(cname);
                            // etc.
                        }
                    }
                }
            }
        }
    }
}