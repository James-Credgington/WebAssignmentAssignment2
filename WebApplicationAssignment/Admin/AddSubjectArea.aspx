<%@ Page Title="Higher Education Chesterfield College - Adding Subject Areas" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_Admin.master" 
    CodeFile="AddSubjectArea.aspx.cs" Inherits="Admin_AddSubjectArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of content -->
    <h1>Add Subject Areas</h1><!-- heading for this page -->

    <!-- back button for this page going back to the editSubjectArea page -->
    <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditSubjectArea.aspx" CausesValidation="False" /><br />
    <p>This page you can import an image ready to be used to be uploaded so the user can see it and can also write some information for that subject area in the website too.</p>
        
     
        <h2 class="left">Add Image</h2><!-- subheading for adding image page with the class saying left -->
        <!-- label that appears to be visible whether it is visible or not -->
        <asp:Label ID="Lbl_DatabaseConnection" runat="server" CssClass="errorMessage" Visible="false" Text="Cannot connect to the database." />
     <div class="addData"><!-- start of div with class addData-->
    <table runat="server" class="form">
        <tr>
            <td><asp:DropDownList ID="Ddl_SubjectArea" runat="server"  DataSourceID="SubjectArea" DataTextField="Name" DataValueField="Id"/>
                <asp:SqlDataSource ID="SubjectArea" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [SubjectArea]"></asp:SqlDataSource>
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
            <br />
    

        
    <h2 class="left">Add Content for Subject Area's pages</h2><!-- subheading for adding content for subject areas page with the class saying left -->

    <!-- label for connecting to the databases -->
    <asp:Label ID="Lbl_DatabaseConnection2" runat="server" CssClass="errorMessage" Visible="false" Text="Cannot connect to the database." />

    <!-- form for adding subject area information into the database -->
    <asp:DetailsView ID="addSubjectArea" runat="server" CssClass="addData" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="AddIntoSubjectAreaTable" DefaultMode="Insert" 
        Height="50px" Width="125px" OnItemUpdated="AddSubjectArea_ItemUpdated" GridLines="None" OnPageIndexChanging="AddSubjectArea_PageIndexChanging">
     <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
      <asp:TemplateField HeaderText="Name" SortExpression="Name_SA">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_SA_Name" runat="server" CssClass="txt_addData" Text='<%# Bind("Name") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_SA_Name" runat="server" ErrorMessage="Enter a Subject Area Name" CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_SA_Name" runat="server" CssClass="txt_addData" Text='<%# Bind("Name") %>'></asp:TextBox><br />
          <asp:RequiredFieldValidator ControlToValidate="Txt_SA_Name" runat="server" ErrorMessage="Enter a Subject Area Name" CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Extra Information" SortExpression="Extra Information">
        <EditItemTemplate>
          <asp:TextBox ID="Txt_Extra_Info_SA" CssClass="txt_addData" TextMode="MultiLine" Width="200" Height="100" runat="server" Text='<%# Bind("AdditionalInformation") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_Extra_Info_SA" runat="server" ErrorMessage="Enter some extra information based on this course please." CssClass="errorMessage" />
        </EditItemTemplate>
        <InsertItemTemplate>
          <asp:TextBox ID="Txt_Extra_Info_SA" CssClass="txt_addData" TextMode="MultiLine" Width="200" Height="100" runat="server" Text='<%# Bind("AdditionalInformation") %>'></asp:TextBox>
          <asp:RequiredFieldValidator ControlToValidate="Txt_Extra_Info_SA" runat="server" ErrorMessage="Enter some extra information based on this course please." CssClass="errorMessage" />
        </InsertItemTemplate>
      </asp:TemplateField>
         <asp:CommandField ShowInsertButton="True" ButtonType="Button" ControlStyle-CssClass="masterButtonLeft"/>
    </Fields>
    </asp:DetailsView>

       <!--the data sources for this page -->

    <asp:SqlDataSource ID="AddIntoSubjectAreaTable" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        DeleteCommand="DELETE FROM [SubjectArea] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [SubjectArea] ([Name, [ImageUrl], [AdditionalInformation]) VALUES (@Name, @ImageUrl, @AdditionalInformation)" 
        SelectCommand="SELECT * FROM [SubjectArea]" UpdateCommand="UPDATE [SubjectArea] SET [Name] = @Name, [ImageUrl] = @ImageUrl, 
        [AdditionalInformation] = @AdditionalInformation WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="AdditionalInformation" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="AdditionalInformation" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <!-- end of content -->
</asp:Content>