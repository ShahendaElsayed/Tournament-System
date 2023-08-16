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
    public partial class Fanregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            //create a new connection 

            String usern = (username.Text);
            String pass = password.Text;
            String n = name.Text;
            String national = nationalid.Text;
            String add = address.Text;
            String phone = phonenumber.Text;

            DateTime dt = Convert.ToDateTime(Calendar1.SelectedDate.ToShortDateString());
            
                SqlCommand loginproc = new SqlCommand("users", conn);
                loginproc.CommandType = CommandType.StoredProcedure;
                loginproc.Parameters.Add(new SqlParameter("@username", usern));

                SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);

                success.Direction = ParameterDirection.Output;



                conn.Open();
                loginproc.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "0")
                {
                    SqlCommand addfann = new SqlCommand("addFan", conn);
                    addfann.CommandType = CommandType.StoredProcedure;
                    addfann.Parameters.Add(new SqlParameter("@Fname", n));
                    addfann.Parameters.Add(new SqlParameter("@Fusername", usern));
                    addfann.Parameters.Add(new SqlParameter("@Fpassword", pass));
                    addfann.Parameters.Add(new SqlParameter("@FNational_ID", national));
                    addfann.Parameters.Add(new SqlParameter("@birthdate", dt));
                    addfann.Parameters.Add(new SqlParameter("@add", add));
                    addfann.Parameters.Add(new SqlParameter("@phoneNo", phone));
                    conn.Open();
                    addfann.ExecuteNonQuery();
                    conn.Close();
                    

                }
            else if (success.Value.ToString() == "1")
            {
                Response.Write("invalid user name");

            }

            }
        
    }
}