<%@ Page Title="Higher Education Chesterfield College - Editing Subject Areas" Language="C#" AutoEventWireup="true" CodeFile="EditSubjectArea.aspx.cs" 
    MasterPageFile="~/MasterPages/Master_Admin.master" Inherits="Admin_EditSubjectArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content page -->
    <h1>Editing Subject Areas</h1><!-- heading of the page -->

    <!-- instruction on how to use this administrator facility and links to other pages to what administrators can do with subject areas -->
    <p>Press a button to modify a course, by adding a subject area, deleting a subject area and editing the information about a particular subject area.</p>
    <asp:Button ID="Btn_AddSubjectArea" CssClass="leftButton" Text="Add Subject Area" runat="server" PostBackUrl="~/Admin/AddSubjectArea.aspx" SkinID="Button"/>
    <asp:Button ID="Btn_DeleteSubjectArea" CssClass="rightButton" Text="Delete Subject Area" runat="server" PostBackUrl="~/Admin/DeleteSubjectArea.aspx" SkinID="Button"/>
       
    <asp:Button ID="Btn_EditSubjectArea" Text="Edit Subject Area" CssClass="rightButton" runat="server" SkinID="Button" PostBackUrl="~/Admin/EditSubjectAreaInfo.aspx"/>
    <!-- displaying the information about subject areas with a subheading and table below -->
           <br />
    <h2>Information about Subject Areas</h2>
    <p>The table below shows the detail that is saved within the course table of the database.</p>
    <div class="editData">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </div>
    <!-- start of content page -->
</asp:Content>