<%@ Page Language="C#" Title="Higher Education Chesterfield College - Contact Us" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="About_ContactUs"
    MasterPageFile="~/MasterPages/Master_User.master" %>
<%@ Register src="~/Controls/ContactUs.ascx" tagname="ContactForm" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" runat="server">
    <script>/*javascript function to refresh the page */
    function refresh() {
        window.location.refresh();
    }
</script> <!-- end of javascript section -->
    <h1>Contact Us</h1><!-- heading for contact Us page -->
   <section class="contactDetails"><!-- start of a section with a class called 'contactDetails' -->
   <div class="contactUs1of2"><!-- start of a div with class called 'columnUs1of2' -->
   <h2>Contact Details</h2><!-- subheading for contact details -->

        <p>Email Address: advice@chesterfield.ac.uk </p>
        <p>Address: Infirmary Road, Chesterfield S41 7NG</p>
        <p>Phone Number: 01246 500500</p>
   </div>
    <div class="contactUs2of2"><!-- start of a div with class called 'columnUs2of2' -->
        <h2>Chesterfield College's Location</h2><!-- subheading showing the colleges location -->
        <a href="https://www.google.co.uk/maps/place/Chesterfield+College/@53.2396172,-1.4266877,17z/data=!3m1!4b1!4m5!3m4!1s0x4879852e00ccc0e3:0x3c242c158806218a!8m2!3d53.239614!4d-1.424499">
            <asp:Image ID="imgMap" ImageUrl="/Images/mapWhereCollegeIs.JPG" CssClass="imgMap" runat="server"/></a>
    </div>
    </section><!-- end of a section with a class called 'contactDetails' -->
    
    <hr />
    <div class="contactInfo"><!-- start of a div with class called 'contactInfo' -->
        <h2 class="moreInfo">Contact Form</h2><!-- subheading to show clearly where the contact form is -->
    <p>If you want to make an enquiry about the main courses, or anything, write here!</p>
    <uc1:ContactForm ID="ContactForm" runat="server" /><!-- importing the contact form user control into the website -->
    </div><!-- end of a section with a class called 'contactInfo' -->


</asp:Content>
