<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Group Chat Messaging" AutoEventWireup="true" CodeFile="GroupchatMessaging.aspx.cs" MasterPageFile="~/MasterPages/Master_SocialMedia.master" Inherits="SocialMedia_GroupchatMessaging" %>

<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
        <!--  start of content page -->
    <!-- the body of the messaging feature where all the messages pops up -->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Btn_Back" runat="server" Text="Back" CssClass="masterButtonLeft" OnClick="Btn_Back_Click"/><br />
     <h1><asp:Label ID="Lbl_Title" runat="server"/></h1>
    <h2>Members of this Groupchat</h2>
        <p>Message your groupchat here, and get the most out of it whether you are on a course together and doing group work together or use this as a research forum to find out what the course you are about to go is like.</p>
            <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessage" Text="Database has failed to connect. Try going to this page later on." />
            <asp:Repeater ID="Repeater1" runat="server" ItemType="groupMember">
          <ItemTemplate>
            <div class="FriendMiniColumn1">
             <img  class="profile" alt="Managing Customer Records" runat="server" src="<%# Item.ProfilePicture %>" />
            </div>
            <div class="FriendMiniColumn2">
                <table>
                    <tr>
                        <td><b>Name: </b><asp:Label ID="Lbl_Friends" runat="server"  Text='<%# Eval("FirstName") %>' /> <asp:Label ID="Lbl_LastName" runat="server" Text='<%# Eval("Surname") %>'/></td> 
                    </tr>
                </table>
               <br />
                
            </div>

        </ItemTemplate>
        </asp:Repeater><!-- end of the repeater -->
                  <br /><br />
    <div class="lv-body" id="ms-scrollbar">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                         <ContentTemplate>
                                             <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                                            <asp:DataList ID="DataList3" runat="server">
                                                 <ItemTemplate>  
                                                     <div class="lv-item media"> 
                                                         
                                                         <div class="media-body">
                                                              <small class="ms-date"><span class="glyphicon glyphicon-time"></span><asp:Label ID="Lbl_Name" runat="server" Text='<%# Bind("FirstName") %>'/> <asp:Label ID="Lbl_Surname" runat="server" Text='<%#  Bind("Surname") %>' />, <asp:Label ID="Lbl_Date" runat="server" Text='<%# Bind("DateOfMessageSent") %>' />  <asp:Label ID="Lbl_Time" runat="server" Text='<%# Bind("TimeOfMessageSent") %>'/></small> 
                                                             <div class="ms-item"> 
                                                                 
                                                                 <asp:Label ID="Message" runat="server" Text='<%# Bind("MessageText") %>'></asp:Label>
                                                             </div>
                                                            
                                                         </div>
                                                         
                                                     </div>
                                                     <br />
                                                   </ItemTemplate>
                                              </asp:DataList>
                                         </ContentTemplate>
                    </asp:UpdatePanel>
        </div>
    <div class="lv-footer ms-reply">
                <!-- box where you type messages and they get posted -->
        <div class="message">
        <div class="messageArea">
            <asp:TextBox ID="Txt_Message" PlaceHolder="Type in your Message here..." runat="server" Height="50px" TextMode="MultiLine" Width="80%" /> <asp:Button ID="Btn_Send" Text="Send" runat="server" SkinID="Button" CssClass="masterButton" OnClick="Btn_Send_Click"/>
        </div>
            </div>
    </div>
</asp:Content>