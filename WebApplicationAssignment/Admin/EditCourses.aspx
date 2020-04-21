<%@ Page Title="Higher Education Chesterfield College - Editing Courses" Language="C#" AutoEventWireup="true" CodeFile="EditCourses.aspx.cs" 
    MasterPageFile="~/MasterPages/Master_Admin.master"Inherits="Admin_EditCourses" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Editing Courses</h1><!-- heading for this page -->

    <!--  brief instruction to the administrator about this page -->
    <p>Press a button to modify a course, by adding a course, deleting a course and editing the information about a particular course</p>
   
    <!-- buttons off this page so information in the database can be edited -->
    <asp:Button ID="Btn_AddCourse" Text="Add Course" CssClass="leftButton" runat="server" PostBackUrl="~/Admin/AddCourse.aspx" SkinID="Button" />
    <asp:Button ID="Btn_DeleteCourse" Text="Delete Course" CssClass="rightButton" runat="server"  SkinID="Button" PostBackUrl="~/Admin/DeleteCourse.aspx"/>
    <asp:Button ID="Btn_EditCourse" Text="Edit Course" CssClass="rightButton" runat="server" SkinID="Button" PostBackUrl="~/Admin/EditCourseInfo.aspx"/>
    
       

    <br />
    <h2>Information about Courses</h2>
    <p>The table below shows the detail that is saved within the course table of the database.</p>
    <div class="editData"><!-- start of div with class editData -->
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><!-- placeholder which is where the table is created -->
    </div><!-- end of div-->
    <!-- end of the content page -->
</asp:Content>

