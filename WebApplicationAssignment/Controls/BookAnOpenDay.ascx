<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookAnOpenDay.ascx.cs" Inherits="Controls_BookAnOpenDay" %>
<style type="text/css">
    .auto-style1 {
        height: 29px;
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<script>/*javascript function to refresh the page */
    function refresh() {
        window.location.refresh();
    }
</script>

<!-- update panel for a form to sent an book an open day. All textboxes are validated to make sure something is typed into the textbox and some of them, e.g.
    email is check to see if it is formatted as a real email address. With a refresh button to refresh the page which clears the form if the user is 
    required to start over again and submit enquiry which sends the data to the user via email-->

<asp:UpdatePanel ID="UpdatePanel1" runat="server">

    <ContentTemplate>
    <table runat="server" class="form">
        <tr>
            <td class="auto-style2">First Name</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_FirstName" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateFirstName" runat="server" ErrorMessage="Type in a first name please" ControlToValidate="Txt_FirstName" 
                CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_LastName" runat="server"></asp:TextBox></td>
            <td class="contactForm">
                <asp:RequiredFieldValidator ID="validateLastName" runat="server" ErrorMessage="Type in a last name please" ControlToValidate="Txt_LastName" 
                    CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">DOB</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_DateOfBirth" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateDOB" runat="server" ErrorMessage ="Type in a date of birth please" ControlToValidate="Txt_DateOfBirth" 
                CssClass="errorMessage" /><br />
                <asp:RangeValidator ID="rangeDOB" runat="server" ControlToValidate="Txt_DateOfBirth" CssClass="errorMessage" ErrorMessage="You're too young to do higher education." 
                    MaximumValue="31/08/2002" MinimumValue="01/01/1950" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td class="auto-style2">
                <asp:RadioButtonList ID="Rbl_gender" runat="server">
                    <asp:ListItem selected="True" Text="Male" Value="male" />
                    <asp:ListItem Text="Female" Value="female"/>
                    <asp:ListItem Text="Other" Value="other" />
                </asp:RadioButtonList>
            </td>
            <td class="contactForm">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_EmailAddress" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateEmailAddress" runat="server" ErrorMessage="Type in an email address please" 
                ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" /><br /><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    EnableClientScript="True" ErrorMessage="Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" 
                    CssClass="errorMessage" /></td>
        </tr>
        <tr>
            <td class="auto-style2">Phone Number</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_PhoneNumber" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validatePhoneNumber" runat="server" ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" 
                ErrorMessage="Type in an phone number please" /><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" EnableClientScript="True" ErrorMessage="Invalid Phone Number has been entered" 
                    ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" 
                    ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Open Day Date</td>
            <td class="auto-style2"><asp:DropDownList ID="PickOpenDayList" CssClass="dropDown" runat="server"  AutoPostBack="True" Width="100%">
                        <asp:ListItem>29th January 2020 4.30pm - 7pm</asp:ListItem>
                        <asp:ListItem>17th March 2020 4.30pm - 7pm</asp:ListItem>
                        <asp:ListItem>13th June 2020 10.30am - 1.30pm</asp:ListItem>
                    </asp:DropDownList></td>
            <td class="contactForm"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="Btn_Refresh" runat="server" SkinID="Button" CssClass="masterButtons"  Text="Reset" OnClick="Btn_Refresh_Click" OnClientClick="refresh()"   />
            </td>
            <td class="auto-style2"></td>
            <td class="contactForm">
                <asp:Button ID="Btn_SubmitEnquiry" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit" OnClick="Btn_SubmitEnquiry_Click" />
            </td>
        </tr>

        
    </table>
            <asp:Label ID="Lbl_EmailSent" runat="server" CssClass="errorMessage" Visible="false" Text="Email can't be sent. Problem with your Wi-Fi" />
           <p runat="server" id="whenEmailsent" class="PleaseWait" visible="false">
            Booking has been sent. <br />
            Further Information via Email.</p>
    </ContentTemplate>

</asp:UpdatePanel><!-- end of update panel -->
    <!-- above is a label that is shown when the processes have been completed to say the Enquiry has been sent -->
<!-- update progress below shows what happens while the calculating has been completed -->
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please Wait...
        </div>

     </ProgressTemplate>
</asp:UpdateProgress><!-- end of update progress -->