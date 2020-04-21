<%@ Page Language="C#" Title="Higher Education Chesterfield College Social Network- Public Chat" AutoEventWireup="True" CodeFile="PublicChat.aspx.cs" MasterPageFile="~/MasterPages/Master_SocialMedia.master" Inherits="SocialMedia_PublicChat" %>

<asp:Content ID="Home" ContentPlaceHolderID="cpMainSection" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- the body of the messaging feature where all the messages pops up -->
     <h1>Public Chat</h1>

     <p>Message people, add pictures and videos for everyone in the Social Network whether students or future students of the Chesterfield College's Higher Education Courses can see.</p>
    <asp:Label ID="Lbl_DatabaseError" runat="server" CssClass="errorMessage" Text="Database has failed to connect. Try going to this page later on." Visible="false" />
    <!-- where messages pop up below -->
    <div class="lv-body" id="ms-scrollbar">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                         <ContentTemplate>
                                             <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="100000"></asp:Timer>
                                            <asp:DataList ID="DataList3" runat="server">
                                                 <ItemTemplate> 
                                                     <div class="lv-item media"> 
                                                         
                                                         <div class="media-body">
                                                              <small class="ms-date"><span class="glyphicon glyphicon-time"></span><asp:Label ID="Lbl_Name" runat="server" Text='<%# Bind("FirstName") %>'/> <asp:Label ID="Lbl_Surname" runat="server" Text='<%#  Bind("Surname") %>' />, <asp:Label ID="Lbl_Date" runat="server" Text='<%# Bind("DateOfMessageSent") %>' />  <asp:Label ID="Lbl_Time" runat="server" Text='<%# Bind("TimeOfMessageSent") %>'/></small> 
                                                             <div class="ms-item"> 
                                                                 
                                                                 <asp:Label ID="Lbl_Text" runat="server" Text='<%# Bind("MessageText") %>'></asp:Label><br />
                                                                 <asp:Hyperlink runat="server" ID="Hpl_Video" NavigateUrl='<%#   Eval("VideoInserted") %>' style="color:black" Text='<%# Eval("VideoInserted") %>' /><br />
                                                                 <asp:Image ID="Img_Message" runat="server" ImageUrl='<%# Bind("PictureInserted") %>' Width="300" Height="300"/>
                                                                 
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
            <asp:TextBox ID="Txt_Message" PlaceHolder="Type in your Message here..." runat="server" Height="50px"  MaxLength="150" TextMode="MultiLine" Width="90%" /><asp:Button ID="Btn_Send" Text="Send" runat="server" SkinID="Button" CssClass="masterButton" OnClick="Btn_Send_Click"/><br />
            <asp:FileUpload ID="FileUpload1" runat="server" Visible="false" /><asp:TextBox ID="Txt_Video" runat="server" Visible="false" Width="60%" /> <asp:Button ID="Btn_Switch" runat="server" Text="Add Image" OnClick="Btn_Switch_Click" SkinID="Button" CssClass="masterButton" /><asp:Button ID="Btn_YouTube" runat="server" Text="Add Video" OnClick="Btn_YouTube_Click" SkinID="Button" CssClass="masterButton" /> <asp:Button ID="Btn_Message" runat="server" Text="Add Text" OnClick="Btn_Message_Click" SkinID="Button" CssClass="masterButton" /> 
            <br />
        </div>
            </div>
    </div>
</asp:Content>

