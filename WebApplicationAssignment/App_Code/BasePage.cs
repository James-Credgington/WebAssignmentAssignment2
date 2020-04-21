using System;
using System.Web;

/// <summary>
/// Summary description for BaseCase
/// </summary>
public class BasePage : System.Web.UI.Page /* declaring the Base Page method */
{
    public BasePage() /* function when the class is first produced */
    {
        this.PreRender += Page_PreRender; 
        this.PreInit += Page_PreInit;
    }
    private void Page_PreRender(object sender, EventArgs e) // start of the Page_PreRender function 
    {
        /*if (string.IsNullOrEmpty(this.Title) || this.Title.Equals("UntitledPage", StringComparison.CurrentCultureIgnoreCase))
        {
            throw new Exception("Page title cannot be \"Untitled Page\" or an empty string.");
        }*/
    }

    private void Page_PreInit(object sender, EventArgs e) // start of the Page_PreInit function 
    {
        HttpCookie preferredTheme = Request.Cookies.Get("PreferredTheme"); // declaring the variable data type as a HttpCookie called preferredTheme
        if (preferredTheme != null) // when the preferred theme is not null
        {
            string folder = Server.MapPath("~/App_Themes/" + preferredTheme.Value); // declaring folder variable as a string for opening the css file that's relevant
            if (System.IO.Directory.Exists(folder)) // when the folder exists
            {
                Page.Theme = preferredTheme.Value; // setting website theme to drop down box result
            }
        }
    }
}