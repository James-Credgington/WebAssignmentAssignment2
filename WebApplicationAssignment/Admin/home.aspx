<%@ Page Title="Higher Education Chesterfield College - Home for Administrators" Language="C#" MasterPageFile="~/MasterPages/Master_Admin.master" AutoEventWireup="true" 
    CodeFile="Home.aspx.cs" Inherits="Admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Administrator Home</h1><!-- heading of the administrator home page -->
    <!-- introduction of the information about this page -->
    <p>With this account, you can create, modify and add courses to this website, as the courses stop and new ones come up. You can also do this subject areas too, 
        if lets say departments within the college start doing higher education courses, before you create the courses, you have to create the subject areas. With these feature 
        you will able to use this website for many years to come.</p>
        <h2 style="text-align: center">Edit Information</h2><!-- subheading for other links to the pages the adminsitrator are more likely to use -->
        <div class="moreInfo"><!-- start of div with class moreInfo -->
            <!-- link as a hyperlink with class img to the EditSubjectArea page with div class column1of3 -->
                <a class="img" href="EditSubjectArea.aspx"><div class="column1of3">
                        <img src="/Images/EditingSubjectArea.JPG" alt="Editing Subject Area" />Edit Subject Areas
                </div></a>
            <!-- link as a hyperlink with class img to the EditCourses page with div class column2of3 -->
                <a class="img" href="EditCourses.aspx"><div class="column2of3">
                        <img src="/Images/EditingCourses.JPG" alt="Editing Courses"/>Edit Courses
                </div></a>
            <!-- link as a hyperlink with class img to the ModifyComments page with div class column3of3 -->
                <a class="img" href="ModifyComments.aspx"><div class="column3of3">
                        <img src="/Images/comment.JPG" alt="Editing Comments"/>Edit Comments
                </div></a>
       </div><!-- end of div -->
<!-- end of the content page -->
</asp:Content>

