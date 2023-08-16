using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone3
{
    public partial class clubrepresentativerregister : System.Web.UI.Page
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
            String clubn = clubname.Text;    
       
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
                SqlCommand checkc = new SqlCommand("checkclub", conn);
                checkc.CommandType = CommandType.StoredProcedure;
                checkc.Parameters.Add(new SqlParameter("@clubname", clubn));
                SqlParameter sucess = checkc.Parameters.Add("@success", SqlDbType.Int);
                sucess.Direction = ParameterDirection.Output;
                conn.Open();
                checkc.ExecuteNonQuery();
                conn.Close();
                if (sucess.Value.ToString() == "1")

                {


                    SqlCommand addr = new SqlCommand("addrepresentative", conn);
                    addr.CommandType = CommandType.StoredProcedure;
                    addr.Parameters.Add(new SqlParameter("@representativename", n));
                    addr.Parameters.Add(new SqlParameter("@representativeusername", usern));
                    addr.Parameters.Add(new SqlParameter("@representativePassword", pass));

                    addr.Parameters.Add(new SqlParameter("@clubname", clubn));
                    conn.Open();
                    addr.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");

                }
                else if (sucess.Value.ToString() == "0")
                {
                    Response.Write("invalid Club name");

                }
            }
            else if (success.Value.ToString() == "1")
            {
                Response.Write("invalid user name");

            }

        }
    }
}