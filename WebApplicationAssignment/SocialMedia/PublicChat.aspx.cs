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
public partial class SocialMedia_PublicChat : BasePage
{
    public string firstName, lastName, FirstName, LastName, UserId, conn;
    public int Id, userId, friendUserId;
    public SqlConnection con;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // when web page first loads up
        Lbl_DatabaseError.Visible = false;
        // getting the values from cookes
        UserId = Request.Cookies["Id"].Value.ToString();


        // try statement contains the code for connecting to the database
        try
        {
            conn = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
            con = new SqlConnection(conn);
            LoadChatbox();
        }
        catch {
            // otherwise if errors appear on try statement it is set to be visible
            Lbl_DatabaseError.Visible = true;
        }

    }

    public void LoadChatbox()
    {
        // method for loading all methods in messaging app
        Lbl_DatabaseError.Visible = false;
        try { 
           
            DateTime date = DateTime.Now;
            string date3 = date.ToString("dd-MM-yyyy");
        //string agent = Session["Admin"].ToString();
            con.Open();
        string str = "SELECT * FROM Message INNER JOIN UserLogin ON Message.UserId = UserLogin.Id  WHERE Message.FriendId IS NULL";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList3.DataSource = ds;
            DataList3.DataBind();

            ScriptManager.RegisterStartupScript(this.Page, typeof(Panel), "PanelChatContent", ";ScrollToBottom();", true);
            con.Close();
        }
        catch
        {
            // labels appears to be true when errors will be caught
            Lbl_DatabaseError.Visible = true;
        }
    }



    protected void Timer1_Tick(object sender, EventArgs e)
    {
        // each time the error ticks it loads the chatbox
        LoadChatbox();
    }

    protected void Btn_Send_Click(object sender, EventArgs e)
    {
        // when send button is pressed, it sends the messsage under the try statement
        Lbl_DatabaseError.Visible = false;
        try { 
            DateTime date = DateTime.Now;
            string date2 = date.ToString("dd-MM-yyyy");
            string time = date.ToString("HH:mm:ss");
            con.Open();
            // when a text message is sent
            if (FileUpload1.Visible == false && Txt_Video.Visible == false)
            {


                SqlCommand cmd = new SqlCommand("INSERT INTO Message (UserId, MessageText, DateOfMessageSent, TimeOfMessageSent) VALUES (@UserId, @MessageText, @DateOfMessageSent, @TimeOfMessageSent)", con);

                cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
                cmd.Parameters.AddWithValue("@MessageText", Txt_Message.Text);
                cmd.Parameters.AddWithValue("@DateOfMessageSent", DateTime.ParseExact(date2, "dd-MM-yyyy", null));
                cmd.Parameters.AddWithValue("@TimeOfMessageSent", DateTime.ParseExact(time, "HH:mm:ss", null));
                cmd.ExecuteNonQuery();

                Txt_Message.Text = "";
            con.Close();
            LoadChatbox();



            }
            // when an image is sent
            else if (FileUpload1.Visible == true && Txt_Video.Visible == false)
            {
                if (FileUpload1.HasFile)
                {
                    string imageUrl = "~/Images/Message/";
                    string physicalFolder = Server.MapPath(imageUrl);
                    string fileName = Guid.NewGuid().ToString();
                    string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                    fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO Message (UserId, MessageText, PictureInserted, DateOfMessageSent, TimeOfMessageSent)  VALUES(@UserId, @MessageText, @PictureInserted, @DateOfMessageSent, @TimeOfMessageSent)", con);
                    cmd2.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
                    cmd2.Parameters.AddWithValue("@MessageText", Txt_Message.Text);
                    cmd2.Parameters.AddWithValue("@PictureInserted", Convert.ToString(imageUrl + fileName));
                    cmd2.Parameters.AddWithValue("@DateOfMessageSent", DateTime.ParseExact(date2, "dd-MM-yyyy", null));
                    cmd2.Parameters.AddWithValue("@TimeOfMessageSent", DateTime.ParseExact(time, "HH:mm:ss", null));
                cmd2.ExecuteNonQuery();

                    Txt_Message.Text = "";
                con.Close();
                LoadChatbox();

                    


                }
            }
            // when an video is sent
            else if (Txt_Video.Visible == true && FileUpload1.Visible == false)
            {

                SqlCommand cmd2 = new SqlCommand("INSERT INTO Message (UserId, MessageText, VideoInserted, DateOfMessageSent, TimeOfMessageSent)  VALUES(@UserId, @MessageText, @VideoInserted, @DateOfMessageSent, @TimeOfMessageSent)", con);
                cmd2.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
                cmd2.Parameters.AddWithValue("@MessageText", Txt_Message.Text);
                cmd2.Parameters.AddWithValue("@VideoInserted", Txt_Video.Text);
                cmd2.Parameters.AddWithValue("@DateOfMessageSent", DateTime.ParseExact(date2, "dd-MM-yyyy", null));
                cmd2.Parameters.AddWithValue("@TimeOfMessageSent", DateTime.ParseExact(time, "HH:mm:ss", null));
            cmd2.ExecuteNonQuery();

                Txt_Message.Text = "";
            con.Close();
            LoadChatbox();

                
            }

        }
        catch
        {
            // catches errors, sets the label to be visible
            Lbl_DatabaseError.Visible = true;
        }
    }

    protected void Btn_Switch_Click(object sender, EventArgs e)
    {
        // when switch button is pressed, file upload is visible and video text box is not visible
            FileUpload1.Visible = true;
        Txt_Video.Visible = false;
            
        
    }

    protected void Btn_YouTube_Click(object sender, EventArgs e)
    { 
        // when you tube button is pressed, file upload is not visible and video text box is visible
        Txt_Video.Visible = true;
        FileUpload1.Visible = false;
    }

    protected void Btn_Message_Click(object sender, EventArgs e)
    {
        // when message button is pressed, file upload and video text box are not visible
        FileUpload1.Visible = false;
        Txt_Video.Visible = false;
    }
}