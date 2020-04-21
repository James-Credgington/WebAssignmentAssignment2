<%@ Page Title="Higher Education Chesterfield College - Adding Courses" Language="C#" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs"
    MasterPageFile="~/MasterPages/Master_Admin.master" Inherits="Admin_AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content page -->
    <h1>Add Courses</h1><!-- heading for the page -->

    <!-- back button not go back to the previous page -->
         <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditCourses.aspx" 
             CausesValidation="False" OnClick="Btn_Back_Click" /><br />
    
    <!-- introduction for the addCourse page -->
    <p>This page you can import an image ready to be used to be uploaded so the user can see it and can also write some information for that 
        course in the website too.</p>
    
    <!-- heading for the class left for the adding images pages -->
    <h2 class="left">Add Image</h2>
     <asp:Label ID="Lbl_DatabaseConnection" runat="server" CssClass="errorMessage" Visible="false" Text="Cannot connect to the database." />

         <div class="addData"><!-- start of div with class addData-->
    <table runat="server" class="form">
        <tr>
            <td><asp:DropDownList ID="Ddl_Course" runat="server"  DataSourceID="Course" Width="200"  DataTextField="Name" DataValueField="Id"/>
                <asp:SqlDataSource ID="Course" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [Course]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
            <td><asp:Label ID="lblMessage" runat="server" CssClass="errorMessage"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Button ID="Btn_SendImage" runat="server" Text="Add Image" CssClass="masterButton" SkinID="Button" OnClick="Btn_SendImage_Click" CausesValidation="False" /></td>
        </tr>
    </table>

        
         </div><!-- end of div -->
            <br /><br />
    <!-- heading for the class left for adding content to course pages -->
    <h2 class="left">Add Content for Courses pages</h2>

    <!-- label which is invisible unless the connection to the database is not working -->
    <asp:Label ID="Lbl_DatabaseConnection2" runat="server" CssClass="errorMessage" Visible="false" Text="Cannot connect to the database." />
    
    <!-- form for adding courses into the database. Includes validation where appropriate whether the textboxes have no text or have 
        data to be wrong when entered into the database -->
    <asp:DetailsView ID="addCourse" runat="server" CssClass="addData" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="AddIntoCourseTable" 
        DefaultMode="Insert" Height="50px"  OnItemUpdated="AddCourse_ItemUpdated" OnPageIndexChanging="addCourse_PageIndexChanging" SkinID="Button">
     <Fields>
      <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
      <asp:TemplateField HeaderText="Subject Area:" SortExpression="SubjectAreaID">
        <EditItemTemplate>
          <asp:DropDownList ID="Ddl_SubjectArea" runat="server" CssClass="txt_addData" DataSourceID="SubjectAreaDataSource" 
              DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("SubjectAreaId") %>' />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:DropDownList ID="Ddl_SubjectArea" runat="server" CssClass="txt_addData" DataSourceID="SubjectAreaDataSource" 
              DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("SubjectAreaId") %>' />
        
        </InsertItemTemplate>
      </asp:TemplateField>
         <asp:TemplateField HeaderText="Name" SortExpression="Name">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_Course_Name" runat="server" CssClass="txt_addData" Text='<%# Bind("Name") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_Course_Name" runat="server" ErrorMessage="Enter a Subject Area Name" 
              CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_Course_Name" runat="server" CssClass="txt_addData" Text='<%# Bind("Name") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_Course_Name" runat="server" ErrorMessage="Enter a Subject Area Name" 
              CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Extra Information" SortExpression="Extra Information">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_Extra_Info_Course" CssClass="txt_addData" TextMode="MultiLine" Width="200" Height="100" runat="server" 
              Text='<%# Bind("AdditionalInformation") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_Extra_Info_Course" runat="server" ErrorMessage="Enter some extra information <br /> based on this course please." CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_Extra_Info_Course" CssClass="txt_addData" TextMode="MultiLine" Width="200" Height="100" runat="server" 
              Text='<%# Bind("AdditionalInformation") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_Extra_Info_Course" runat="server" ErrorMessage="Enter some extra information <br /> based on this course please." CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Level" SortExpression="LevelOfCourse">
        <EditItemTemplate>

           <asp:DropDownList ID="Ddl_LevelOfCourse" runat="server" CssClass="txt_addData" SelectedValue='<%# Bind("LevelOfCourse") %>'>
                  <asp:ListItem Selected="true" Value="0">Select a Level</asp:ListItem>
                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                   <asp:ListItem Text="5" Value="5"></asp:ListItem>
                   <asp:ListItem Text="6" Value="6"></asp:ListItem>
                   <asp:ListItem Text="7" Value="7"></asp:ListItem>
          </asp:DropDownList><br />
           <asp:CompareValidator ID="ReqLevelOfCourse" runat="server" ControlToValidate="Ddl_LevelOfCourse" 
               ErrorMessage="Select an level of course please."
             ValueToCompare="0" Operator="NotEqual" CssClass="errorMessage"/>

        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:DropDownList ID="Ddl_LevelOfCourse" runat="server" CssClass="txt_addData" SelectedValue='<%# Bind("LevelOfCourse") %>'>
                  <asp:ListItem Selected="true" Value="0">Select a Level</asp:ListItem>
                   <asp:ListItem Text="4" Value="4"></asp:ListItem>
                   <asp:ListItem Text="5" Value="5"></asp:ListItem>
                   <asp:ListItem Text="6" Value="6"></asp:ListItem>
                   <asp:ListItem Text="7" Value="7"></asp:ListItem>
          </asp:DropDownList><br />
           <asp:CompareValidator ID="ReqLevelOfCourse" runat="server" ControlToValidate="Ddl_LevelOfCourse" 
               ErrorMessage="Select an level of course please."
             ValueToCompare="0" Operator="NotEqual" CssClass="errorMessage"/>
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Part/Full Time" SortExpression="DaysAWeek">
        <EditItemTemplate>
          <asp:RadioButtonList ID="Rbl_FullPartTime" runat="server"  RepeatDirection="Vertical" Width="254px" SelectedValue='<%# Bind("PartFullTime") %>'>
                    <asp:ListItem Text="Full-Time" Value="Full-Time">
                    </asp:ListItem>
                    <asp:ListItem Text="Part-Time" Value="Part-Time">
                    </asp:ListItem>

                </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="Rfv_FullPartTime" ErrorMessage="Please select whether the course is <br  /> either full or part time please."
            ControlToValidate="Rbl_FullPartTime" runat="server"  Display="Dynamic" CssClass="errorMessage" />

        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:RadioButtonList ID="Rbl_FullPartTime" runat="server"  RepeatDirection="Horizontal" Width="254px" SelectedValue='<%# Bind("PartFullTime") %>'>
                    <asp:ListItem Text="Full-Time" Value="Full-Time">
                    </asp:ListItem>
                    <asp:ListItem Text="Part-Time" Value="Part-Time">
                    </asp:ListItem>

                </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="Rfv_FullPartTime" ErrorMessage="Please select whether the course is <br /> either full or part time please."
            ControlToValidate="Rbl_FullPartTime" runat="server"  Display="Dynamic" CssClass="errorMessage" />
        </InsertItemTemplate>
       </asp:TemplateField>
         <asp:CommandField ShowInsertButton="True" ButtonType="Button" ControlStyle-CssClass="masterButtonLeft" />
    </Fields>
    </asp:DetailsView>

    <!-- data sources for this page -->

    <asp:SqlDataSource ID="SubjectAreaDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        SelectCommand="SELECT [Id], [Name] FROM [SubjectArea]" />
    <asp:SqlDataSource ID="AddIntoCourseTable" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        DeleteCommand="DELETE FROM [Course] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Course] ([Name], [AdditionalInformation], [PartFullTime], [LevelOfCourse], [SubjectAreaId]) 
        VALUES (@Name, @AdditionalInformation, @PartFullTime, @LevelOfCourse, @SubjectAreaId)" 
        SelectCommand="SELECT * FROM [SubjectArea]" 
        UpdateCommand="UPDATE [Course] SET [Name] = @Name, [ImageUrl] = @ImageUrl, [AdditionalInformation] = @AdditionalInformation,
        [Part/FullTime] = @FullPartTime, [LevelOfCourse] = @LevelOfCourse, [SubjectAreaId] = @SubjectAreaId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="AdditionalInformation" Type="String" />
            <asp:Parameter Name="PartFullTime" Type="String" />
            <asp:Parameter Name="LevelOfCourse" Type="Int32" />
            <asp:Parameter Name="SubjectAreaId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="AdditionalInformation" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="PartFullTime" Type="String" />
            <asp:Parameter Name="LevelOfCourse" Type="Int32" />
            <asp:Parameter Name="SubjectAreaId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- start of content page -->
</asp:Content>