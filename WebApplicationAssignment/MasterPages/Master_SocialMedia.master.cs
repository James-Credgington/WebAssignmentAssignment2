using System;  /*import system library */
using System.Collections.Generic; /*import system collection generic library */
using System.Linq; /*import system linq library */
using System.Web; /*import system web library */
using System.Web.UI; /*import system web ui library */
using System.Web.UI.WebControls; /*import system web ui web controls library */
using System.Net.Mail; /*importing system email library */
using System.IO; /*importing system input output library */
using System.Data; /*importing system data library */
using System.Data.SqlClient; /*importing sql client library */
using System.Configuration; /* importing system configuration library */
using System.Web.Security; /* improting web security library */
using System.Web.UI.WebControls.WebParts; /*importing UI libaries */
using System.Web.UI.HtmlControls;
using System.Drawing.Imaging; /*importing system drawing library */
using System.Drawing;


public partial class MasterPages_Master_SocialMedia : System.Web.UI.MasterPage
{
    public int UserId;
    public SqlConnection con;
    public string strcon, firstName, lastName;
    protected void Page_Load(object sender, EventArgs e) /* start of page_load method */
    {
        strcon = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
        con.Open(); // database is connection is open
        UserId = Convert.ToInt32(Request.Cookies["Id"].Value);

        SqlCommand cmd = new SqlCommand("SELECT * FROM UserLogin WHERE Id=@Id", con);
        cmd.Parameters.AddWithValue("@Id", UserId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        SqlDataReader reader = cmd.ExecuteReader();
        if (dt.Rows.Count > 0)
        {
            if (reader.Read())
            {
                firstName = reader[1].ToString();
                lastName = reader[2].ToString();
            }
            reader.Close();
        }
        cmd.Dispose();

        Lbl_Welcome.Text = "Welcome, " + firstName + " " + lastName;
        con.Close();

        if (!Page.IsPostBack) /* if the page does not postback */
        {


            string selectedTheme = Page.Theme; /* the selected theme is equal to the page theme */
            HttpCookie preferredTheme = Request.Cookies.Get("PreferredTheme"); /* preferredTheme is saved with the object of an HttpCookie gets request cookies from preferred theme*/
            if (preferredTheme != null) /* if the preferred theme is not null */
            {
                selectedTheme = preferredTheme.Value; /*selected theme is the preferred Theme value of the cookie */
            }

            if (!string.IsNullOrEmpty(selectedTheme)) /* if the selectedTheme is not empty */
            {
                ListItem item = ThemeList.Items.FindByValue(selectedTheme); /* if the theme list is found by the selected theme */
                if (item != null) /* if the item is not null */
                {
                    item.Selected = true; /* when the item selected is true */
                }
            }
            string selectedFontStyle = Page.Theme; /* the selected theme is equal to the page theme */
        }
    }
    /* start of the themelist_SelectedIndexChanged method */
    protected void ThemeList_SelectedIndexChanged(object sender, EventArgs e) 
    {
        {

            HttpCookie preferredTheme = new HttpCookie("PreferredTheme"); /* new instance of a class for an object for HttpCookie */
            preferredTheme.Expires = DateTime.Now.AddMonths(6); /*the expires variable from class called expires when it resets after 6 months */
            preferredTheme.Value = ThemeList.SelectedValue; /* the value of the preferred theme class is linked to the drop down box*/
            preferredTheme.Value = ThemeList.SelectedValue;
            Response.Cookies.Add(preferredTheme); /* add preerredTheme response to cookies */
            Response.Redirect(Request.Url.ToString()); /* Redirect the page to that Url, refresh to accomodate these changes */
        }

    }

    protected void Btn_AddFriend_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
}
