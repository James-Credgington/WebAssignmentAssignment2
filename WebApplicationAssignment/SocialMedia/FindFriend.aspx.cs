using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class SocialMedia_Add_Friend : BasePage
{
    // variables that are declared with int and string data types as well as public so can be accessed throughout hte page
    public int UserId;
    public string CourseId;
    public string strcon;
    public SqlConnection con;
    public string gender, emailAddress, phoneNumber, profilePicture, dateOfBirth, currentStudent;


    protected void Page_Load(object sender, EventArgs e)
    {
        // when page loads up

        // checking if the cookie is not empty
        if (Request.Cookies["Id"] == null)
        {
            Response.Redirect("../About/LogInUser.aspx");
        }
        else
        {
            // setting the label not to be visible
            Lbl_DatabaseError.Visible = false;

            // try statmeent which the code runs for outputting all friend sin the table
            try
            {
                strcon = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                UserId = Convert.ToInt32(Request.Cookies["Id"].Value);
                Session["UserId"] = UserId; // courseId value is from the value passed form the previous page
                using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())
                {
                    // outputComment which is a general variable used to store an sql command to select the comments linked to that course page and output to that page


                    // when myReview updates the courses in the subject area

                    var myfriend = from friend in myEntities.UserLogins
                                   join course in myEntities.Courses on friend.CourseId equals course.Id
                                   where friend.Id != UserId
                                   select new friend
                                   {
                                       Id = friend.Id.ToString(),
                                       FirstName = friend.FirstName.ToString(),
                                       Surname = friend.Surname.ToString(),
                                       CurrentStudent = friend.CurrentStudent.ToString(),
                                       Name = course.Name.ToString(),
                                       ProfilePicture = friend.ProfilePicture.ToString(),

                                   };
                    Repeater1.DataSource = myfriend.ToList();
                    Repeater1.DataBind();
                }
            }
            catch {
                // when an error is caught this error label becomes true
                Lbl_DatabaseError.Visible = true;
            }
            }
    }





    protected void Btn_AddFriend_Click(object sender, EventArgs e)
    {
        // when add friend button is pressed
        // try statement get the data to add to friend table where the friend request is set to 0, because it has not been requested yet

        try
        {
            // getting values from label to find information form the friend table. Check if they have been a friend before
            Lbl_FriendAdded.Visible = false;
            Lbl_FriendAlready.Visible = false;
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string firstName = (item.FindControl("Lbl_Friends") as Label).Text;
            string lastName = (item.FindControl("Lbl_LastName") as Label).Text;
            con.Open(); // database is connection is open
            SqlCommand cmd3 = new SqlCommand("SELECT * FROM Friend WHERE FirstName = @FirstName AND Surname = @LastName AND UserId = @UserId", con);
            cmd3.Parameters.AddWithValue("@FirstName", firstName);
            cmd3.Parameters.AddWithValue("@LastName", lastName);
            cmd3.Parameters.AddWithValue("@UserId", UserId);
            SqlDataAdapter da = new SqlDataAdapter(cmd3);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // when nothing appears in the result
            if (dt.Rows.Count == 0)
            {
                // getting the friend details from the userlogin table
                SqlCommand cmd2 = new SqlCommand("SELECT * FROM UserLogin WHERE FirstName = @FirstName AND Surname = @LastName", con);
                cmd2.Parameters.AddWithValue("@FirstName", firstName);
                cmd2.Parameters.AddWithValue("@Lastname", lastName);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                SqlDataReader reader = cmd2.ExecuteReader();
                if (dt2.Rows.Count > 0)
                {
                    if (reader.Read())
                    {
                        dateOfBirth = reader[3].ToString();
                        gender = reader[4].ToString();
                        emailAddress = reader[5].ToString();
                        phoneNumber = reader[6].ToString();
                        currentStudent = reader[7].ToString();
                        profilePicture = reader[9].ToString();
                        CourseId = reader[10].ToString();
                    }
                    reader.Close();
                    // inserting data into friend table
                    SqlCommand cmd4 = new SqlCommand("INSERT INTO Friend (FirstName, Surname, DateOfBirth, Gender, EmailAddress, PhoneNumber, ProfilePicture, UserId, CurrentStudent, CourseId, FriendRequest) VALUES (@FirstName, @Surname, @DateOfBirth, @Gender, @EmailAddress, @PhoneNumber, @ProfilePicture, @UserId, @CurrentStudent, @CourseId, @FriendRequest)", con);
                    cmd4.Parameters.AddWithValue("@FirstName", firstName);
                    cmd4.Parameters.AddWithValue("@Surname", lastName);
                    cmd4.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                    cmd4.Parameters.AddWithValue("@Gender", gender);
                    cmd4.Parameters.AddWithValue("@EmailAddress", emailAddress);
                    cmd4.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    cmd4.Parameters.AddWithValue("@ProfilePicture", profilePicture);
                    cmd4.Parameters.AddWithValue("@UserId", UserId);
                    cmd4.Parameters.AddWithValue("@CurrentStudent", currentStudent);
                    cmd4.Parameters.AddWithValue("@CourseId", Convert.ToInt32(CourseId));
                    cmd4.Parameters.AddWithValue("@FriendRequest", 0);
                    cmd4.ExecuteNonQuery();
                    Lbl_FriendAdded.Visible = true;

                }
                cmd2.Dispose();

            }
            cmd3.Dispose();

            con.Close();
        }
        catch
        {
            // catch errors about the database connection are set to be visible
            Lbl_DatabaseError.Visible = true;
        }
   
    }


    protected void Btn_Search_Click(object sender, EventArgs e)
    {
        //when search button is pressed
        using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())
        {
            // find the friend in the table and filters the results

     
            // when myFriend updates the courses in the UserALogin 
            try
            {
                var myfriend1 = (from friend in myEntities.UserLogins
                                 join course in myEntities.Courses on friend.CourseId equals course.Id
                                 where friend.Surname.Contains(Txt_SearchBox.Text) && friend.Id != UserId
                                 select new friend
                                 {
                                     Id = friend.Id.ToString(),
                                     FirstName = friend.FirstName.ToString(),
                                     Surname = friend.Surname.ToString(),
                                     CurrentStudent = friend.CurrentStudent.ToString(),
                                     Name = course.Name.ToString(),
                                     ProfilePicture = friend.ProfilePicture.ToString(),


                                 });
                Repeater1.DataSource = myfriend1.ToList();
                Repeater1.DataBind();
            }
            catch {
                Lbl_DatabaseError.Visible = true;
            }


        }
    }
}
