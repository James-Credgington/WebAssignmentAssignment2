using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.Adapters;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

public partial class Controls_WebUserControl : UserControl // Controls WebUSerControl is inherited by superclass UserControl
{
    // when the title and student is declared as the string
    String title;
    String student;

    protected void Page_Load(object sender, EventArgs e) // the code that is ran when the webpage is first loaded
    {

    }


    protected void Btn_SubmitEnquiry_Click(object sender, EventArgs e) // when the submit enquiry button is pressed
    {
        if (Page.IsValid) // if the page is valid
        {
            if (Rbl_gender.SelectedValue == "male") // if the radio button list selected value is male
            {
                title = "Mr"; // title is set with the value 'Mr'
            }
            else if (Rbl_gender.SelectedValue == "female") // if the radio button list selected value is female
            {
                title = "Miss"; // title is set with the value 'Miss'
            }
            else if (Rbl_gender.SelectedValue == "other") { // if the radio button list selected value is other
                title = ""; // title is set with the value ''
            }
            if (Rbl_Student.SelectedValue == "yes") // if the radiobutton list selected value is yes
            {
                student = "are"; // student is set with the value 'are'
            }
            else if (Rbl_Student.SelectedValue == "no") { // if the radio button list selected value is no
                student = "are not"; // student is set with the value 'are not'
            }
            // try statement to send an email when the user sends an enquiry
            try { 
                string fullName = Txt_FirstName.Text + " " + Txt_LastName.Text;
                string fileName = Server.MapPath("~/EmailTemplates/ContactForm.txt");
                string mailBody = File.ReadAllText(fileName);

                mailBody = mailBody.Replace("##Name##", fullName);
                mailBody = mailBody.Replace("##EmailAddress##", Txt_EmailAddress.Text);
                mailBody = mailBody.Replace("##PhoneNumber##", Txt_PhoneNumber.Text);
                mailBody = mailBody.Replace("##Gender##", title);
                mailBody = mailBody.Replace("##Student##", student);
                mailBody = mailBody.Replace("##EnquiryInformation##", Txt_EnquiryInformation.Text);

                MailMessage myMessage = new MailMessage();
                myMessage.Subject = "You have just made an Enquiry with Chesterfield College";
                myMessage.Body = mailBody;

                myMessage.From = new MailAddress("james.credgington@gmail.com", "The Higher Education Chesterfield College's Websites");
                myMessage.To.Add(new MailAddress(Txt_EmailAddress.Text, fullName));


                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);

                whenEmailsent.Visible = true;

                System.Threading.Thread.Sleep(5000);
            }
            // catch statement when the email does not send, email send label is set to be visible
            catch
                {
                    Lbl_EmailSent.Visible = true;
                }

        }
    }

    protected void Btn_Refresh_Click(object sender, EventArgs e) // when the refresh button is pressed
    {
        Response.Redirect(Request.Url.ToString()); // refreshes the current url
    }
}