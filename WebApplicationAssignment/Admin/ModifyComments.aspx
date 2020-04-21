<%@ Page Title="Higher Education Chesterfield College - Modifying Comments" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_Admin.master" 
    CodeFile="ModifyComments.aspx.cs" Inherits="Admin_Modify_Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content page -->
    <h1>Delete Comments</h1><!-- heading for this page -->

    <!-- introduction about this page to the administrator -->
    <p>The purpose of this page is for you to delete comments that are unsuitable and look bad for the courses that are being promoted on this website</p>
    
    <!-- form for deleting comments -->
    <asp:GridView ID="GridView1" runat="server" CssClass="AddData" AllowPaging="False" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="CommentDeleteData" 
        EmptyDataText="There are no comments for you to delete.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />

                <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
                <asp:BoundField DataField="CommentInformation" HeaderText="Comment" SortExpression="CommentInformation"/>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CommentDeleteData" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT Comment.Id, Comment.EmailAddress, Comment.CommentInformation, Course.Name FROM Comment INNER JOIN Course ON Comment.CourseId = Course.Id" 
            DeleteCommand ="DELETE FROM [Comment] WHERE Id = @Id"  >
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
         </asp:SqlDataSource>


    <!-- end of content page -->
</asp:Content>