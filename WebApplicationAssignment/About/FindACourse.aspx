<%@ Page Title="Higher Education Chesterfield College - Find A Course" Language="C#" AutoEventWireup="true" CodeFile="FindACourse.aspx.cs" Debug="true" 
    MasterPageFile="~/MasterPages/Master_User.master" Inherits="About_FindACourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" runat="server"><!-- start of content page -->

    <h1>Find a Course Here Today!</h1><!-- heading for the page -->
    <!-- paragraph about the range of courses the college has to offer -->
    <p>There are a wide range of courses at the University Centre at Chesterfield College. Courses ranging from levels 4 to 7 and in subjects academic as business and practical 
        and hands-on like Sport. There will be at least one course here that will suit you. These courses are endorsed by major universities including: University of Derby and 
        Sheffield Hallam University, making these courses very high quality.</p>
    <h2>Subject Areas</h2><!-- subheading for subject areas -->
    <div><!-- start of div -->
        <!-- the repeater that outputs all the data from the SubjectArea entity --><!-- Item template starts -->
    <asp:Repeater ID="Repeater1" runat="server" ItemType="SubjectArea">
    <ItemTemplate> 
        <!-- dynamic hyperlink which passes data which opens the same page, but outputs different data -->
      <asp:HyperLink ID="HyperLink1" cssClass="link" runat="server" NavigateUrl='<%# "SubjectArea.aspx?SubjectAreaId=" + Item.Id.ToString() %>' Text='<%# Item.Name %>'>
          <img src="Images/courselink.JPG" /></asp:HyperLink>
    </ItemTemplate>
  </asp:Repeater>
        <!-- Item template ends --><!-- end of the repeater -->
        </div><!-- end of div -->
    <!-- end of content page -->
</asp:Content>