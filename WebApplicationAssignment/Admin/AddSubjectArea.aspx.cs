using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Admin_AddSubjectArea : BasePage /* 'Admin_AddSubjectArea class is a subclass to the BasePage class  */
{
    String strConnString = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e) /* function for when the website loads */
    {
        con = new SqlConnection(strConnString);
        if (Request.QueryString.Get("Id") != null) /* if the session variable is not null */
        {
            addSubjectArea.DefaultMode = DetailsViewMode.Edit; /* can edit data into the database */
        }
    }
    
    private Boolean InsertUpdateData(SqlCommand cmd) // the function for the InsertUpdateDate with the parameter of a primitve datatype for an object called cmd
    {
        Lbl_DatabaseConnection2.Visible = false; //  the label is set not to be visible

        // start the connection to the database 

        // try statement when the connection of the database begins
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }

        // when database connection fails
        catch 
        {
            Lbl_DatabaseConnection2.Visible = true;
            return false;
        }

        // finally closes the system
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    protected void AddSubjectArea_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            EndEditing();
        }
    }
    private void EndEditing()
    {
        Response.Redirect("~/Admin/EditSubjectArea.aspx");
    }

    protected void AddSubjectArea_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }

    protected void Btn_SendImage_Click(object sender, EventArgs e)
    {
        con.Open();
        if (FileUpload1.HasFile)
        {
            string imageUrl = "~/Images/SubjectArea/";
            string physicalFolder = Server.MapPath(imageUrl);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

            fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));

            SqlCommand cmd = new SqlCommand("UPDATE SubjectArea SET ImageUrl = @ImageUrl WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@ImageUrl", Convert.ToString(imageUrl + fileName));
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(Ddl_SubjectArea.SelectedItem.Value));
            cmd.ExecuteNonQuery();
        }
        con.Close();
    }

    protected void Ddl_SubjectArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open(); // database is connection is open
        SqlCommand cmd = new SqlCommand("SELECT * FROM SubjectArea", con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Ddl_SubjectArea.DataTextField = ds.Tables[0].Columns["Name"].ToString();
        Ddl_SubjectArea.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        Ddl_SubjectArea.DataSource = ds.Tables[0];
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
