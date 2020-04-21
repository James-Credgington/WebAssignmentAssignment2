<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs.ascx.cs" Inherits="Controls_WebUserControl" %>


<script> // script for the refresh function which once called  freshes the page
    function refresh() {
        window.location.refresh();
    }
</script>

<!-- action as a form below is what is input into the system for the user to contact them -->
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">

    <ContentTemplate>
    <div>
    <table runat="server" class="form">
        <tr>
            <td class="enquiryInfo">First Name</td>
            <td class="enquiryInfo"><asp:TextBox ID="Txt_FirstName" runat="server"></asp:TextBox></td>
            <td class="thirdColumn"><asp:RequiredFieldValidator ID="validateFirstName" runat="server" ErrorMessage="Type in a first name please" ControlToValidate="Txt_FirstName" 
                CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="enquiryInfo">Last Name</td>
            <td class="enquiryInfo"><asp:TextBox ID="Txt_LastName" runat="server"></asp:TextBox></td>
            <td class="thirdColumn">
                <asp:RequiredFieldValidator ID="validateLastName" runat="server" ErrorMessage="Type in a last name please" ControlToValidate="Txt_LastName" 
                    CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="enquiryInfo">Gender</td>
            <td class="enquiryInfo">
                <asp:RadioButtonList ID="Rbl_gender" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Text="Male" selected="true" Value="male" />
                    <asp:ListItem Text="Female" Value="female"/>
                    <asp:ListItem Text="Other" Value="other" />
                </asp:RadioButtonList>
            </td>
            <td class="thirdColumn"></td>
        </tr>
        
        <tr>
            <td class="enquiryInfo">Email Address</td>
            <td class="enquiryInfo"><asp:TextBox ID="Txt_EmailAddress" runat="server" ></asp:TextBox></td>
            <td class="thirdColumn"><asp:RequiredFieldValidator ID="validateEmailAddress" runat="server" ErrorMessage="Type in an email address please" ControlToValidate="Txt_EmailAddress"
                CssClass="errorMessage" /><br /><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" /></td>
        </tr>
        <tr>
            <td class="enquiryInfo">Phone Number</td>
            <td class="enquiryInfo"><asp:TextBox ID="Txt_PhoneNumber" runat="server"></asp:TextBox></td>
            <td class="thirdColumn"><asp:RequiredFieldValidator ID="validatePhoneNumber" runat="server" ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage"
                ErrorMessage="Type in an phone number please"/><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" EnableClientScript="True" ErrorMessage="Invalid Phone Number has been entered"
                    ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" 
                    ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" /></td>

        </tr>
        <tr>
        <td class="enquiryInfo">Enquiry Information</td>
        <td class="enquiryInfo">
            <asp:TextBox ID="Txt_EnquiryInformation" runat="server" TextMode="MultiLine" Width="160px" ></asp:TextBox>
        </td>
        <td class="thirdColumn">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txt_EnquiryInformation" 
                ErrorMessage="Are you sure you don't need to ask about anything?" CssClass="errorMessage"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
          <td class="enquiryInfo">Are you a Student?</td>
            <td class="enquiryInfo">
                <asp:RadioButtonList ID="Rbl_Student" runat="server" Width="160px">
                    <asp:ListItem selected="true" Text="Yes" Value="yes">
                    </asp:ListItem>
                    <asp:ListItem Text="No" Value="no">
                    </asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="enquiryInfo">
                <asp:Button ID="Btn_Refresh" runat="server" SkinID="Button" CssClass="masterButtons" OnClientClick="refresh()" Text="Reset" OnClick="Btn_Refresh_Click" />
            </td>
            <td class="enquiryInfo"></td>
            <td class="thirdColumn">
                <asp:Button ID="Btn_SubmitEnquiry" runat="server" SkinID="Button" CssClass="masterButtons" OnClick="Btn_SubmitEnquiry_Click" Text="Submit" />
            </td>
        </tr>
    </table>
    </div>
        <asp:Label ID="Lbl_EmailSent" runat="server" CssClass="errorMessage" Visible="false" Text="Email can't be sent. Problem with your Wi-Fi" />
        <p runat="server" id="whenEmailsent" class="PleaseWait" visible="false">
            Enquiry sent. <br />
            Further Information via Email.
        </p>
    </ContentTemplate>
</asp:UpdatePanel><!-- end of the update panel -->

<!-- start of the update progress that the label Please wait comes up will the user is waiting for the enquiry to be sent -->
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please Wait...
        </div>
     </ProgressTemplate>
</asp:UpdateProgress>