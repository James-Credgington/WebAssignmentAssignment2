<%@ Page Title="Higher Education Chesterfield College - Signing Up Users" Language="C#" MasterPageFile="~/MasterPages/Master_User.master" AutoEventWireup="true" Debug="true"
    CodeFile="SignUpUser.aspx.cs" Inherits="About_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of a content page -->
    <h1>Sign Up</h1><!-- heading for the page-->
    <!-- table for adding user details into the database, and validate textboxes to make sure e.g. date of birth is formatted as an date 
        and if all the textboxes have been filled in -->
    <table runat="server" class="form">
        <tr>
            <td class="auto-style2">First Name</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_FirstName" runat="server"></asp:TextBox></td>
            <td class="auto-style2"><asp:RequiredFieldValidator ID="validateFirstName" runat="server" ErrorMessage="Type in a first name please" ControlToValidate="Txt_FirstName" 
                CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_LastName" runat="server"></asp:TextBox></td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="validateLastName" runat="server" ErrorMessage="Type in a last name please" ControlToValidate="Txt_LastName" 
                    CssClass="errorMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">DOB</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_DateOfBirth" runat="server"></asp:TextBox></td>
            <td class="auto-style2"><asp:RequiredFieldValidator ID="validateDOB" runat="server" ErrorMessage ="Type in a date of birth please" ControlToValidate="Txt_DateOfBirth"
                CssClass="errorMessage" /><br />
                <asp:RangeValidator ID="rangeDOB" runat="server" ControlToValidate="Txt_DateOfBirth" CssClass="errorMessage" ErrorMessage="You're too young to do higher education."
                    MaximumValue="31/08/2002" MinimumValue="01/01/1950" Type="String" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td class="auto-style2">
                <asp:RadioButtonList ID="Rbl_gender"  runat="server">
                    <asp:ListItem selected="True" Text="Male" Value="male" />
                    <asp:ListItem Text="Female" Value="female"/>
                    <asp:ListItem Text="Other" Value="other" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_EmailAddress" runat="server" TextMode="Email"></asp:TextBox></td>
            <td class="auto-style2"><asp:RequiredFieldValidator ID="validateEmailAddress" runat="server" ErrorMessage="Type in an email address please" 
                ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" /><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td class="auto-style2">Phone Number</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_PhoneNumber" runat="server" TextMode="Phone"></asp:TextBox></td>
            <td class="auto-style2"><asp:RequiredFieldValidator ID="validatePhoneNumber" runat="server" ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" 
                ErrorMessage="Type in an phone number please" /><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" EnableClientScript="True" ErrorMessage="Invalid Phone Number has been entered" 
                    ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" 
                    ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" />  
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="height: 32px">Current Student</td>
            <td style="height: 32px">
                 <asp:RadioButtonList ID="Rbl_student" runat="server">
                    <asp:ListItem selected="true" Text="Yes" Value="Yes">
                    </asp:ListItem>
                    <asp:ListItem Text="No" Value="No">
                    </asp:ListItem>
                </asp:RadioButtonList>
             </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Current Course/<br />
                Looking at Course:
            </td>
            <td class="auto-style2"><asp:DropDownList ID="Ddl_Course" runat="server" DataSourceID="Course" Width=200 DataTextField="Name" DataValueField="Id" />
                <asp:SqlDataSource ID="Course" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [Course]"></asp:SqlDataSource>
            </td>
            <td class="auto-style2"></td>
           
        </tr>
        <tr>
            <td class="auto-style2">Password</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_Password" runat="server" TextMode="Password"></asp:TextBox></td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Type in a password please" ControlToValidate="Txt_Password" 
                    CssClass="errorMessage"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RangeValidator1" runat="server" ControlToValidate="Txt_Password" CssClass="errorMessage" 
                    ErrorMessage="Password is not secure enough!" Type="Date" ValidateRequestMode="Inherit" 
                    ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="Btn_Refresh" runat="server" SkinID="Button" CssClass="masterButtons"  Text="Reset" OnClick="Btn_Refresh_Click" OnClientClick="refresh()"   />
            </td>
            <td class="auto-style2"></td>
            <td class="auto-style2">
                <asp:Button ID="Btn_SubmitDetails" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit" OnClick="Btn_SubmitDetails_Click" />
            </td>
        </tr>


        
    </table>


         
            <asp:Label ID="lbl_usernameValid" runat="server" CssClass="errorMessageLogin" Visible="false" Text="Username already taken."/><br />
            <asp:Label ID="lbl_whenEmailsent" runat="server" CssClass="PleaseWaitLogin" Visible="false" Text="Please Wait..."/><br />
            <asp:Label ID="lbl_errorMessage" runat="server" CssClass="errorMessageLogin" Visible="false" 
                Text="Database is not connected"/><br />
        <asp:Label ID="Lbl_EmailSent" runat="server" CssClass="errorMessageLogin" Visible="false" 
            Text="Email cannot be sent. " />
    <asp:Label ID="Lbl_DatabaseConnection" runat="server" CssClass="errorMessageLogin" Visible="false"
        Text="Cannot connect to the database." />

    <!-- start of a content page -->
</asp:Content>

