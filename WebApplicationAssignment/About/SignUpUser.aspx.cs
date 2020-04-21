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

public partial class About_SignUp : BasePage /* when the About_SignUp class is inherited by super class BasePage */
{
    public String title, student, password; // variables 'title', 'student' and 'password that are declared as string and public 

    // start to the connection of the database
    public string strcon = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e) // a method for when the page loads on the website. Not to set anything
    {
        


    }


        protected void Btn_SubmitDetails_Click(object sender, EventArgs e) //when submit details button is pressed
        {
            if (Page.IsValid) // when the page is valid
            {

                lbl_whenEmailsent.Visible = true; // email sent label is set to be visisble
                System.Threading.Thread.Sleep(5000); // sleeps for 5 seconds
                if (CheckIfUserNameInDatabase()) // if username is checked in the database
                {

                    lbl_usernameValid.Visible = true; // username Valid label is set to be visible

                }
                else
                {
                    lbl_usernameValid.Visible = false; // username Valid label is set not to be visible
                    AddNewPerson(); // calling method 'AddNewPerson'
                    EmailGeneration(); //calling method 'EmailGeneration'
                    Response.Redirect("~/About/LogInUser.aspx"); // redirect to the LogInUser page
                }
            
            lbl_whenEmailsent.Visible = false; // email sent label is not visible
            
            }
        }
    public bool CheckIfUserNameInDatabase() // start of method to find the username within the database and returns boolean values only
    {
        bool count; // declaring the variable count with the data type as a boolean
        Lbl_DatabaseConnection.Visible = false; // setting the database connection label to be not visible
        // starting a connection using sql connection class and creating an object called con iwith parameter strcon
        SqlConnection con = new SqlConnection(strcon);

        // start of try section to whether the database will connect
        try
        {

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
        // if database won't connect, database connection label will become visible
        catch
        {
            Lbl_DatabaseConnection.Visible = true; 
        }
        finally //finally the database will select data whether the email address is equal to textbox input
        {
            SqlCommand cmd = new SqlCommand("SELECT * from UserLogin WHERE EmailAddress='" + Txt_EmailAddress.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count >= 1) // if the rows of the database that is followed by the sql statement above is more than 0
            {
                count = true; // count is declared be true;
            }
            else
            {
                count = false; // count is declared be false;
            }
        }
        return count; // return count variable


    }

    public void EmailGeneration() // start of a method for creating an email
    {
        lbl_whenEmailsent.Visible = false; // when email sent label is set to be not visible
        try /* start of try statement to see whether it will send the email. In process, uses the user input to 
        change certain bits of the message in the email*/
        {
            if (Rbl_gender.SelectedValue == "male")
            {
                title = "Mr";
            }
            else if (Rbl_gender.SelectedValue == "female")
            {
                title = "Miss";
            }
            else if (Rbl_gender.SelectedValue == "other")
            {
                title = "";
            }

            string fullName = Txt_FirstName.Text + " " + Txt_LastName.Text;
            string fileName = Server.MapPath("~/EmailTemplates/signUpUser.txt");
            string mailBody = File.ReadAllText(fileName);

            mailBody = mailBody.Replace("##Name##", fullName);
            mailBody = mailBody.Replace("##EmailAddress##", Txt_EmailAddress.Text);
            mailBody = mailBody.Replace("##Gender##", title);
            mailBody = mailBody.Replace("##Password##", Txt_Password.Text);


            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "You have joined the Chesterfield College's Social Network";
            myMessage.Body = mailBody;

            myMessage.From = new MailAddress("james.credgington@gmail.com", "The Higher Education Chesterfield College's Websites");
            myMessage.To.Add(new MailAddress(Txt_EmailAddress.Text, fullName));


            SmtpClient mySmtpClient = new SmtpClient();
            mySmtpClient.Send(myMessage);

            
        } // end of try statement

        // catch problems with sending an email
        catch {
            Lbl_EmailSent.Visible = true; // set the email sent label to be visible
            System.Threading.Thread.Sleep(5000); // set the website to be paused for 5 seconds
        }
    }
    public void AddNewPerson() // start of AddNewPerson method
    {

        SqlConnection con = new SqlConnection(strcon); // creating an instance of SqlConnection class with an object called con with parameter strcon

        if (con.State == ConnectionState.Closed) // when the connection state is closed
        {
            NewMethod(con); // new method is called with the constructor having a parameter of con.
        }

        // declaring an connection with the variable 'strConnString' which has a string data type
        string strConnString = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;

        // sql command to add data to the database
        SqlCommand cmd = new SqlCommand("INSERT INTO UserLogin (FirstName, Surname, DateOfBirth, Gender, EmailAddress, PhoneNumber, CurrentStudent, Password, ProfilePicture, CourseId) VALUES (@FirstName, @Surname, @DateOfBirth, @Gender, @EmailAddress, @PhoneNumber, @CurrentStudent, @Password, @ProfilePicture, @CourseId)", con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        // changes values in the sql command to  add values
        cmd.Parameters.AddWithValue("@FirstName", Txt_FirstName.Text.Trim());
        cmd.Parameters.AddWithValue("@Surname", Txt_LastName.Text.Trim());
        cmd.Parameters.AddWithValue("@DateOfBirth", Txt_DateOfBirth.Text);
        cmd.Parameters.AddWithValue("@Gender", Rbl_gender.SelectedValue);
        cmd.Parameters.AddWithValue("@EmailAddress", Txt_EmailAddress.Text);
        cmd.Parameters.AddWithValue("@PhoneNumber", Txt_PhoneNumber.Text.Trim());
        cmd.Parameters.AddWithValue("@CurrentStudent", Rbl_student.SelectedValue);
        cmd.Parameters.AddWithValue("@Password", Txt_Password.Text.Trim());
        cmd.Parameters.AddWithValue("@ProfilePicture", "../Images/ProfilePicture/Default.JPG");
        cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(Ddl_Course.SelectedItem.Value));

        cmd.ExecuteNonQuery();
        con.Close(); // close the connection
        con.Dispose();
    }

    private static void NewMethod(SqlConnection con)  // when the newMethod is set with the parameter calling an object called SqlCOnnection
    {
        con.Open(); // re-opens the connection
    }

    protected void Btn_Refresh_Click(object sender, EventArgs e)  // when the refresh button is pressed
        {
            Response.Redirect(Request.Url.ToString()); // refreshes the page
        }
    }
