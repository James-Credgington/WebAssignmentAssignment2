<%@ Page Title="Higher Education Chesterfield College - User Login" Language="C#" MasterPageFile="~/MasterPages/Master_User.master" AutoEventWireup="true" CodeFile="LogInUser.aspx.cs" Debug="true"
    Inherits="About_LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content page -->

     <h1>Log in to Social Network</h1>
    
    <!-- table that shows the login menu including validating password and username textboxes to see whether something has been typed into them. Also buttons to navigate around various pages -->
    <table runat="server" class="form2">
        <tr>
            <td class="auto-style2"><asp:Button ID="Btn_Back" runat="server" CssClass="masterButton" PostBackUrl="~/Home.aspx" SkinID="Button" Text="Back" /></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>

            <td class="contactForm"> <asp:Button ID="Btn_CreateAccount" runat="server" CssClass="createAccountButton" PostBackUrl="/About/SignUpUser.aspx" SkinID="Button" 
                Text="Create Account" CausesValidation="False" />

            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">Username</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_Username" runat="server"/></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateUsername" runat="server" ControlToValidate="Txt_Username" CssClass="errorMessage" 
                ErrorMessage="Type in your username please" Enabled="True"/></td>

        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">Password</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_Password" runat="server" TextMode="Password" /></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validatePassword" runat="server" ControlToValidate="Txt_Password" CssClass="errorMessage" 
                ErrorMessage="Type in your password please" Enabled="True" />
            </td>

        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="contactForm">
                <asp:Button ID="Btn_SubmitEnquiry" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit"  OnClick="Btn_SubmitEnquiry_Click"/>
            </td>
        </tr>
    </table>

    <asp:Label ID="lbl_PleaseWait" runat="server" CssClass="PleaseWaitLogin" Visible="False">Please Wait...</asp:Label><!-- label saying please wait while we wait for user -->

    <!--label for when the incorrect username and password is typed into the textboxes -->
    <asp:Label ID="lbl_Incorrect" runat="server" CssClass="errorMessageLogin" Visible="False">Incorrect Username or Password</asp:Label>
    <!-- end of content page -->
</asp:Content>

