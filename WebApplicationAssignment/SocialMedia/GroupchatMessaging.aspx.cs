using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class SocialMedia_GroupchatMessaging : BasePage
{
    // declaring variables with all data types and setting them as public
    public string NameOfChat, FirstName, LastName, UserId;
    public int Id, userId, friendUserId, GroupMemberId;
    SqlConnection conn2, conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        // when the page first loads up
        Lbl_DatabaseError.Visible = false;
        // getting basic information about teh group chat and displaying including name of the groupchat as well as members. Also get other data too relevant for later on
        try
        {
            
            conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString2"].ConnectionString);
            LoadChatbox();

            NameOfChat = Request.QueryString["Name"];
            UserId = Request.Cookies["Id"].Value.ToString();
            Lbl_Title.Text = NameOfChat;
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM GroupChat WHERE Name = @Name", conn);
            cmd.Parameters.AddWithValue("@Name", NameOfChat);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            if (dt.Rows.Count > 0)
            {
                if (reader.Read())
                {
                    Id = Convert.ToInt32(reader[0]);
                }
                reader.Close();
            }

            SqlCommand cmd5 = new SqlCommand("SELECT * FROM GroupMember WHERE FriendId = @FriendId AND GroupChatId = @GroupChatId", conn);
            cmd5.Parameters.AddWithValue("@FriendId", Convert.ToInt32(UserId));
            cmd5.Parameters.AddWithValue("@GroupChatId", Id);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataTable dt5 = new DataTable();
            da5.Fill(dt5);
            SqlDataReader reader5 = cmd5.ExecuteReader();
            if (dt.Rows.Count > 0)
            {
                if (reader5.Read())
                {
                    GroupMemberId = Convert.ToInt32(reader5[0]);
                }
                reader5.Close();
            }
            conn.Close();
            using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())
            {


                // selecting all group members in a specific group chat

                var myfriend = from groupMember in myEntities.GroupMembers
                               join userLogin in myEntities.UserLogins on groupMember.FriendId equals userLogin.Id
                               where groupMember.GroupChatId == Id
                               select new groupMember
                               {
                                   Id = userLogin.Id.ToString(),
                                   FirstName = userLogin.FirstName.ToString(),
                                   Surname = userLogin.Surname.ToString(),
                                   ProfilePicture = userLogin.ProfilePicture.ToString(),

                               };
                Repeater1.DataSource = myfriend.ToList();
                Repeater1.DataBind();
            }

            conn.Open();




        SqlCommand cmd3 = new SqlCommand("SELECT * FROM UserLogin WHERE Id = @UserId", conn);
        cmd3.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        SqlDataReader reader3 = cmd3.ExecuteReader();
        if (dt3.Rows.Count > 0)
        {
            if (reader3.Read())
            {
                FirstName = reader3[1].ToString();
                LastName = reader3[2].ToString();
            }
            reader3.Close();
            SqlCommand cmd2 = new SqlCommand("SELECT * FROM Friend WHERE FirstName = @FirstName AND Surname = @Surname AND UserId = @UserId", conn);
            cmd2.Parameters.AddWithValue("@FirstName", FirstName);
            cmd2.Parameters.AddWithValue("@Surname", LastName);
            cmd2.Parameters.AddWithValue("@UserId", userId);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            if (dt2.Rows.Count > 0)
            {
                if (reader2.Read())
                {
                    friendUserId = Convert.ToInt32(reader2[0]);
                    Console.WriteLine(friendUserId);
                }
                reader2.Close();
            }
        }



        conn.Close();
        }
        catch
        {
            // catches database errors and the label is set to be visible
            Lbl_DatabaseError.Visible = true;
        }
    }
    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        // when back button is pressed gets redirected to this page
        Response.Redirect("../SocialMedia/Groupchat.aspx");
    }
    public void LoadChatbox()
    {
        // method for loading all messages in the groupchat
        try { 
            DateTime date = DateTime.Now;
            string date3 = date.ToString("dd-MM-yyyy");
            //string agent = Session["Admin"].ToString();
            conn2.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM GroupMessage INNER JOIN GroupMember ON GroupMessage.GroupMemberId = GroupMember.Id INNER JOIN UserLogin ON GroupMember.FriendId = UserLogin.Id WHERE GroupMember.GroupChatId = @GroupChatId", conn2);
            cmd.Parameters.AddWithValue("@GroupChatId", Id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList3.DataSource = ds;
            DataList3.DataBind();

            ScriptManager.RegisterStartupScript(this.Page, typeof(Panel), "PanelChatContent", ";ScrollToBottom();", true);
            conn2.Close();
        }
        catch {
            // catches any errors from the try statement above and set the label to be visible
            Lbl_DatabaseError.Visible = true;
        }
    }



    protected void Timer1_Tick(object sender, EventArgs e)
    {
        // every time the timer ticks, the chatbox reloads
        LoadChatbox();
    }

    protected void Btn_Send_Click(object sender, EventArgs e)
    {
        // when send button is selected it adds a message
        try {
            DateTime date = DateTime.Now;
            string date2 = date.ToString("dd-MM-yyyy");
            string time = date.ToString("HH:mm:ss");
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO GroupMessage (GroupMemberId, MessageText, DateOfMessageSent, TimeOfMessageSent) VALUES (@GroupMemberId, @MessageText, @DateOfMessageSent, @TimeOfMessageSent)", conn);
            cmd.Parameters.AddWithValue("@GroupMemberId", GroupMemberId);
            cmd.Parameters.AddWithValue("@MessageText", Txt_Message.Text);
            cmd.Parameters.AddWithValue("@DateOfMessageSent", DateTime.ParseExact(date2, "dd-MM-yyyy", null));
            cmd.Parameters.AddWithValue("@TimeOfMessageSent", DateTime.ParseExact(time, "HH:mm:ss", null));
            cmd.ExecuteNonQuery();

                Txt_Message.Text = "";
                LoadChatbox();
        
            conn.Close();
        }
        catch {
            // catches any errors that come up form the previous try statement and output that label
            Lbl_DatabaseError.Visible = true;
        }
    }
}