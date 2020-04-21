using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SocialMedia_AddFriend : BasePage
{
    /* variables declared at the start of the class */
    public int UserId;
    public string strcon, firstname, lastname;
    public SqlConnection con;
    public string Id, firstName, lastName, gender, emailAddress, phoneNumber, profilePicture, dateOfBirth, currentStudent, CourseId, friendId, userId, FirstName, LastName;
    protected void Page_Load(object sender, EventArgs e)
    {
        /* when page is first loaded */
        Lbl_DatabaseError1.Visible = false;
        /* try statement to detect when the database connection is not working */
        try
        {
            /* getting various data to help later on in the program */
            strcon = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();
            /* Finding the users firstname and lastname */
            UserId = Convert.ToInt32(Request.Cookies["Id"].Value);
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM UserLogin WHERE Id = @UserId", con);
            cmd1.Parameters.AddWithValue("@UserId", UserId);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd1);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            SqlDataReader reader = cmd1.ExecuteReader();
            if (dt2.Rows.Count > 0)
            {
                if (reader.Read())
                {
                    firstName = reader[1].ToString();
                    lastName = reader[2].ToString();


                }
                reader.Close();
            }
            cmd1.Dispose();
            con.Close();

            /* outputting the friend requests from the database into the first repeater*/
            using (var test = new HigherEducationChesterfieldCollegeEntities())
            {
                var friendRequests = (from friend in test.Friends
                                      join user in test.UserLogins on friend.UserId equals user.Id
                                      join Course in test.Courses on user.CourseId equals Course.Id
                                      orderby friend.FirstName ascending
                                      where friend.FirstName == firstName && friend.Surname == lastName && friend.FriendRequest == 0
                                      select new friendRequest
                                      {
                                          Id = user.Id.ToString(),
                                          FirstName = user.FirstName.ToString(),
                                          Surname = user.Surname.ToString(),
                                          CurrentStudent = user.CurrentStudent.ToString(),
                                          Name = Course.Name.ToString(),
                                          ProfilePicture = user.ProfilePicture.ToString(),
                                      });
                Repeater1.DataSource = friendRequests.ToList();
                Repeater1.DataBind();
                /* lists all friends that have been accepted */
                var currentFriends = (from friend in test.Friends
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

                Repeater2.DataSource = currentFriends.ToList();
                Repeater2.DataBind();
            }
        }
        catch {
            /* catching database errors*/
            Lbl_DatabaseError1.Visible = true;
        }
    }
    protected void Btn_AddFriendPage_Click(object sender, EventArgs e)
    {
        /* when add friend button is pressed be redirected to this page */
        Response.Redirect("../SocialMedia/FindFriend.aspx");
    }
    protected void Btn_AddFriend_Click(object sender, EventArgs e)
    {
        /* when add friend button is pressed */
        Lbl_DatabaseError2.Visible = false;

        // try statement to find any errors in the code below, when a friend is being added
        try
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string firstName = (item.FindControl("Lbl_Friends") as Label).Text;
            string lastName = (item.FindControl("Lbl_LastName") as Label).Text;
            con.Open(); // database is connection is open
            SqlCommand cmd6 = new SqlCommand("SELECT * FROM UserLogin WHERE FirstName = @FirstName AND Surname = @Surname", con);
            cmd6.Parameters.AddWithValue("@FirstName", firstName);
            cmd6.Parameters.AddWithValue("@Surname", lastName);
            SqlDataAdapter da6 = new SqlDataAdapter(cmd6);
            DataTable dt6 = new DataTable();
            da6.Fill(dt6);
            SqlDataReader reader2 = cmd6.ExecuteReader();
            if (dt6.Rows.Count > 0)
            {
                if (reader2.Read())
                {
                    userId = reader2[0].ToString();
                    FirstName = reader2[1].ToString();
                    LastName = reader2[1].ToString();

                }
                reader2.Close();
            }

            // finding friends information in the userlogin table
        SqlCommand cmd8 = new SqlCommand("SELECT * FROM UserLogin WHERE Id = @UserId", con);
        cmd8.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
        SqlDataAdapter da8 = new SqlDataAdapter(cmd8);
        DataTable dt8 = new DataTable();
        da8.Fill(dt8);
        SqlDataReader reader8 = cmd8.ExecuteReader();
        if (dt8.Rows.Count > 0)
        {
            if (reader8.Read())
            {
                firstname = reader8[1].ToString();
                lastname = reader8[2].ToString();
            }
            reader8.Close();
        }
        // updating the friend request in the friend table

            SqlCommand cmd1 = new SqlCommand("UPDATE Friend SET FriendRequest = @FriendRequest WHERE UserId = @Id AND FirstName = @FirstName AND Surname = @Surname", con);
            cmd1.Parameters.AddWithValue("@FriendRequest", 1);
            cmd1.Parameters.AddWithValue("@FirstName", firstname);
            cmd1.Parameters.AddWithValue("@Surname", lastname);
            cmd1.Parameters.AddWithValue("@Id", userId);
            cmd1.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("SELECT * FROM Friend WHERE FirstName = @FirstName AND Surname = @LastName AND Id = @UserId", con);
            cmd3.Parameters.AddWithValue("@FirstName", firstName);
            cmd3.Parameters.AddWithValue("@LastName", lastName);
            cmd3.Parameters.AddWithValue("@UserId", UserId);
            SqlDataAdapter da = new SqlDataAdapter(cmd3);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // adding information to the friend table when a friend request is accepted
            if (dt.Rows.Count == 0)
            {
                SqlCommand cmd2 = new SqlCommand("SELECT * FROM UserLogin WHERE FirstName = @FirstName AND Surname = @LastName", con);
                cmd2.Parameters.AddWithValue("@FirstName", firstName);
                cmd2.Parameters.AddWithValue("@LastName", lastName);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                SqlDataReader reader1 = cmd2.ExecuteReader();
                if (dt2.Rows.Count > 0)
                {
                    if (reader1.Read())
                    {
                        Id = reader1[0].ToString();
                        dateOfBirth = reader1[3].ToString();
                        gender = reader1[4].ToString();
                        emailAddress = reader1[5].ToString();
                        phoneNumber = reader1[6].ToString();
                        currentStudent = reader1[7].ToString();
                        profilePicture = reader1[9].ToString();
                        CourseId = reader1[10].ToString();
                        reader1.Close();
                    }

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
                    cmd4.Parameters.AddWithValue("@FriendRequest", 1);
                    cmd4.ExecuteNonQuery();
                    cmd4.Dispose();

                }

                cmd2.Dispose();

            }
            cmd3.Dispose();
            con.Close();
        }
        catch {
            // otherwise database error label appears
            Lbl_DatabaseError2.Visible = true;
        }

    }

}
    
    

    
