<%@ Page Language="C#" MasterPageFile="~/MasterPages/Master_User.master" Debug="true" AutoEventWireup="true" CodeFile="SubjectArea.aspx.cs" Inherits="About_SubjectArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
  <h1><asp:Label ID="TitleLabel" runat="server"></asp:Label></h1><!-- a label that changes value depending on what subject area is selected on the previous page -->
    <div class="column1of2subjectArea"><!-- start of div with class column1of2subjectArea -->
        <asp:Image ID="img_SubjectArea" CssClass="displayImage" runat="server" AlternateText="No image to view"/><!-- image that can be imported into the subject area -->
    </div>
    <div class="column2of2subjectArea"><!-- start of div with class column2of2subjectArea -->
         <asp:Label ID="BodyLabel" runat="server"></asp:Label><!-- label that gives general information on the subject area -->
    </div><!-- end of div -->
    

    <div class="column1of2course"><!-- start of div with class column1of2course -->
            <h2>Courses</h2><!-- subheading for courses that can be accessed for the subject area -->
        <!-- start of the repeater selecting all data in the course table -->
        <asp:Repeater ID="Repeater1" runat="server" ItemType="Course">
        <ItemTemplate>
            <!-- a hyperlink which outputs the name of the course and when it is pressed it changes -->
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" 
                NavigateUrl='<%# "Course.aspx?CourseId=" + Item.Id.ToString() %>' Text='<%# Item.Name + " (" + Item.PartFullTime + ")" %>'></asp:HyperLink>
        </ItemTemplate>
        </asp:Repeater><!-- end of the repeater -->
    </div><!-- end of div -->
    <div class="column2of2course"><!-- start of div with class column2of2course -->
        <h3>Academic Preferences</h3><!-- subheading for academic preferences only -->
        <!-- drop down box to filter the level of courses -->
        Level Of Course: <asp:DropDownList ID="Ddl_LevelOfCourse" AppendDataBoundItems="true" DataSourceID="GetDataLevelOfCourse" CssClass="dropDownAcademic" runat="server" 
            AutoPostBack="True"  DataTextField="LevelOfCourse" DataValueField="LevelOfCourse" OnSelectedIndexChanged="Ddl_LevelOfCourse_SelectedIndexChanged">
         </asp:DropDownList><br /><!-- end of drop down box --<
        <!-- dropdown box to filter through the full-time and part-time courses -->
         Type Of Course:  <asp:DropDownList ID="Ddl_TypeOfCourse" DataSourceID="GetDataTypeOfCourse" CssClass="dropDownAcademic" DataTextField="PartFullTime" DataValueField="PartFullTime" 
             runat="server"  AutoPostBack="True" OnSelectedIndexChanged="Ddl_TypeOfCourse_SelectedIndexChanged">
         </asp:DropDownList><!-- end of dropdown box -->
        <!-- sql data sources used for the drop down boxes and -->
        <asp:SqlDataSource runat="server" ID="GetDataTypeOfCourse" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT DISTINCT [PartFullTime] FROM [Course]" />
        <asp:SqlDataSource runat="server" ID="GetDataLevelOfCourse" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT DISTINCT [LevelOfCourse] FROM [Course] "/>
        
        <!-- dynamic list for the levels of courses selected -->
        <asp:SqlDataSource runat="server" ID="FilterCourses" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT * FROM [Course] WHERE LevelOfCourse=@LevelOfCourse" >
            <SelectParameters>
                <asp:ControlParameter ControlID="Ddl_LevelOfCourse" Name="LevelOfCourse"  PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource> <!-- end of dynamic list --><!-- end of sql data source -->

    </div><!-- end of div -->
    <!-- end of content pages -->
</asp:Content>

