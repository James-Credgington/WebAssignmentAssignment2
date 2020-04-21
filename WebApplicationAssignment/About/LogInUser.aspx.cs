using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing.Imaging;
using System.Drawing;

public partial class About_LogIn : BasePage /* About_Login class is inherited by the subclass BasePage */
{
    public string firstName, password, lastName;
    protected void Page_Load(object sender, EventArgs e) /* start of the method when in this case nothing happens to the page when it loads up */
    {

    }


    protected void Btn_SubmitEnquiry_Click(object sender, EventArgs e) // when the submit button is pressed 
    {
        // connection to the database has started
        SqlConnection con = new 
            SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
        con.Open(); 
        // sql statement for selecting data from the database
        SqlCommand cmd = new SqlCommand("SELECT * FROM UserLogin WHERE EmailAddress=@EmailAddress and Password=@Password", con);
        // replacing values with the sql statement with textbox input
        cmd.Parameters.AddWithValue("@EmailAddress", Txt_Username.Text);
        cmd.Parameters.AddWithValue("@Password", Txt_Password.Text);
        // sql data adapter using the sql statement.

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
        if (dt.Rows.Count > 0)
        {

            if (reader.Read())
            {
                HttpCookie cookieId = new HttpCookie("Id", reader[0].ToString());
                cookieId.Expires = DateTime.Now.AddSeconds(6000);

                cmd.Dispose();
                Response.SetCookie(cookieId);

            }
            reader.Close();
            lbl_Incorrect.Visible = false; // when the incorrect label is invisible
            Response.Redirect("~/SocialMedia/Home.aspx"); // redirect to the homepage
        }
        
        else // otherwise
        {
            lbl_Incorrect.Visible = true; // when the incorrect label is visible
        }
    }

}
