<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Group Chat" AutoEventWireup="true" CodeFile="Groupchat.aspx.cs" MasterPageFile="~/MasterPages/Master_SocialMedia.master" Inherits="SocialMedia_Groupchat" Debug="True" %>

<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <!-- start of content page -->
    <!-- heading with info about the page as well as the database error label too -->
    <h1>Groupchats</h1>
     <p>Here press on a groupchat and get messaging or create your groupchat so you can talk about a course you are going to study or collaborate as groups to get on with your coursework.</p>
                <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessageLogin" Text="Database Connection has failed. Come back to the page soon." Visible="false"/>
    <!-- column 1 with links to each group chat messaging section -->
    <div class="column1of2Profile">
        <h2>My Groupchats</h2>
           
        <asp:Repeater ID="Repeater1" runat="server" ItemType="groupChat">
          <ItemTemplate>
              <a href="../SocialMedia/GroupchatMessaging.aspx?Name=<%#Eval("Name") %>">
            <div class="GroupChatColumn1">
             <img class="profile" alt="Managing Customer Records" runat="server" src="<%# Item.ProfilePicture %>" />
            </div>
            <div class="GroupChatColumn2">
                <table>
                    <tr>
                        <td><b>Name: </b><asp:Label ID="Lbl_Friends" runat="server"  Text='<%# Eval("Name") %>' /> </td> 
                    </tr>
                </table>

               </a>
            </div>
                             <br />
        </ItemTemplate>
        </asp:Repeater><!-- end of the repeater -->
    </div>
    <!-- column 2 - a form to create groupchats -->
    <div class="column2of2Profile">
        <h2>Create Groupchat</h2>
        <table>
            <tr>
                <td class="auto-style1">Invite:</td>
                <td class="contactForm">
                    <asp:CheckBoxList ID="Chk_Friends" runat="server" OnSelectedIndexChanged="Chk_Friends_SelectedIndexChanged" /><br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="height: 29px">Name Of Chat:</td>
                <td class="contactForm" style="height: 29px"><asp:TextBox ID="Txt_NameOfChat" runat="server" /><br /></td>
            </tr>
             <tr>
                <td class="auto-style1">Group Chat Picture</td>
                <td class="contactForm"><asp:FileUpload ID="UploadGroupChatPicture" runat="server" /><br /></td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="contactForm"><asp:Button ID="Btn_AddGroupChat" Text="Create Groupchat" runat="server" SkinID="Button" CssClass="masterButton" OnClick="Btn_AddGroupChat_Click"/></td>
            </tr>
        </table>          
    </div>
    <!-- end of content page -->
</asp:Content>
