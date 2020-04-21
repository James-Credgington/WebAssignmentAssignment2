<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Edit Profile" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" MasterPageFile="~/MasterPages/Master_SocialMedia.master" Inherits="SocialMedia_EditProfile" %>



<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <!-- start of content page -->
    <!-- heading and information about the page -->
    <h1>Edit Profile</h1>
    <p >Here you can modify your profile, for your friends to see it.</p>
    <!-- label appear when error occurs with the database -->
    <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessage" Text="Database has failed to connect. Try going to this page later on" />
    <!-- form below for changing profile information -->
        <table runat="server" class="form">
            <tr>
                <td>
                    Change Picture:
                </td>
                <td>
                    <asp:FileUpload ID="UploadProfilePicture" runat="server" OnLoad="UploadProfilePicture_Load" />
                </td>
                </tr>
                        <tr>
            <td class="auto-style2">First Name</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_FirstName" runat="server"></asp:TextBox></td>
            <td class="auto-style2">
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_LastName" runat="server"></asp:TextBox></td>
            <td class="auto-style2">
            </td>
        </tr>
        <tr>
            <td class="auto-style2">DOB</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_DateOfBirth" runat="server"></asp:TextBox></td>
            <td class="auto-style2">
                <asp:RangeValidator ID="rangeDOB" runat="server" ControlToValidate="Txt_DateOfBirth" CssClass="errorMessage" 
                    ErrorMessage="Invalid date of birth" MaximumValue="31/08/2003" MinimumValue="01/01/1950" />
            </td>
            
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td>
                <asp:RadioButtonList ID="Rbl_gender" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Selected="True" Text="Male" Value="male" />
                    <asp:ListItem Text="Female" Value="female"/>
                    <asp:ListItem Text="Other" Value="other" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        
        <tr>
            <td class="auto-style2">Email Address</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_EmailAddress" runat="server" TextMode="Email"></asp:TextBox></td>
            <td class="auto-style2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" /></td>
        </tr>
        <tr>
            <td class="auto-style2">Phone Number</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_PhoneNumber" runat="server" TextMode="Phone"></asp:TextBox></td>
            <td class="auto-style2"><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" EnableClientScript="True" ErrorMessage="Invalid Phone Number has been entered" 
                    ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" 
                    ControlToValidate="Txt_PhoneNumber" CssClass="errorMessage" />
                
            </td>

        </tr>
        <tr>
            <td class="auto-style2">Are you a current student?</td>
            <td class="auto-style2">
                 <asp:RadioButtonList ID="Rbl_CurrentStudent" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Selected="true" Text="Yes" Value="Yes"/>
                    <asp:ListItem Text="No" Value="No" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                Current Course/Looking at Course:
            </td>
            <td class="auto-style2"><asp:DropDownList ID="Ddl_Course" runat="server" DataSourceID="Course" DataTextField="Name" DataValueField="Id" Width="70%" />
                <asp:SqlDataSource ID="Course" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [Course]"></asp:SqlDataSource>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                Description:
            </td>
            <td class="auto-style2"><asp:TextBox ID="Txt_Description" runat="server" TextMode="MultiLine" /></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="Btn_Refresh" runat="server" SkinID="Button" CssClass="masterButtons"  Text="Reset" OnClick="Btn_Refresh_Click" OnClientClick="refresh()"   />
            </td>
            <td class="auto-style2"></td>
            <td class="auto-style2">
                <asp:Button ID="Btn_SubmitDetails" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit" OnClick="Btn_SubmitDetails_Click" CausesValidation="True"/>
            </td>

            </tr>
        </table>
        <asp:Label ID="Lbl_UpdateData" runat="server" Text="Your Profile Information has been updated!" CssClass="errorMessage" Visible="False" />
    <!-- end of content page -->
</asp:Content>
