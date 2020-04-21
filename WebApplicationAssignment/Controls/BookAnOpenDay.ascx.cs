using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.IO;
public partial class Controls_BookAnOpenDay : System.Web.UI.UserControl  
    /* when the Controls_BookAnOpenDay class is inherited by super class System.Web.UI.UserControl */
{
    protected void Page_Load(object sender, EventArgs e) // function runs when the page is first loaded
    {

    }
    String title; // when the title is first declared as the string
    

    protected void Btn_SubmitEnquiry_Click(object sender, EventArgs e) // when the submit enquiry button is pressed
    {
        if (Page.IsValid) // when the page is pressed
        {

            if (Rbl_gender.SelectedValue == "male")  // when the gender selected value is male
            {
                title = "Mr"; // title has the value mr
            }
            else if (Rbl_gender.SelectedValue == "female") // when the gender selected value is female
            {
                title = "Miss"; // title has the value miss
            }
            else if (Rbl_gender.SelectedValue == "other") // when the gender selected value is other
            {
                title = ""; // title has the value nothing
            }
            Lbl_EmailSent.Visible = false; // email sent label is set not to be visible

            try // try statement to see if the email is going to be sent. Replaces text in the appropriate textfile. 
            {
                string fullName = Txt_FirstName.Text + " " + Txt_LastName.Text;
                string fileName = Server.MapPath("~/EmailTemplates/BookAnOpenDay.txt");
                string mailBody = File.ReadAllText(fileName);

                mailBody = mailBody.Replace("##Name##", fullName);
                mailBody = mailBody.Replace("##EmailAddress##", Txt_EmailAddress.Text);
                mailBody = mailBody.Replace("##PhoneNumber##", Txt_PhoneNumber.Text);
                mailBody = mailBody.Replace("##Gender##", title);
                mailBody = mailBody.Replace("##dateOfOpenDay##", PickOpenDayList.SelectedValue);


                MailMessage myMessage = new MailMessage();
                myMessage.Subject = "You have just booked an Open Day at Chesterfield College";
                myMessage.Body = mailBody;

                myMessage.From = new MailAddress("james.credgington@gmail.com", "The Higher Education Chesterfield College's Websites");
                myMessage.To.Add(new MailAddress(Txt_EmailAddress.Text, fullName));


                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);

                whenEmailsent.Visible = true;
            }
            // catch variable says email sent label is set to be visible
            catch
            {
                Lbl_EmailSent.Visible = true;
            }

            System.Threading.Thread.Sleep(5000);
        }
    }

    protected void Btn_Refresh_Click(object sender, EventArgs e) // when the refresh button is clicked
    {
        Response.Redirect(Request.Url.ToString()); // page is refreshed
    }
}