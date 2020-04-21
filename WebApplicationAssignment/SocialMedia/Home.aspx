<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Home" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_SocialMedia.master" CodeFile="Home.aspx.cs" Inherits="SocialMedia_Home" %>

<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <!-- start of content page -->
    <!-- start of this include a heading and intro about this page -->
    <h1>Home</h1>
     <h2>Members of this Groupchat</h2>
                    <p>Welcome to your Homepage. You can message your friends, do your college work and if you are looking at a college course, communicate with other peers on the course.</p>
            <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessage" Text="Database has failed to connect. Try going to this page later on." visible="false"/>
    <!-- first column where profile information of the user is -->
    <div class="column1of2Profile">
        <h2>Profile</h2>
                <p>View your profile information here and edit that if you need too.</p><br />

                <asp:Image ID="Img_Profile" runat="server" Height="200" Width="200"  /><br />
                <asp:Label ID="Lbl_FirstName" runat="server" /><br /><br />
                <asp:Label ID="Lbl_Surname" runat="server" /><br /><br />
                <asp:Label ID="Lbl_DateOfBirth" runat="server" /><br /><br />
                <asp:Label ID="Lbl_Gender" runat="server" /><br /><br />
                <asp:Label ID="Lbl_EmailAddress" runat="server" /><br /><br />
                <asp:Label ID="Lbl_PhoneNumber" runat="server" /><br /><br />
                <asp:Label ID="Lbl_CurrentStudent" runat="server" /><br /><br />
                <asp:Label ID="Lbl_Description" runat="server" /><br /><br />
                <asp:Label ID="Lbl_Course" runat="server" /><br /><br />
                <asp:Button ID="Btn_EditProfile" runat="server" Text="Edit" SkinID="Button" CssClass="masterButtons" OnClick="Btn_EditProfile_Click" />
    </div>
    <!-- second column where all the friends are stored -->
    <div class="column2of2Profile">
        <h2>Friends</h2>
           <asp:Button ID="Btn_AddButton" runat="server" Text="Add Friends" SkinID="Button" CssClass="masterButtons" OnClick="Btn_AddButton_Click" />
        <br /><br />
          <asp:Repeater ID="Repeater2" runat="server" ItemType="myFriend">
          <ItemTemplate>
            <a href="../SocialMedia/FriendChat.aspx?Name=<%#Eval("FirstName") %>&LastName=<%#Eval("Surname") %>">
            <div class="FriendMiniColumn1">
             <img class="profile" alt="Managing Customer Records" runat="server" src="<%# Item.ProfilePicture %>" />
            </div>
            <div class="FriendMiniColumn2">
                <table>
                    <tr>
                        <td><b>Name: </b><asp:Label ID="Lbl_Friends" runat="server"  Text='<%# Eval("FirstName") %>' /> <asp:Label ID="Lbl_LastName" runat="server" Text='<%# Eval("Surname") %>'/></td> 
                    </tr>
                    <tr>
                        <td><b>Current Student: </b><asp:Label ID="Lbl_CollegeStudent" runat="server" Text='<%#  Eval("CurrentStudent") %>' /></td>
                    </tr>
                    <tr>
                        <td><b>Course: </b><asp:Label ID="Lbl_Name" runat="server" Text='<%# Eval("Name") %>' /></td>
                    </tr>
                </table>
               <br />
                
            </div>
                </a>
        </ItemTemplate>
        </asp:Repeater><!-- end of the repeater -->
       
    </div>
    <!-- end of content page -->
</asp:Content>
