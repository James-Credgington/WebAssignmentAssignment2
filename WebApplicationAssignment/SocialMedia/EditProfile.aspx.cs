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

public partial class SocialMedia_EditProfile : BasePage
{
    public string strcon;
    public string id;
    public int UserId; /* integer called courseId is public */
    public string cacheKey; /* string called cacheKey is public */
    public SqlConnection con;
    public int courseId;
    public string fileName, imageUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        Lbl_DatabaseError.Visible = false;
        try
        {
            strcon = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;

            con = new SqlConnection(strcon);
            con.Open(); // database is connection is op
            UserId = Convert.ToInt32(Request.QueryString.Get("id"));
            Session["UserId"] = UserId; // userId value is from the value passed form the previous page
            cacheKey = "User" + UserId.ToString(); // when the cache is key is the course plus the userId
            UserLogin userProfile = Cache[cacheKey] as UserLogin; // new instance of the UserLogin course when object is called userProfile
            if (userProfile == null) // when userProfile statement doesn't contain any data
            {
                // creating a new instance of class by calling the object myEntities
                using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())
                {
                    // myEntities which is a general variable used to store an sql command to select the comments linked to that course page and output to that page


                    // when userProfile updates the courses in the subject area

                    userProfile = (from r in myEntities.UserLogins
                                   where r.Id == UserId
                                   select r).SingleOrDefault();
                    if (userProfile != null)
                    {
                        Cache.Insert(cacheKey, userProfile, null, DateTime.Now.AddSeconds(1), System.Web.Caching.Cache.NoSlidingExpiration); // updates values vevery second
                    }
                }
            }

            if (userProfile != null) // when the userProfile is not null
            {
                Title = "Higher Education Chesterfield College - Social Network - Profile - " + userProfile.FirstName + " " + userProfile.Surname; // set the title of the web page to the title of the coruse
            }
            con.Close();
        }
        catch {
            Lbl_DatabaseError.Visible = true;
        }


    }

    protected void Btn_Refresh_Click(object sender, EventArgs e)
    {
        // when refresh button is pressed
        Response.Redirect(Request.Url.ToString()); // refreshes the current url
    }

    protected void Btn_SubmitDetails_Click(object sender, EventArgs e)
    {
        // when the submit button is pressed
        // try statement where it catches database errors when data is being updated with the various queries below
        try
        {
            con.Open(); // database is connection is open
            // updating general information

            SqlCommand cmd = new SqlCommand("UPDATE UserLogin SET Gender = @Gender, CurrentStudent = @CurrentStudent, CourseId = @CourseId WHERE Id=@UserId", con);

            cmd.Parameters.AddWithValue("@CurrentStudent", Rbl_CurrentStudent.SelectedValue);
            cmd.Parameters.AddWithValue("@Gender", Rbl_gender.SelectedValue);
            cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(Ddl_Course.SelectedItem.Value));
            cmd.Parameters.AddWithValue("@UserId", UserId);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            // updating firstname
            if (Txt_FirstName.Text != "")
            {

                SqlCommand cmd2 = new SqlCommand("UPDATE UserLogin SET FirstName = @FirstName WHERE Id=@UserId", con);
                cmd2.Parameters.AddWithValue("@FirstName", Txt_FirstName.Text);
                cmd2.Parameters.AddWithValue("@UserId", UserId);
                cmd2.ExecuteNonQuery();
                cmd2.Dispose();
            }
            //updating lastname
            if (Txt_LastName.Text != "")
            {
                SqlCommand cmd3 = new SqlCommand("UPDATE UserLogin SET Surname = @Surname WHERE Id=@UserId", con);
                cmd3.Parameters.AddWithValue("@Surname", Txt_LastName.Text);
                cmd3.Parameters.AddWithValue("@UserId", UserId);
                cmd3.ExecuteNonQuery();
                cmd3.Dispose();
            }
            // updating date of birth
            if (Txt_DateOfBirth.Text != "")
            {
                SqlCommand cmd4 = new SqlCommand("UPDATE UserLogin SET DateOfBirth = @DateOfBirth WHERE Id=@UserId", con);
                cmd4.Parameters.AddWithValue("@DateOfBirth", Txt_DateOfBirth.Text);
                cmd4.Parameters.AddWithValue("@UserId", UserId);
                cmd4.ExecuteNonQuery();
                cmd4.Dispose();
            }

            // update email address
            if (Txt_EmailAddress.Text != "")
            {
                SqlCommand cmd5 = new SqlCommand("UPDATE UserLogin SET EmailAddress = @EmailAddress WHERE Id=@UserId", con);
                cmd5.Parameters.AddWithValue("@EmailAddress", Txt_EmailAddress.Text);
                cmd5.Parameters.AddWithValue("@UserId", UserId);
                cmd5.ExecuteNonQuery();
                cmd5.Dispose();
            }

            // update phone number
            if (Txt_PhoneNumber.Text != "")
            {
                SqlCommand cmd6 = new SqlCommand("UPDATE UserLogin SET PhoneNumber = @PhoneNumber WHERE Id=@UserId", con);
                cmd6.Parameters.AddWithValue("@PhoneNumber", Txt_PhoneNumber.Text);
                cmd6.Parameters.AddWithValue("@UserId", UserId);
                cmd6.ExecuteNonQuery();
                cmd6.Dispose();
            }
            //update description
            if (Txt_Description.Text != "")
            {
                SqlCommand cmd7 = new SqlCommand("UPDATE UserLogin SET Description = @Description WHERE Id=@UserId", con);
                cmd7.Parameters.AddWithValue("@Description", Txt_Description.Text);
                cmd7.Parameters.AddWithValue("@UserId", UserId);
                cmd7.ExecuteNonQuery();
                cmd7.Dispose();
            }

            // update profile picture
            if (UploadProfilePicture.HasFile)
            {
                imageUrl = "~/Images/ProfilePicture/";
                string physicalFolder = Server.MapPath(imageUrl);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(UploadProfilePicture.FileName);
                fileName = Path.GetFileName(UploadProfilePicture.PostedFile.FileName);
                UploadProfilePicture.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));
                SqlCommand cmd8 = new SqlCommand("UPDATE UserLogin SET ProfilePicture = @ProfilePicture WHERE Id=@UserId", con);
                cmd8.Parameters.AddWithValue("@ProfilePicture", Convert.ToString(imageUrl + fileName));
                cmd8.Parameters.AddWithValue("@UserId", UserId);
                cmd8.ExecuteNonQuery();
            }
            con.Close();
        }
        catch
        {
            // when error occurs, the visibility of the label becomes true
            Lbl_UpdateData.Visible = true;
        }
    }

    protected void Ddl_Course_SelectedIndexChanged(object sender, EventArgs e)
    {
        // when drop down box item is different when it is selected
        try
        {
            // connectign dropdown box to course table
            con.Open(); // database is connection is open
            SqlCommand cmd = new SqlCommand("SELECT * FROM Course", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Ddl_Course.DataTextField = ds.Tables[0].Columns["Name"].ToString();
            Ddl_Course.DataValueField = ds.Tables[0].Columns["Id"].ToString();
            Ddl_Course.DataSource = ds.Tables[0];
            cmd.ExecuteNonQuery();

            con.Close();
        }
        catch {
            // otherwise label becomes visible
            Lbl_DatabaseError.Visible = true;
        }
    }

    protected void UploadProfilePicture_Load(object sender, EventArgs e)
    {
        
    }
}
