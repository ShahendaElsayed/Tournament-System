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
    public partial class sportsmanagerregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            //create a new connection 

            String usern = (username.Text);
            String pass = password.Text;
            String n = name.Text;
          

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
               


                    SqlCommand addr = new SqlCommand("addAssociationManager", conn);
                    addr.CommandType = CommandType.StoredProcedure;
                    addr.Parameters.Add(new SqlParameter("@managername", n));
                    addr.Parameters.Add(new SqlParameter("@managerusername", usern));
                    addr.Parameters.Add(new SqlParameter("@managerpass", pass));

                 
                    conn.Open();
                    addr.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");

                
            }
            else if(success.Value.ToString()=="1")
            {
               
                Response.Write("invalid user name");
            }

        }
    }
   
}
