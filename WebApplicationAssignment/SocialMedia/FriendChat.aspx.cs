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
public partial class SocialMedia_FriendChat : BasePage
{
    // declaring variables as public and under various data types
    public string firstName, lastName, FirstName, LastName, UserId;
    public int Id, userId, friendUserId;
    SqlConnection conn2, conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        //when page loads up getting values from the query strings and cookies
        Lbl_DatabaseError.Visible = false;
        firstName = Request.QueryString["Name"];
        lastName = Request.QueryString["LastName"];
        Lbl_Title.Text = firstName + " " + lastName;
        UserId = Request.Cookies["Id"].Value.ToString();
        // try statement getting values based on the userId
        try
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString2"].ConnectionString);
            conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);
            LoadChatbox();


            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Friend WHERE FirstName = @FirstName AND Surname = @Surname AND UserId = @UserId", conn);
            cmd.Parameters.AddWithValue("@FirstName", firstName);
            cmd.Parameters.AddWithValue("@Surname", lastName);
            cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
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
            SqlCommand cmd4 = new SqlCommand("SELECT * FROM UserLogin WHERE FirstName = @FirstName AND Surname = @Surname ", conn);
            cmd4.Parameters.AddWithValue("@FirstName", firstName);
            cmd4.Parameters.AddWithValue("@Surname", lastName);

            SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            SqlDataReader reader4 = cmd4.ExecuteReader();
            if (dt4.Rows.Count > 0)
            {
                if (reader4.Read())
                {
                    userId = Convert.ToInt32(reader4[0]);
                    Console.WriteLine(userId);
                }
                reader4.Close();

            }

            /* finding UserId in friend table*/
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
        catch {
            // comes up when there is error relating to the database connection
            Lbl_DatabaseError.Visible = true;
        }
    }
    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        //when back button is pressed and is redirected to that page
        Response.Redirect("../SocialMedia/AddFriend.aspx");
    }
    public void LoadChatbox()
    {
        // this method loads all the messages that have been posted on this chat
        try
        {
            DateTime date = DateTime.Now;
            string date3 = date.ToString("dd-MM-yyyy");
            //string agent = Session["Admin"].ToString();
            conn2.Open();
            string str = "SELECT * FROM Message INNER JOIN UserLogin ON Message.UserId = UserLogin.Id  WHERE Message.UserId=" + Convert.ToInt32(UserId) + " AND Message.FriendId=" + Id + " OR Message.UserId=" + userId + " AND Message.FriendId=" + friendUserId;
            SqlCommand cmd = new SqlCommand(str, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList3.DataSource = ds;
            DataList3.DataBind();

            ScriptManager.RegisterStartupScript(this.Page, typeof(Panel), "PanelChatContent", ";ScrollToBottom();", true);
            conn2.Close();
        }
        catch {
            // catches any errors and this label comes up
            Lbl_DatabaseError.Visible = true;
        }
    }
    


    protected void Timer1_Tick(object sender, EventArgs e)
    {
        // when timer is ticking this method runs
        LoadChatbox();
    }

    protected void Btn_Send_Click(object sender, EventArgs e)
    {
        // when send button is presseed, message is added to the database
        try
        {

            DateTime date = DateTime.Now;
            string date2 = date.ToString("dd-MM-yyyy");
            string time = date.ToString("HH:mm:ss");
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO Message (FriendId, UserId, MessageText, DateOfMessageSent, TimeOfMessageSent) VALUES (@FriendId, @UserId, @MessageText, @DateOfMessageSent, @TimeOfMessageSent)", conn);
            cmd.Parameters.AddWithValue("@FriendId", Id);
            cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
            cmd.Parameters.AddWithValue("@MessageText", Txt_Message.Text);
            cmd.Parameters.AddWithValue("@DateOfMessageSent", DateTime.ParseExact(date2, "dd-MM-yyyy", null));
            cmd.Parameters.AddWithValue("@TimeOfMessageSent", DateTime.ParseExact(time, "HH:mm:ss", null));
            cmd.ExecuteNonQuery();

            Txt_Message.Text = "";
            LoadChatbox();

            conn.Close();
        }
        catch {
            // catches any errors that occur, error label appears */
            Lbl_DatabaseError.Visible = true;
        }
    }
}