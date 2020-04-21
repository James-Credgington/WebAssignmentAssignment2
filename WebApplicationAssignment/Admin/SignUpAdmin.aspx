<%@ Page Title="Higher Education Chesterfield College - Administrator Sign Up" Language="C#" MasterPageFile="~/MasterPages/Master_User.master" AutoEventWireup="true" 
    CodeFile="SignUpAdmin.aspx.cs" Inherits="Admin_SignUpAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Sign Up for Administrator Access</h1><!-- main heading for the sign up administrator page -->
    <!-- form for the administrator to sign up to modify the information-->
      <table runat="server" class="form">
        <tr>
            <td class="auto-style1">First Name</td>
            <td class="auto-style1"><asp:TextBox ID="Txt_FirstName" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateFirstName" runat="server" ErrorMessage="Type in a first name please" ControlToValidate="Txt_FirstName" 
                CssClass="errorMessage" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Last Name</td>
            <td class="auto-style1"><asp:TextBox ID="Txt_LastName" runat="server"></asp:TextBox></td>
            <td class="contactForm">
                <asp:RequiredFieldValidator ID="validateLastName" runat="server" ErrorMessage="Type in a last name please" ControlToValidate="Txt_LastName" CssClass="errorMessage" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">DOB</td>
            <td class="auto-style1"><asp:TextBox ID="Txt_DateOfBirth" runat="server"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateDOB" runat="server" ErrorMessage ="Type in a date of birth please" ControlToValidate="Txt_DateOfBirth" 
                CssClass="errorMessage" /><br />
                <asp:RangeValidator ID="rangeDOB" runat="server" ControlToValidate="Txt_DateOfBirth" CssClass="errorMessage" 
                    ErrorMessage="You're too young to have an administrator's account" MaximumValue="31/08/2003" MinimumValue="01/01/1950" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style1">Gender</td>
            <td class="auto-style1">
                <asp:RadioButtonList ID="Rbl_gender" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem selected="True" Text="Male" Value="male" />
                    <asp:ListItem Text="Female" Value="female"/>
                    <asp:ListItem Text="Other" Value="other" />
                </asp:RadioButtonList>
            </td>
            <td class="contactForm">&nbsp;</td>
        </tr>
        
        <tr>
            <td class="auto-style1">Email Address</td>
            <td class="auto-style1"><asp:TextBox ID="Txt_EmailAddress" runat="server" TextMode="Email"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateEmailAddress" runat="server" ErrorMessage="Type in an email address please" ControlToValidate="Txt_EmailAddress" 
                CssClass="errorMessage" /><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" /></td>
        </tr>
        <tr>
            <td class="auto-style1">Password for Logging in</td>
            <td class="auto-style1"><asp:TextBox ID="Txt_Password" runat="server" TextMode="Password"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage ="Type in a password please" ControlToValidate="Txt_DateOfBirth" 
                CssClass="errorMessage" /><br />
                <asp:RegularExpressionValidator ID="RangeValidator1" runat="server" ControlToValidate="Txt_Password" CssClass="errorMessage" ErrorMessage="Password is not secure enough!"
                    ValidateRequestMode="Inherit" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style1">Password to create the account</td>
            <td class="auto-style1"><asp:TextBox ID="Txt_PIN" runat="server" TextMode="Password"></asp:TextBox></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage ="Type in the Password you have been provided with please" ControlToValidate="Txt_DateOfBirth" 
                CssClass="errorMessage" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Button ID="Btn_Refresh" runat="server" SkinID="Button" CssClass="masterButtons"  Text="Reset" OnClick="Btn_Refresh_Click" OnClientClick="refresh()"   />
            </td>
            <td class="auto-style1"></td>
            <td class="contactForm">
                <asp:Button ID="Btn_SubmitDetails" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit" OnClick="Btn_SubmitDetails_Click" CausesValidation="True"/>
            </td>
        </tr>

        
    </table>
    <!-- label appears below are error messages when email or databases won't be connected -->
            <asp:Label ID="Lbl_wrongPassword" runat="server" CssClass="errorMessageLogin" Visible="false" Text="The Password you have been provided with is wrong" />
            <asp:Label id="lbl_usernameValid" runat="server" CssClass="errorMessageLogin" Visible="false" Text="Username already taken."/>
            <asp:Label ID="lbl_whenEmailsent" runat="server" CssClass="PleaseWaitLogin" Visible="false" Text="Please Wait..."/>
            <asp:Label ID="lbl_errorMessage" runat="server" CssClass="errorMessageLogin"  Visible="false" Text="Database is not connected"/>
            <asp:Label ID="Lbl_EmailSent" runat="server" CssClass="errorMessageLogin" Visible="false" Text="Email can't be sent. Problem with your Wi-Fi" />
            <asp:Label ID="Lbl_DatabaseConnection" runat="server" CssClass="errorMessageLogin" Visible="false" Text="Cannot connect to the database." />
<!-- end of the content page -->
</asp:Content>

