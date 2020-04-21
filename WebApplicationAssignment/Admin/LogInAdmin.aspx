<%@ Page Title="Higher Education Chesterfield College - Administrator Login" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_User.master" 
    CodeFile="LogInAdmin.aspx.cs" Inherits="Admin_LogInAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Login (Admin Only)</h1><!-- heading for the page -->
    <!-- the form for the administrator to type in his password and username. Its validated for when the user doesn't type anything into the textboxes
        and if the username or password does not exist within hte database-->
    <table runat="server" class="form2">
        <tr>
            <td class="auto-style2"><asp:Button ID="Btn_Back" runat="server" CssClass="masterButton" PostBackUrl="~/Home.aspx" SkinID="Button" Text="Back" /></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="contactForm"> <asp:Button ID="Btn_CreateAccount" runat="server" CssClass="createAccountButton" PostBackUrl="/Admin/SignUpAdmin.aspx" SkinID="Button" 
                Text="Create Account" CausesValidation="False" /></td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">Username</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_Username" runat="server"/></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validateUsername" runat="server" ControlToValidate="Txt_Username" CssClass="errorMessage" 
                ErrorMessage="Type in your username please"  Enabled="True"/></td>

        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">Password</td>
            <td class="auto-style2"><asp:TextBox ID="Txt_Password" runat="server" TextMode="Password" /></td>
            <td class="contactForm"><asp:RequiredFieldValidator ID="validatePassword" runat="server" ControlToValidate="Txt_Password" CssClass="errorMessage" 
                ErrorMessage="Type in your password please" Enabled="True"/></td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="contactForm">
                <asp:Button ID="Btn_SubmitEnquiry" runat="server" SkinID="Button" CssClass="masterButtons" Text="Submit" OnClick="Btn_SubmitEnquiry_Click"/>
            </td>
        </tr>

           
     
    </table>
    <!-- labels underneath to provide error messages or other messages when approprate -->
         <asp:Label ID="lbl_PleaseWait" runat="server" CssClass="PleaseWaitLogin" Visible="False">Please Wait...</asp:Label>
    <asp:Label ID="lbl_Incorrect" runat="server" CssClass="errorMessageLogin" Visible="False">Incorrect Username or Password</asp:Label>
    <!-- end of the content page -->
</asp:Content>

