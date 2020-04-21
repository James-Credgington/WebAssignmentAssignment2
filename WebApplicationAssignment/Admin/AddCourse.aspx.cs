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

public partial class Admin_AddCourse : BasePage // 'Admin_AddCourse' is a class which is a subclass to the 'basePage ' 
{
    String strConnString = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e) // start of a method which runs when the page first loads up
    {
        con = new SqlConnection(strConnString);

        if (Request.QueryString.Get("Id") != null) // when the session variable is set not to be null.
        {
            addCourse.DefaultMode = DetailsViewMode.Edit; /* can edit data into the database */
        }
    }
    protected void BtnUpload_Click(object sender, EventArgs e) // when  upload button is rpessed
    {
        Lbl_DatabaseConnection.Visible = false;
       
    }
    private Boolean InsertUpdateData(SqlCommand cmd) // start of method that updates data into the datbaase
    {
        Lbl_DatabaseConnection2.Visible = false; // when the database connection label is not visible

        // connection of the database

        con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        // when the databasee won't connect, it will connect
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true; // return that its true
        }
        catch // otherwise
        {
            // database conenction to be visible
            Lbl_DatabaseConnection2.Visible = true;
            return false; // return that its false
        }
        finally // finally
        {
            con.Close(); // closes the connection
            con.Dispose();
        }
    }


    protected void AddCourse_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e) // when add course is not updated
    {
        if (e.Exception == null) // when the exception is not null
        { 
            EndEditing(); // calls endEditing()
        }
    }
    private void EndEditing() // start of end editing method
    {
        Response.Redirect("~/Admin/EditCourses.aspx"); // redirect to this page
    }


    protected void Btn_Back_Click(object sender, EventArgs e)
    {

    }

    protected void Btn_SendImage_Click(object sender, EventArgs e)
    {
        con.Open();
        if (FileUpload1.HasFile)
        {
            string imageUrl = "~/Images/Course/";
            string physicalFolder = Server.MapPath(imageUrl);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

            fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));

            SqlCommand cmd = new SqlCommand("UPDATE Course SET ImageUrl = @ImageUrl WHERE Id = @CourseId", con);
            cmd.Parameters.AddWithValue("@ImageUrl", Convert.ToString(imageUrl + fileName));
            cmd.Parameters.AddWithValue("@CourseId", Convert.ToInt32(Ddl_Course.SelectedItem.Value));
            cmd.ExecuteNonQuery();


        }
        con.Close();

    }

    protected void Ddl_Course_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open(); // database is connection is open
        SqlCommand cmd = new SqlCommand("SELECT * FROM Course", con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Ddl_Course.DataTextField = ds.Tables[0].Columns["Name"].ToString();
        Ddl_Course.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        Ddl_Course.DataSource = ds.Tables[0];
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void addCourse_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}
