using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SocialMedia_Home : BasePage
{
    // when the variables below are set to be public and have different data types
    public string strcon, id;
    public int courseId;
    public int UserId; /* integer called courseId is public */
    public string cacheKey, cacheKey2; /* string called cacheKey is public */
    public SqlConnection con;
    public string student;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // when the web page loads

        // when the cookie is set to null

        if (Request.Cookies["Id"] == null)
        {
            // redirects to each page
            Response.Redirect("../About/LogInUser.aspx");
        }
        else
        {
            // otherwise

            // in try statements get profile ifnormation as well as values from cookies and query strings and information about diffferent friends
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
                con.Open(); // database is connection is open

                UserId = Convert.ToInt32(Request.Cookies["Id"].Value);

                Session["UserId"] = UserId; // UserId value is from the value passed form the previous page
                HttpCookie cookieId = new HttpCookie("Id", UserId.ToString());
                cookieId.Expires = DateTime.Now.AddSeconds(6000);
                cacheKey = "User" + UserId.ToString(); // when the cache is key is the course plus the courseId
                UserLogin profile = Cache[cacheKey] as UserLogin; // new instance of the class course when object is called myreview

                // receiving profile information and putting inside labels
                if (profile == null) 
                {
                    // creating a new instance of class by calling the object myEntities
                    using (HigherEducationChesterfieldCollegeEntities Profile = new HigherEducationChesterfieldCollegeEntities())
                    {

                        profile = (from r in Profile.UserLogins
                                   where r.Id == UserId
                                   select r).SingleOrDefault();
                        if (profile != null)
                        {
                            Cache.Insert(cacheKey, profile, null, DateTime.Now.AddSeconds(1), System.Web.Caching.Cache.NoSlidingExpiration); // updates values vevery second
                        }


                    }


                }
                if (profile != null)
                {
                    Title = "Higher Education Chesterfield College - Social Network - Profile - " + profile.FirstName + "" + profile.Surname; // set the title of the web page to the title of the coruse
                    Lbl_FirstName.Text = "<b>First Name: </b>" + profile.FirstName; // title label is set to the title of the course
                    Lbl_Surname.Text = "<b>Surname: </b>" + profile.Surname; // full part time label sets to the partFullTime selected from the database
                    Lbl_DateOfBirth.Text = "<b>Date Of Birth: </b>" + profile.DateOfBirth; // LevelOfCourse label sets to the LevelOfCourse selected from the database
                    Lbl_Gender.Text = "<b>Gender: </b>" + profile.Gender;
                    Img_Profile.ImageUrl = profile.ProfilePicture;
                    Lbl_EmailAddress.Text = "<b>Email Address: </b>" + profile.EmailAddress;
                    Lbl_PhoneNumber.Text = "<b>Phone Number: </b>" + profile.PhoneNumber;
                    Lbl_CurrentStudent.Text = "<b>Current Student: </b>" + profile.CurrentStudent;
                    courseId = Convert.ToInt32(profile.CourseId);
                    student = profile.CurrentStudent;
                    if (profile.Description == "")
                    {
                        Lbl_Description.Text = "<b>Description: </b> User has not set the description property.";
                    }
                    else
                    {
                        Lbl_Description.Text = "<b>Description: </b>" + profile.Description;
                    }
                }



                Session["CourseId"] = courseId; // courseId value is from the value passed form the previous page
                cacheKey2 = "course" + courseId.ToString(); // when the cache is key is the course plus the courseId
                Course course = Cache[cacheKey2] as Course; // new instance of the class course when object is called myreview
                if (profile != null && course == null) // when myReview statement doesn't contain any data
                {
                    // creating a new instance of class by calling the object myEntities
                    using (HigherEducationChesterfieldCollegeEntities Course = new HigherEducationChesterfieldCollegeEntities())
                    {
                        // creating a new instance of class by calling the object myEntities

                        course = (from r in Course.Courses
                                  where r.Id == courseId
                                  select r).SingleOrDefault();
                    }
                    if (course != null)
                    {
                        if (course.Name != "")
                        {
                            if (student == "Yes")
                            {
                                Lbl_Course.Text = "<b> Current Course: </b>" + course.Name;
                            }
                            else if (student == "No")
                            {
                                Lbl_Course.Text = "<b>Favourite Course: </b>" + course.Name;
                            }
                        }

                    }

                    using (var test = new HigherEducationChesterfieldCollegeEntities())
                    {
                        /* lists all the friends reelvant with the logged on user stored on the database */
                        var authorizedReviews = (from friend in test.Friends
                                                 join Course in test.Courses on friend.CourseId equals Course.Id
                                                 orderby friend.Surname ascending
                                                 where friend.UserId == UserId && friend.FriendRequest == 1
                                                 select new myFriend
                                                 {
                                                     Id = friend.Id.ToString(),
                                                     FirstName = friend.FirstName.ToString(),
                                                     Surname = friend.Surname.ToString(),
                                                     CurrentStudent = friend.CurrentStudent.ToString(),
                                                     Name = Course.Name.ToString(),
                                                     ProfilePicture = friend.ProfilePicture.ToString(),
                                                 });
                        Repeater2.DataSource = authorizedReviews.ToList();
                        Repeater2.DataBind();
                    }
                }
            }
            catch
            {
                Lbl_DatabaseError.Visible = true;
            }
        }

    }

    protected void Btn_EditProfile_Click(object sender, EventArgs e)
    {
        // when edit profile button is pressed redirect to the url below
        string url = "../SocialMedia/EditProfile.aspx?id=" + Convert.ToString(UserId);
        Response.Redirect(url);
    }

    protected void Btn_AddButton_Click(object sender, EventArgs e)
    {
        // when add button is pressed redirects to url below
        Response.Redirect("../SocialMedia/FindFriend.aspx");
    }
}