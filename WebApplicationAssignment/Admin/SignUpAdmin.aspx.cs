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


public partial class Admin_SignUpAdmin : BasePage /* when the About_SignUp class is inherited by super class BasePage */
{
    public String password, title; // variables 'title' and 'password that are declared as string and public 

    // start to the connection of the database
    public string strcon = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)// a method for when the page loads on the website. Not to set anything
    {

    }

    protected void Btn_SubmitDetails_Click(object sender, EventArgs e) // when the submitDetails button is pressed
    { 

        if (Page.IsValid) // when the page is valid
        {
            Lbl_wrongPassword.Visible = false;
            if (Txt_PIN.Text == "01246 500500")
            {
                lbl_whenEmailsent.Visible = true; // whenEmailsent label is visible
                System.Threading.Thread.Sleep(5000); // page then sleeps for 5 seconds

                if (CheckIfUserNameInDatabase()) // checks if the username is in the database
                {

                    lbl_usernameValid.Visible = true; //usernameValid label is set to be visible


                }
                else
                {
                    lbl_usernameValid.Visible = false; // usernameValidLabel is set not to be visible
                    AddNewPerson(); // function calls to add new data into the database
                    EmailGeneration(); // functions called to create an email with user information
                    Response.Redirect("~/Admin/LogInAdmin.aspx"); // redirects to the LogInAdmin page
                }
                lbl_whenEmailsent.Visible = false; //whenEmailsent label is set not to be visible
            }
            else {
                Lbl_wrongPassword.Visible = true;
            }
        }
    }

    public bool CheckIfUserNameInDatabase() // function to check if the username is in the database
    {
        bool count; // declaring an local variable as a boolean called count
        SqlConnection con = new SqlConnection(strcon); // starting a new connection for the database when the link to the database is a public string set as a parameter

        // start of the try statement to connect to the database
        try 
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        //catches any issues that happen involving the database (may not connect)
        catch
        {

        }
        // finally statement which adds the data into the database
        finally
        {
            SqlCommand cmd = new SqlCommand("SELECT * from WebsiteAdministrator WHERE EmailAddress='" + Txt_EmailAddress.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count >= 1)
            {
                count = true;
            }
            else
            {
                count = false;
            }
        }
        return count; // reutrns the count variable back to where it was previously called
    }

    public void EmailGeneration() // function that generates the email
    {
        lbl_whenEmailsent.Visible = false; // whenEmailsent is set to be visible

        // try statement which tries to send an email
        try
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
            string fileName = Server.MapPath("~/EmailTemplates/signUpAdmin.txt");
            string mailBody = File.ReadAllText(fileName);

            mailBody = mailBody.Replace("##Name##", fullName);
            mailBody = mailBody.Replace("##EmailAddress##", Txt_EmailAddress.Text);
            mailBody = mailBody.Replace("##Gender##", title);
            mailBody = mailBody.Replace("##Password##", Txt_Password.Text);


            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "You have created an Administrator's Account with Us";
            myMessage.Body = mailBody;

            myMessage.From = new MailAddress("james.credgington@gmail.com", "The Higher Education Chesterfield College's Websites");
            myMessage.To.Add(new MailAddress(Txt_EmailAddress.Text, fullName));


            SmtpClient mySmtpClient = new SmtpClient();
            mySmtpClient.Send(myMessage);
        }
        // catch statement starts when the email can't be sent
        catch {
            Lbl_EmailSent.Visible = true;
            System.Threading.Thread.Sleep(5000);
        }
        
    }
    public void AddNewPerson() // function to add a new person into the database
    {
        Lbl_DatabaseConnection.Visible = false; // setting the database conenction label to be inviisble
        lbl_whenEmailsent.Visible = false; // when email sent label to be invisible
        SqlConnection con = new SqlConnection(strcon); // new isntance of the SqlConnection class as an object called con to connect the database
      
            if (con.State == ConnectionState.Closed) // if the connection of the database is closed
            {
                NewMethod(con); // calls the NewMethod with the string for  connecting to the database as a parameter in the constructor

            }

            // connects to database and inserts data into the database
            String strConnString = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand("INSERT INTO WebsiteAdministrator ([FirstName], [Surname], [DateOfBirth], [Gender], [EmailAddress], [Password], [LoggedOn]) VALUES " +
                "(@FirstName, @Surname, @DateOfBirth, @Gender, @EmailAddress, @Password, @LoggedOn)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            cmd.Parameters.AddWithValue("@FirstName", Txt_FirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@Surname", Txt_LastName.Text.Trim());
            cmd.Parameters.AddWithValue("@DateOfBirth", Txt_DateOfBirth.Text.Trim());
            cmd.Parameters.AddWithValue("@Gender", Rbl_gender.SelectedValue);
            cmd.Parameters.AddWithValue("@EmailAddress", Txt_EmailAddress.Text.Trim());
        cmd.Parameters.AddWithValue("@Password", Txt_Password.Text.Trim());
            cmd.Parameters.AddWithValue("@LoggedOn", false);

            cmd.ExecuteNonQuery();
            con.Close();
            con.Dispose();
    }

    private static void NewMethod(SqlConnection con) // starts of a method called NewMethod which have a primitive data type of SqlConnection to connect the database
    { 
        con.Open(); // opens the connection to the database
    }

    protected void Btn_Refresh_Click(object sender, EventArgs e) // when the refresh button is pressed
    {
        Response.Redirect(Request.Url.ToString()); // refreshes the page
    }
}