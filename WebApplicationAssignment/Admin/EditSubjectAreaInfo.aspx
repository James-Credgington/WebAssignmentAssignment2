<%@ Page Title="Higher Education Chesterfield College - Editing Subject Area Information" Language="C#" AutoEventWireup="true" CodeFile="EditSubjectAreaInfo.aspx.cs"
    MasterPageFile="~/MasterPages/Master_Admin.master" Inherits="Admin_EditSubjectAreaInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Edit Subject Area Information</h1><!-- heading of the page -->

    <!-- back button -->
    <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditSubjectArea.aspx" /><br />
    
    <!-- data source output from the subject area of the database --->
    <asp:SqlDataSource ID="SubjectAreaDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
        SelectCommand="SELECT * FROM [Course]"/>
    <!-- description about the page -->
        <p>You can only change some things about the subect, e.g. its name, additional information. If you want to change anything more, you will have to delete that course and start again.
            Sorry for any inconvenience.</p>
    <div class="editData"><!-- start of div with class editData -->
        <!-- form for ediitng data in the table -->
        <asp:GridView ID="GridView1" runat="server" AllowPaging="False" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SubjectAreaEditData" 
            EmptyDataText="There are no courses for you to delete.">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="AdditionalInformation" HeaderText="Additional Information" SortExpression="AdditionalInformation" />
               
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SubjectAreaEditData" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT * FROM [SubjectArea]" UpdateCommand ="UPDATE [SubjectArea] SET [Name] = @Name, AdditionalInformation=@AdditionalInformation WHERE Id=@Id" >
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="AdditionalInformation" Type="String" />

            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="AdditionalInformation" Type="String" />

            </UpdateParameters>
         
         </asp:SqlDataSource>
     </div><!-- end of div -->
    <!-- end of the content page -->
</asp:Content>