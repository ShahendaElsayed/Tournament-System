﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sportsmanager_Click(object sender, EventArgs e)
        {
            Response.Redirect("sportsmanagerregister.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stadiummanagerregister.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("clubrepresentativerregister.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Fanregister.aspx");
        }
    }
}