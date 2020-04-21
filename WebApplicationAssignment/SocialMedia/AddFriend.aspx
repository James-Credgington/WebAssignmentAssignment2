<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Home" AutoEventWireup="true" CodeFile="AddFriend.aspx.cs" MasterPageFile="~/MasterPages/Master_SocialMedia.master" Debug="true" Inherits="SocialMedia_AddFriend" EnableEventValidation="False" %>

<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <!-- start of content page -->
    <!-- heading and infromation about page as well as error labels -->
    <h1>Friends</h1>
    <p>Find friends and add them so you can message them later on.</p>
    <asp:Label ID="Lbl_DatabaseError1" runat="server" CssClass="errorMessageLogin" Text="Your profile information will not load" Visible="false"/><br />
    <asp:Label ID="Lbl_DatabaseError2" runat="server" CssClass="errorMessageLogin" Text="Friends Request system is down" Visible="false"/>

    <!-- accepting friend requests -->
    <p>Click here to add a friend.</p>
    <asp:Button ID="Btn_AddFriendPage" runat="server" SkinID="Button" CssClass="masterButtons" Text="Add Friend" OnClick="Btn_AddFriendPage_Click"/>
    <div class="column1of2Profile">
        <h2>Friend Invitations</h2>
        <!-- repeating the friend invitations that have not been accepted -->
        <asp:Repeater ID="Repeater1" runat="server" ItemType="friendRequest">
          <ItemTemplate>
            <div class="FriendMiniColumn1">
             <img  class="profile" alt="Managing Customer Records" runat="server" src="<%# Item.ProfilePicture %>" />
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
                    <tr>
                        <td><asp:Button ID="Btn_AddFriend" runat="server" SkinID="Button" Text="Add Friend" CssClass="masterButtons" OnClick="Btn_AddFriend_Click" /></td>
                    </tr>
                </table>
               <br />
                
            </div>
        </ItemTemplate>
        </asp:Repeater><!-- end of the repeater -->
    </div>
    <!-- linking to friend chat pages -->
    <div class="column2of2Profile">
        <h2>Message Friends</h2>
        <!-- repeating friends that have been accepted from friend requests -->
                  <asp:Repeater ID="Repeater2" runat="server" ItemType="myFriend">
          <ItemTemplate>
              <a href="FriendChat.aspx?Name=<%#Eval("FirstName") %>&LastName=<%#Eval("Surname") %>">
            <div class="FriendMiniColumn1">
             <img  class="profile" alt="Managing Customer Records" runat="server" src="<%# Item.ProfilePicture %>" />
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
</asp:Content>
