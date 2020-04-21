<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Master_User.master" AutoEventWireup="true" Debug="true" CodeFile="Course.aspx.cs" Inherits="About_Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"> <!-- start of the content page -->
    
   <h1><asp:Label ID="TitleLabel" runat="server"></asp:Label></h1><!-- heading as a label that changes dynamically depending on the course seleccted from the previous page -->
     <div class="column1of2subjectArea"> <!-- start of div with class column1of2subjectArea -->
        <asp:Image ID="img_Course" CssClass="displayImage" runat="server" AlternateText="No image to view"/><!-- image to show the type of course it is -->
    </div><!-- end of div -->
    <div class="column2of2subjectArea"> <!-- start of div with class column2of2subjectArea -->
        <asp:Label ID="FullPartTime" runat="server"></asp:Label><br /><!-- label for whether the course is full or part time -->
        <asp:Label ID="LevelOfCourse" runat="server"></asp:Label><br /><!-- label for whether which level the course is -->
        <asp:Label ID="BriefInformation" runat="server"></asp:Label><!-- label for what brief information is added to the course -->
    </div><!-- end of div -->
   
    <div class="addComment"><!-- start of div with class addComment -->
    <h2>Add a comment</h2><!-- subheading for adding comments -->

    <!--importing a template for the user to add comments into the database -->
    <asp:DetailsView ID="addComment" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="AddIntoCommentTable" DefaultMode="Insert" Height="50px" 
        GridLines="None">
     <Fields>
      <asp:BoundField DataField="EmailAddress" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
      <asp:TemplateField HeaderText="Email Address" SortExpression="EmailAddress">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_EmailAddress" runat="server" CssClass="txt_addData" Text='<%# Bind("EmailAddress") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_EmailAddress" runat="server" ErrorMessage="Type in your email address please" CssClass="errorMessage" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_EmailAddress" runat="server" CssClass="txt_addData" Text='<%# Bind("EmailAddress") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_EmailAddress" runat="server" ErrorMessage="Type in your email address please" CssClass="errorMessage"/>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" EnableClientScript="True" ErrorMessage="Invalid Email Address" 
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txt_EmailAddress" CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
       <asp:TemplateField HeaderText="Comment" SortExpression="Comment">

        <EditItemTemplate>
          <asp:TextBox ID="Txt_Comment" runat="server" CssClass="txt_addData" TextMode="MultiLine" Text='<%# Bind("CommentInformation") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_Comment" runat="server" ErrorMessage="Type in your comment please" CssClass="errorMessage"/>
        </EditItemTemplate>
        <InsertItemTemplate> 
          <asp:TextBox ID="Txt_Comment" runat="server" CssClass="txt_addData" TextMode="MultiLine"  Text='<%# Bind("CommentInformation") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_Comment" runat="server" ErrorMessage="Type in your comment please" CssClass="errorMessage" />
        </InsertItemTemplate>

      </asp:TemplateField>
         <asp:CommandField ShowInsertButton="True" ButtonType="Button" ControlStyle-CssClass="masterButtonLeft"/>
         </Fields> 
        </asp:DetailsView> 

        <!-- sql data source for adding comments into the database -->
         <!-- parameters in the database, setting attributes and their datatypes before data is inserted into the database -->
       <asp:SqlDataSource ID="AddIntoCommentTable" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
           InsertCommand="INSERT INTO [Comment] ([EmailAddress], [CommentInformation], [CourseId]) VALUES (@EmailAddress, @CommentInformation, @CourseId)" 
           SelectCommand="SELECT * FROM [Comment]" >
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="CourseId" SessionField="CourseId" Type="Int32" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="CommentInformation" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="CommentInformation" Type="String" /> 
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
       </asp:SqlDataSource> 
    </div><!-- end of div -->
    <div class="viewComments"><!-- start of div with class view comments -->
    <h2>View Previous Comments</h2> <!-- subheading for viewing previous comments -->
        <!-- start of the repeater which outputs the comments -->
        <asp:Repeater ID="Repeater2" runat="server" ItemType="Comment">
                <ItemTemplate>
                <div class="comment"><!-- start of div with class comment -->
                    <!-- label outputting the date and time of comment and the email address of the user sent it -->
                    <asp:Label ID="headerComment" CssClass="detailsOfComment" runat="server" Text='<%#Item.DateAndTimeOfCommentSent + ", " + Item.EmailAddress %>' /><br />
                    <!-- label outputting the comment information of the email address of the user sent it -->
                    <asp:Label ID="headerInfo" CssClass="CommentInfo" runat="server" Text='<%#Item.CommentInformation %>' />
                </div><!-- end of div -->
                </ItemTemplate>
            
            <SeparatorTemplate>
                <br />
            </SeparatorTemplate>
        </asp:Repeater><!-- end of repeater -->
    </div><!-- end of div -->
    <!-- end of the content page -->
  </asp:Content> 
