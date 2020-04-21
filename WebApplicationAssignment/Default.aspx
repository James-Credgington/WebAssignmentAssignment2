<%@ Page Language="C#" Title="Higher Education Chesterfield College - Home" Debug="true" MasterPageFile="~/MasterPages/Master_User.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" runat="server"> 
        <!-- start of the content page when it links with the master page -->
       
        
        <h1 >Welcome to Higher Education at Chesterfield College!</h1><!-- heading of the page -->

        <!-- introduction to the image which includes a picture -->
        <p class="introText"><img  alt="Picture of the University Centre at Chesterfield College" 
            class="introPicture" src="Images/mainone.JPG" />Chesterfield College has offered university-level programmes to the local community for over 40 years. 
            We have shaped an offer that meets the needs of both school leaders and adults who want to return to study later in life. Whether you are looking to take your 
            first step on the career ladder, revisiting education to study at a higher level, or wanting to pursue specialist knowledge in a particular field, you can achieve your
            ambitions at your local college.</p>
        <h2>Our Social Network</h2>
        <p>Go to the link below to join the Social Network the Higher Education Centre at Chesterfield College has, whether you are a student or not. Whether it is finding about the courses are like by speaking to students that are actually on the college or current students can use it to collaborate on group projects on their course</p><br />
        <asp:Button ID="Btn_SocialNetwork" runat="server" text="Go to SocialNetwork" SkinID="Button" CssClass="masterButtons" PostBackUrl="~/About/LogInUser.aspx" />
        
        <!-- subheading for open days -->
         <h2>Come and see us on one of our Open Days</h2>
        <div class="openDaysVideo">  <!-- start of open days video class for div -->
        <iframe src="https://www.youtube.com/embed/yfzXPgWODnU" class="youTube"></iframe>
        </div><!-- end of div -->
       
        <div class="openDaysInfo"><!-- start of div with openDaysInfo class -->
            <!-- list of the open days student can come to see the college -->
                <p>If you want to find out about more information about the University-level programmes, come to one of our open days this year:</p>
                <ul>
                    <li>Wednesday 29th January 2020 4.30pm -7.30pm</li>
                    <li>Thursday 17th March 2020 4.30pm - 7.30pm</li>
                    <li>Saturday 13th June 2020 10.30 am - 1.30pm</li>
                </ul>
                <!-- button that links to the bookOpenDay page using the button skin file and css file masterButtons-->
                <asp:Button ID="bookOpenDay" SkinID="Button" CssClass="masterButtons" runat="server" text="Book an Open Day today" PostBackUrl="~/About/BookOpenDay.aspx"/>
        </div><!-- end of div -->
        <br /> <!-- breakpoint -->

        <h2 class="headingFindInfo">Find more Information</h2><!-- subheading with the class 'headingFindInfo -->
        <div class="moreInfo"> <!-- start of div with the class 'moreInfo' -->

                <!-- hyperlink to 'FindACourse' page with class image and the image start of div with class column1of3-->
                <a class="img" href="About/FindACourse.aspx"><div class="column1of3">
                        <img src="Images/courselink.JPG" />Find a Course Today
                </div></a><!-- end of div -->
                <!-- hyperlink to 'AboutUs' page with class image and the image start of div with class column2of3-->
               <a class="img" href="About/AboutUs.aspx"><div class="column2of3">
                        <img src="Images/aboutus.JPG" />About Us
                </div></a><!-- end of div -->
                <!-- hyperlink to 'ContactUs' pagewith class image and the image start of div with class column3of3-->
                <a class="img" href="About/ContactUs.aspx"><div class="column3of3">
                        <img src="Images/contactuslink.JPG" />Contact Us
                </div></a><br /><!-- end of div -->
       </div><!-- end of div -->
        <br />

        

        <!-- not fully completed below -->
        <!-- end of content page -->
  </asp:Content>

   

