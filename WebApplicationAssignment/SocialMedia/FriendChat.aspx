<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network - Friend Chat" AutoEventWireup="true" CodeFile="FriendChat.aspx.cs" MasterPageFile="~/MasterPages/Master_SocialMedia.master" Inherits="SocialMedia_FriendChat" Debug="true" %>
<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <!--  start of content page -->
    <!-- the body of the messaging feature where all the messages pops up -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="Btn_Back" runat="server" Text="Back" CssClass="masterButtonLeft" OnClick="Btn_Back_Click"/>
     <h1><asp:Label ID="Lbl_Title" runat="server"/></h1>
    <p>Message your friend, asking questions about your social life, whether this college course you are looking on is a good idea or do groupwork.</p>
            <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessage" Text="Database has failed to connect. Try going to this page later on." />
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
            <asp:TextBox ID="Txt_Message" PlaceHolder="Type in your Message here..." runat="server" Height="50px" MaxLength="25" TextMode="MultiLine" Width="90%" /> <asp:Button ID="Btn_Send" Text="Send" runat="server" SkinID="Button" CssClass="masterButton" OnClick="Btn_Send_Click"/>
        </div>
            </div>
    </div>
    <!-- end of content page -->
</asp:Content>
