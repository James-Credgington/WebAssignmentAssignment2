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


public partial class SocialMedia_Groupchat : BasePage
{
    // declaring all variables as public with a range of data types
    public String UserId, firstName, lastName, Id, fullName, imageUrl, imageLink, FirstName, LastName, name, surName;
    public int groupId, friendUserId, userId, userId2, ID;
    public SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    { 
        // when the page first loads, and the cookies are null
        if (Request.Cookies["Id"] == null)
        {
            // redirect to login user page
            Response.Redirect("../About/LogInUser.aspx");
        }
        else
        {
            // otherwise

            // link friend table to checklist 
            Lbl_DatabaseError.Visible = false;
            try
            {

                    UserId = Request.Cookies["Id"].Value.ToString();
                    userId = Convert.ToInt32(Request.Cookies["Id"].Value);
                    string conn = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString2"].ConnectionString;
                    con = new SqlConnection(conn);
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM Friend WHERE UserId = @UserId", con);
                    cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            Id = dt.Rows[i]["Id"].ToString();
                            firstName = dt.Rows[i]["FirstName"].ToString();
                            lastName = dt.Rows[i]["Surname"].ToString();
                            fullName = firstName + " " + lastName;
                            Chk_Friends.Items.Add(new ListItem(fullName, Id));

                        }
                    }

                    con.Close();
                // outputting all groupchats the user that is logged on belongs too
                    Session["UserId"] = UserId; // userId value is from the value passed form the previous page
                    using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())
                    {


                        // when myFriend updates the courses in the GroupChats

                        var myfriend = from groupChat in myEntities.GroupChats
                                       join groupMembers in myEntities.GroupMembers on groupChat.Id equals groupMembers.GroupChatId
                                       where groupMembers.FriendId == userId
                                       select new groupChat
                                       {
                                           Name = groupChat.Name,
                                           ProfilePicture = groupChat.ProfilePicture.ToString(),


                                       };
                        Repeater1.DataSource = myfriend.ToList();
                        Repeater1.DataBind();
                    }
                

            }
            catch
            {
                // otherwise when error occurs, this label becomes visible -->
                Lbl_DatabaseError.Visible = true;

            }
        }

    }

    protected void Chk_Friends_SelectedIndexChanged(object sender, EventArgs e)
    {
        // when an item in the checklist is selected
        try
        {
            con.Open(); // database is connection is open
            SqlCommand cmd = new SqlCommand("SELECT * FROM Friend WHERE UserId = @UserId", con);
            cmd.Parameters.AddWithValue("@UserId", UserId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            Chk_Friends.DataSource = ds.Tables[0];
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch {
            // catches errors with the label being set visible
            Lbl_DatabaseError.Visible = true;
        }
    }

    protected void Btn_AddGroupChat_Click(object sender, EventArgs e)
    {
        // when add groupchat button is pressed
        // creating a groupchat and adding members to the group chat
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO GroupChat (Name, ProfilePicture, AdministratorId) VALUES (@Name, @ProfilePicture, @AdministratorId)", con);
            cmd.Parameters.AddWithValue("@Name", Txt_NameOfChat.Text);
            cmd.Parameters.AddWithValue("@AdministratorId", Convert.ToInt32(UserId));
            imageUrl = "~/Images/GroupChatPicture/";
            if (UploadGroupChatPicture.HasFile)
            {

                string physicalFolder = Server.MapPath(imageUrl);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(UploadGroupChatPicture.FileName);
                fileName = Path.GetFileName(UploadGroupChatPicture.PostedFile.FileName);
                UploadGroupChatPicture.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));
                imageLink = Convert.ToString(imageUrl + fileName);
                cmd.Parameters.AddWithValue("@ProfilePicture", Convert.ToString(imageUrl + fileName));

            }
            else if (!UploadGroupChatPicture.HasFile)
            {
                imageLink = "../Images/GroupChatPicture/Default.JPG";
                cmd.Parameters.AddWithValue("@ProfilePicture", imageLink);

            }
            cmd.ExecuteNonQuery();

            SqlCommand cmd7 = new SqlCommand("SELECT * FROM UserLogin WHERE FirstName = @FirstName AND Surname = @Surname", con);
            cmd7.Parameters.AddWithValue("@FirstName", firstName);
            cmd7.Parameters.AddWithValue("@Surname", lastName);

            SqlDataAdapter da4 = new SqlDataAdapter(cmd7);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            SqlDataReader reader4 = cmd7.ExecuteReader();
            if (dt4.Rows.Count > 0)
            {
                if (reader4.Read())
                {
                    userId2 = Convert.ToInt32(reader4[0]);
                    Console.WriteLine(userId2);
                }
                reader4.Close();

            }
            /* finding UserId in friend table*/
            SqlCommand cmd5 = new SqlCommand("SELECT * FROM UserLogin WHERE Id = @UserId", con);
            cmd5.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataTable dt5 = new DataTable();
            da5.Fill(dt5);
            SqlDataReader reader5 = cmd5.ExecuteReader();
            if (dt5.Rows.Count > 0)
            {
                if (reader5.Read())
                {
                    FirstName = reader5[1].ToString();
                    LastName = reader5[2].ToString();
                }
                reader5.Close();
            }

            SqlCommand cmd2 = new SqlCommand("SELECT * FROM GroupChat WHERE Name = @Name AND ProfilePicture = @ProfilePicture AND AdministratorId = @AdministratorId", con);
            cmd2.Parameters.AddWithValue("@Name", Txt_NameOfChat.Text);
            cmd2.Parameters.AddWithValue("@AdministratorId", Convert.ToInt32(UserId));
            cmd2.Parameters.AddWithValue("@ProfilePicture", imageLink);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            SqlDataReader reader = cmd2.ExecuteReader();
            if (dt2.Rows.Count > 0)
            {
                if (reader.Read())
                {
                    groupId = Convert.ToInt32(reader[0]);
                }
                reader.Close();



            }
            SqlCommand cmd3 = new SqlCommand("INSERT INTO GroupMember (FriendId, GroupChatId) VALUES (@FriendId, @GroupChatId)", con);
            cmd3.Parameters.AddWithValue("@FriendId", userId);
            cmd3.Parameters.AddWithValue("@GroupChatId", groupId);
            cmd3.ExecuteNonQuery();
            cmd3.Dispose();

            for (int I = 0; I <= Chk_Friends.Items.Count - 1; I++)
            {
                if (Chk_Friends.Items[I].Selected == true)
                {
                    SqlCommand cmd8 = new SqlCommand("SELECT * FROM Friend WHERE Id = @FriendId AND UserId = @UserId", con);
                    cmd8.Parameters.AddWithValue("@FriendId", Convert.ToInt32(Chk_Friends.Items[I].Value));
                    cmd8.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
                    SqlDataAdapter da6 = new SqlDataAdapter(cmd8);
                    DataTable dt6 = new DataTable();
                    da6.Fill(dt6);
                    SqlDataReader reader6 = cmd8.ExecuteReader();
                    if (dt6.Rows.Count > 0)
                    {
                        if (reader6.Read())
                        {
                            name = reader6[1].ToString();
                            surName = reader6[2].ToString();
                        }
                        reader6.Close();
                    }
                    SqlCommand cmd9 = new SqlCommand("SELECT * FROM UserLogin WHERE FirstName = @FirstName AND Surname = @Surname", con);
                    cmd9.Parameters.AddWithValue("@FirstName", name);
                    cmd9.Parameters.AddWithValue("@Surname", surName);
                    SqlDataAdapter da7 = new SqlDataAdapter(cmd9);
                    DataTable dt7 = new DataTable();
                    da7.Fill(dt7);
                    SqlDataReader reader7 = cmd9.ExecuteReader();
                    if (dt7.Rows.Count > 0)
                    {
                        if (reader7.Read())
                        {
                            ID = Convert.ToInt32(reader7[0]);
                        }
                        reader7.Close();
                    }

                    SqlCommand cmd4 = new SqlCommand("INSERT INTO GroupMember (FriendId, GroupChatId) VALUES (@FriendId, @GroupChatId)", con);
                    cmd4.Parameters.AddWithValue("@FriendId", ID);
                    cmd4.Parameters.AddWithValue("@GroupChatId", groupId);
                    cmd4.ExecuteNonQuery();
                }
            }
            con.Close();
        }
        catch {
            // otherwise catch errors within the code when this label appears
            Lbl_DatabaseError.Visible = true;
        }
    }

}