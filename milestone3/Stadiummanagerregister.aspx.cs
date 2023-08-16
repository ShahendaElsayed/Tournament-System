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
    public partial class Stadiummanagerregister : System.Web.UI.Page
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
            String stadiumn = stadiumname.Text;
            if (usern.Length == 0 || pass.Length == 0 || n.Length == 0 || stadiumn.Length == 0)
                Response.Redirect("Login.aspx");

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
                SqlCommand checkc = new SqlCommand("checkstadium", conn);
                checkc.CommandType = CommandType.StoredProcedure;
                checkc.Parameters.Add(new SqlParameter("@stadiumname", stadiumn));
                SqlParameter sucess = checkc.Parameters.Add("@success", SqlDbType.Int);
                sucess.Direction = ParameterDirection.Output;
                conn.Open();
                checkc.ExecuteNonQuery();
                conn.Close();
                if (sucess.Value.ToString() == "1")

                {


                    SqlCommand adds = new SqlCommand("addStadiumManager", conn);
                    adds.CommandType = CommandType.StoredProcedure;
                    adds.Parameters.Add(new SqlParameter("@managername", n));
                    adds.Parameters.Add(new SqlParameter("@username", usern));
                    adds.Parameters.Add(new SqlParameter("@managerpassword", pass));
                    adds.Parameters.Add(new SqlParameter("@stadiumname", stadiumn));
                    conn.Open();
                    adds.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");

                }
                else if (sucess.Value.ToString() == "0")
                {
                    Response.Write("invalid Stadium name");

                }
            }
            else if (success.Value.ToString() == "1")
            {
                Response.Write("invalid user name");

            }

        }
    }
    }