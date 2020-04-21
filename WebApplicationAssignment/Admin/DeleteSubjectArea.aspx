<%@ Page Title="Higher Education Chesterfield College - Deleting Subject Areas" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/Master_Admin.master" 
    CodeFile="DeleteSubjectArea.aspx.cs" Inherits="Admin_DeleteSubjectArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainSection" Runat="Server"><!-- start of the content page -->
    <h1>Delete Subject Area</h1><!-- heading of the page -->
    <!-- back button -->
    <asp:Button ID="Btn_Back" runat="server" SkinID="Button" CssClass="masterButton" Text="Back" PostBackUrl="~/Admin/EditSubjectArea.aspx" CausesValidation="False" /><br />
    <!-- description for the page -->
    <p>Press a delete button next to the row you want to delete, then that row you have pressed that button will be deleted.</p>
    <!-- label for when their is an error for database connection -->
                <asp:Label ID="DeleteLabel" runat="server" Text="" Visible="False"/>   
    <div class="editData"><!-- start of the div for a class called editData -->

        <!-- form for deleting subject areas by outputting everything into the database -->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="False" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SADeleteData" 
        EmptyDataText="There are no courses for you to delete.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="AdditionalInformation" HeaderText="Additional Information" SortExpression="AdditionalInformation" />
              
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SADeleteData" runat="server" ConnectionString="<%$ ConnectionStrings:HigherEducationChesterfieldCollegeConnectionString %>" 
            SelectCommand="SELECT * FROM [SubjectArea]" DeleteCommand ="DELETE FROM [SubjectArea] WHERE Id = @Id AND NOT EXISTS (SELECT * FROM [Course] WHERE 
            Course.SubjectAreaId = SubjectArea.Id)"  >
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
         </asp:SqlDataSource>
        </div><!-- end of div tag -->

 <!-- end of the content page -->
</asp:Content>