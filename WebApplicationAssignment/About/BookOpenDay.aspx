<%@ Page Title="Higher Education Chesterfield College - Book An Open Day" Language="C#" MasterPageFile="~/MasterPages/Master_User.master" AutoEventWireup="true" Debug="true"
    CodeFile="BookOpenDay.aspx.cs" Inherits="About_BookOpenDay" %>

<%@ Register src="~/Controls/BookAnOpenDay.ascx" tagname="BookOpenDay" tagprefix="uc2" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- content page starts -->
    <h1>Book An Open Day Today</h1><!-- heading to the page and brief introduction about the page -->
    <p>Fill the form below to book an open day at Chesterfield College, and take the oppurtunity to talk to tutors and other staff members about the course 
        you want to do, look at the facilities and support that can be provided during your time at Chesterfield College.</p>
    <uc2:BookOpenDay ID="BookOpenDay" runat="server" /><!-- improting an user control into the page -->
    <!-- content page ends -->
</asp:Content>