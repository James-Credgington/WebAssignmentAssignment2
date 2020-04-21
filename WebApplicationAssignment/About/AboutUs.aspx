<%@ Page Language="C#" Title="Higher Education Chesterfield College - About Us" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="About_AboutUs" Debug="true" MasterPageFile="~/MasterPages/Master_User.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" runat="server"><!-- start of the content page -->
    <h1>About Us</h1><!-- heading of the page -->

    
    <div class="uniCentre"> <!-- start of div with class uniCentre -->
        <p class="normal"><!-- paragraph with class normal -->
            <!-- image for abotu section -->
       <asp:Image ID="imgAbout" height="224px" width="301px" CssClass="imgAboutUs" runat="server" ImageUrl="~/Images/aboutUsImage.jpg" /> The campus the University Centre is located on,
            is on the Infirmary Road Campus, but you can access the centre from Sheffield Road. Where it has good on-site IT facilities, libraries and loads of on-site refectories It is 
            a short walk from Chesterfield Town Centre and Chesterfield Station, which has regular trains from places such as: Sheffield, Nottingham and Derby. Chesterfield is a great place
            to study, because in the town centre, when you're not studying and want to have a break, there are access to bars, coffee shops and restaurants, cinemas and several parks. 
            However, if you want to get out of Chesterfield and into the countryside, there is the Peak District a short distance away where there are lots of  fantastic walks or if you want
            to visit stately homes including Chatsworth and Hardwick Hall.</p>
    </div><!-- end of div tag -->
    
    
    
    <h2>Support for doing University-level Courses</h2><!-- heading for support for Uni-level courses -->
    <div class="support"> <!-- start of support with class uniCentre -->
        <!-- paragraph with class normal -->
    <p class="normal" id="p_content">You can get a wide range of support including, Additional Learning Support, Extra Financial Support and even support for future career plans and support when your course is over. When you apply for the course here, you will have an interview, where if you got an conditions or other support, you can let them know and other arrangements can be made. Some of the arrangements and help college can be provided are listed below. </p>
     <br /><!-- line break -->
    <h3> Additional Learning Support</h3><!-- subheading for additonal learning support section -->
    <p class="normal">Some of the support included are:</p><!-- paragraph with class normal -->
    <ul><!-- bulletpoints about Learning Support -->
        <li>Literacy and numeracy support in the classroom or on a one-to-one basis in the Student Support Hub.</li>
        <li>Support for dyslexia dyscalculia, autism spectrum disorder or dyspraxia if required.</li>
        <li>Support for deaf and hearing imparing students including signing and adapting learning materials.</li>
        <li>Support for visually impaired students including enlarged print, braille literature and computer software.</li>
        <li>Assitive technology such as a laptop loan, access to Read Write Gold and Inspiration 8 on the college systems</li>
    </ul><!-- end of bulletpoint list -->
      <br /><!-- line break -->
    <h3>Extra Financial Support</h3><!-- subheading for extra financial support -->
    <p class="normal">Some of the support included are:</p><!-- paragraph with class normal -->
    <ul><!-- bulletpoint list of support in college -->
        <li>You can apply for the bursary (don't need to pay back), which can go towards travel, books and equipment</li>
        <li>If you have a disability or specific learning difficulty that requires extra tuition or support, you may be eligible for the Disabled Students' Allowance. Can be used for expenses such as wequipment, travel, support workers and other associated  costs.</li>
        <li>May also be eligible for additional financial support such as council tax relief, child task credits and parents' Learning allowance.</li>
        <li>If you want further information look at the <a href="https://www.chesterfield.ac.uk/knowledge-base/professional-and-university-level-loans/"> Chesterfield College Website</a></li>
    </ul><!-- end of bulletpoint list -->
    

    <h3>Starting your Career and Support</h3><!-- subheading for career and support section -->
    <p class="normal">Some of the support included are:</p> <!-- paragraph with class normal -->
    <ul><!-- bulletpoint list of support and career in college -->
       
        <li>The Careers and Employment hub is here to support you with decisions about your future career path and help you plan your next steps, including CV writing, interview techniques, job searching and managing your money </li>
        <li>The Wellbeing Hub is available to help with any extra support you might need whilst studying with us. From helping with exam stress to counselling, or any other issue you might need help with, we're here to help.</li>
        <li>Chesterfield College Group is committed to safeguarding students, staff and visitors, which includes keeping everyone safe on campus. This includes ensuring the health, safety and wellbeing of all our students too.</li>
    </ul>    
    </div> <!-- end of div tag -->

    <div class="facilities"> <!-- start of div with class facilities -->
    <h2>Facilities</h2><!-- heading for facilities -->
    

    <h3>Lilypad</h3><!-- subheading for lilypad -->
     <div class="eachFacility"><!-- start of div with class eachFacility -->
    <!-- image for lilypad restaurant -->
    <p><img class="images" alt="Lilypad Restaurant" runat="server" src="~/Images/lilypad.jpg" />
    This award winning cafe located in Chesterfield Town Centre, has recently opened up at Chesterfield College's University Centre and is located next to the University Centre's study area. It's there for students to get a light bite to eat, takeaway or even fancy a bit of al fresco dining with a delicious selection of savoury food, cakes and hot and cold drinks.</p>
    </div>
        <br />

    <h3>Taste</h3><!-- subheading for taste restaurant -->
        <!-- image for taste restaurant -->
    <div class="eachFacility">
    <p><img class="images" alt="Taste Restaurant" runat="server"  src="~/Images/tasteSalon.jpg" />This cafe is run by the college's Catering students, which open during term time to students, staff and the public. Serving delicious lunches anad snacks, which also hosts charity theme nights with a three course dinner, drinks and the opportunity to raise money towards a good cause. Its located in the South Block Building on the 1st floor, near the Heartspace.</p></div>
    </div>
    <br />
    <h3>Costa Coffee</h3><!-- subheading for costa -->
    <div class="eachFacility"><!-- start of div with class eachFacility -->

    <p><img class="images" runat="server" alt="Costa Coffee at Chesterfield College"  src="~/Images/costaCoffee.jpeg" />Costa Coffee has come to Chesterfield, where students can sit around the sofas and tables over a Coffee, a cake or even lunch. Also, can walk there since their is plug sockets, so students can work and plug their mobile phones and laptops in their too.</p>
    </div><!-- end of div tag -->
    <br />

    <h3>Queen's Park Sports Centre</h3><!-- subheading for Queens Park Sports Centre -->
    <div class="eachFacility">
    <p><img class="images" runat="server" alt="Queens Park Sports Centre" src="~/Images/QueensPark.jpeg" />If you are doing a course involving Sports or interested in doing a sport as a hobby, you will have access to Queens Park Sports Centre. <br /> This Sports Centre includes:</p>
        <ul><!-- bulletpoint list of the features at Queens Park -->
            <li>Eight-lane swimming pool</li>
            <li>80-station gym</li>
            <li>Freedom Climbing Wall</li>
            <li>Eight-court Sports Hall</li>
        </ul><!-- end of bulletpoint list -->
        <br /><!-- line break -->
      </div><!-- end of div tag -->

    

    <h3>Look Salon</h3><!-- subheading for look salon -->
        <!-- image for look salon -->
    <div class="eachFacility">
        <p><img alt="Look Salon Picture" runat="server" class="images" src="~/Images/looksSalon.jpg" />If you fancy treating yourself to a new haircut or beauty treatment you can head to our salon which is 
            run by our hair and beauty students and their tutors. Whether you're after a massage or a manicure, our students will give you a
            professional service for a fraction of the price of high street salons.</p>
    </div>

    <br />
    <h3>Learning Resources</h3><!-- subheading for learning resources -->
    <div class="eachFacility">
        <p><img class="images" runat="server" alt="Learning Resource Centres at Chesterfield College" src="~/Images/chesterfieldCollegeLearningCentre.jpg" />We provide access to a wide range of learning resources at Chesterfield college, such as our library, three learning centres and laptops for students to borrow. There is a learning centre inside the University Centre and you can also borrow laptops there too, as well as the main library<br /> There are plenty of course materials available in both print and electronic formats to support you in your studies. You can also benefit from study skills workshops run by our learning resources teams on subjects such as essay writing, referencing (no matter what type of referencing you use for your course) and online research. The main Library contains a wide selection of books helping Students doing their work.</p><!-- image for learning resource centre -->
    </div><!-- end of div tag -->
    <!-- end of content page -->
</asp:Content>
