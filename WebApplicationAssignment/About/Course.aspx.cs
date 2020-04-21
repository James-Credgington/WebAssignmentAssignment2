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

public partial class About_Course : BasePage /*About_Course class is inherited by the superclass BasePage*/
{
    public int courseId; /* integer called courseId is public */
    public string cacheKey; /* string called cacheKey is public */
    protected void Page_Load(object sender, EventArgs e) // start of method whe the page first loads 
    {
        // sql connection for connecting the database 
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
        con.Open(); // database is connection is open


       
        courseId = Convert.ToInt32(Request.QueryString.Get("CourseId")); // courseId is set to the variable set through as a session variable converted to an integer
        Session["CourseID"] = courseId; // courseId value is from the value passed form the previous page
        cacheKey = "Course" + courseId.ToString(); // when the cache is key is the course plus the courseId
        Course myReview = Cache[cacheKey] as Course; // new instance of the class course when object is called myreview
        if (myReview == null) // when myReview statement doesn't contain any data
        {
            // creating a new instance of class by calling the object myEntities
            using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())            
            {
                // outputComment which is a general variable used to store an sql command to select the comments linked to that course page and output to that page
                var outputComments = from comment in myEntities.Comments
                                        orderby comment.Id descending
                                        where comment.CourseId == courseId
                                        select comment;

                Repeater2.DataSource = outputComments.ToList();
                Repeater2.DataBind();

                // when myReview updates the courses in the subject area

                myReview = (from r in myEntities.Courses
                            where r.Id == courseId
                            select r).SingleOrDefault();
                if (myReview != null)
                {
                    Cache.Insert(cacheKey, myReview, null, DateTime.Now.AddSeconds(1), System.Web.Caching.Cache.NoSlidingExpiration); // updates values vevery second
                }
            }
        }

        if (myReview != null) // when the review is not null
        {
            img_Course.ImageUrl = myReview.ImageUrl;
            Title = "Higher Education Chesterfield College - " + myReview.Name; // set the title of the web page to the title of the coruse
            TitleLabel.Text = myReview.Name; // title label is set to the title of the course
            FullPartTime.Text = "<b>Type Of Course: </b>" + myReview.PartFullTime; // full part time label sets to the partFullTime selected from the database
            LevelOfCourse.Text = "<b>Level Of Course:   </b>" + Convert.ToString(myReview.LevelOfCourse); // LevelOfCourse label sets to the LevelOfCourse selected from the database
            BriefInformation.Text = "<b> Other Information: </b>" + myReview.AdditionalInformation; // Brief information label sets to the AdditionalInformation selected from the database
       
        }
    }


}
