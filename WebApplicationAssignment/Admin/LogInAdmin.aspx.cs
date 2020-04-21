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


public partial class Admin_LogInAdmin : BasePage /* Admin_LogInAdmin page is inherited by the superclass BasePage */
{
    public SqlConnection con;
    protected void Page_Load(object sender, EventArgs e) // method for when the page first loads
    {
        // starts the connection to the database
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
        
    }
    

    protected void Btn_SubmitEnquiry_Click(object sender, EventArgs e) // when the submit enquiry button is pressed
    {
        // starts the connection to the database
        
        con.Open();

        // selects all values the adminLogin  whether the email address is equalled to the username textbox and the password is equal to the password textbox -->
        SqlCommand cmd = new SqlCommand("select * from WebsiteAdministrator WHERE EmailAddress=@EmailAddress and Password=@Password", con);
        cmd.Parameters.AddWithValue("@EmailAddress", Txt_Username.Text);
        cmd.Parameters.AddWithValue("@Password", Txt_Password.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd); // 
        DataTable dt = new DataTable();
        da.Fill(dt); 
        // when the number of rows is greater than 0, sets the incorrect label not to be visible and redirects to the administrator home page
        if (dt.Rows.Count > 0) 
        {
            lbl_Incorrect.Visible = false;
            Response.Redirect("~/Admin/home.aspx");
        }
        // otherwise sets the incorrect label ot be visible and updates the database to see where log in status is set to be true;
        else
        {

            lbl_Incorrect.Visible = true;
            SqlCommand cmd2 = new SqlCommand("UPDATE WebsiteAdministrator WHERE EmailAddress=@EmailAddress SET [LoggedOn]=@LoggedOn", con);
            cmd2.Parameters.AddWithValue("@EmailAddress", Txt_Username.Text);
            cmd2.Parameters.AddWithValue("@LoggedOn", true);
        }
    }
}