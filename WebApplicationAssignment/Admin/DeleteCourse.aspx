<%@ Page Title="Higher Education Chesterfield College - Deleting Courses" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_Admin.master" 
    CodeFile="DeleteCourse.aspx.cs" Inherits="Admin_DeleteCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Delete Courses</h1><!-- header for this page -->

    <!-- back button to go back to the previous page -->
    <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditCourses.aspx" CausesValidation="False" /><br />
    <!-- brief introduction to the administrator changing this page -->
    <p>Press a delete button next to the row you want to delete, then that row you have pressed that button will be deleted.</p>
    
   <!-- data so for outputing the names of the subject areas -->
    <asp:SqlDataSource ID="SubjectAreaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        SelectCommand="SELECT * FROM [Course]"/>
    <div class="editData"><!-- start of a div tag with the class editData -->

        <!-- form below which deletes courses -->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="False" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="CourseDeleteData" 
        EmptyDataText="There are no courses for you to delete.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="AdditionalInformation" HeaderText="Additional Information" SortExpression="AdditionalInformation" />
                <asp:BoundField DataField="PartFullTime" HeaderText="Part/ Full Time" SortExpression="PartFullTime" />
                <asp:BoundField DataField="LevelOfCourse" HeaderText="Level" SortExpression="LevelOfCourse" /> 
            </Columns>
        </asp:GridView>

        <!-- data source for the deleting course data -->
        <asp:SqlDataSource ID="CourseDeleteData" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT * FROM [Course] " DeleteCommand ="DELETE FROM [Course] WHERE Id = @Id AND NOT EXISTS (SELECT * FROM [Comment] WHERE Comment.CourseId = Course.Id)" >
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
         </asp:SqlDataSource>
        </div><!-- end of div tag -->
<!-- end of the content page --></asp:Content>
