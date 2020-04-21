<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Find a Friend" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_SocialMedia.master" CodeFile="FindFriend.aspx.cs" Inherits="SocialMedia_Add_Friend" EnableEventValidation="false" %>
<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <!-- start of content page -->
    <!-- heading and information about the page -->
    <h1>Search for your friends here</h1>
    <p>Search for your friends for you to chat later on.</p>
    <p>Type in the Surname of the person you would like to be friends into the textbox below. </p>
    <!-- searchbox with submit button and error labels -->
      <asp:TextBox runat="server" CssClass="txtbx" placeholder="Search for your friends here..." ID="Txt_SearchBox" Rows="0" Width="70%"></asp:TextBox>
        <asp:Button ID="Btn_Search" runat="server" SkinID="Button" CssClass="masterButton" Text="Search" OnClick="Btn_Search_Click" /><br />
        <asp:Label ID="Lbl_FriendAlready" runat="server" Text="You have already become friends with that person." Visible="false" CssClass="errorMessageLogin" /><br />
        <asp:Label ID="Lbl_FriendAdded" runat="server" Text="You have sent this friend a friend request." Visible="false" CssClass="errorMessageLogin" /><br />
        <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessage" Text="Database has failed to connect. Try going to this page later on." />
       <br /><br />
    <!-- repeater outputting all friends in the table to repeater so they can be accepted as friend requests -->
        <asp:Repeater ID="Repeater1" runat="server" ItemType="friend">
        <ItemTemplate>
           
                 <div class="BasketColumn1">
                 <img class="profile" alt="Managing Customer Records" runat="server"  src="<%# Item.ProfilePicture %>" />
                </div>
                <div class="BasketColumn2">
                    <table>
                        <tr>
                            <td> <b>Name: </b><asp:Label ID="Lbl_Friends" runat="server"  Text='<%# Eval("FirstName") %>' />  <asp:Label ID="Lbl_LastName" runat="server" Text='<%# Eval("Surname") %>'/> </td>
                        </tr>
                        <tr>
                            <td> <b>Current Student: </b><asp:Label ID="Lbl_CollegeStudent" runat="server" Text='<%#  Eval("CurrentStudent") %>' /></td>
                        </tr>
                        <tr>
                            <td> <b>Course: </b> <asp:Label ID="Lbl_Course" runat="server" Text='<%# Eval("Name") %>' /></td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="Btn_AddFriend" runat="server" SkinID="Button" Text="Add Friend" CssClass="masterButtons" OnClick="Btn_AddFriend_Click" /></td>
                        </tr>
                    </table>
                
                </div>
            
        </ItemTemplate>
        </asp:Repeater><!-- end of the repeater -->
                    <!-- end of contnet page -->
</asp:Content>