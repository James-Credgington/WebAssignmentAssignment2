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
using System.Text;

public partial class Admin_EditCourses : BasePage /* 'Admin_EditCourses' page is a subclass to the 'BasePage' */
{
    public string course; /* declaring this variable 'course' as a string and public too*/

    // variable with a primitive data type 'SqlConnection' called myConnection to start a connection with the database
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e) // when this webpage loads up
    {
        if (!this.IsPostBack) // if the data doesn't push back 
        {
            //Populating a DataTable from database.
            DataTable dt = this.GetData(); // setting a table up to import data into the database

            //Building an HTML string.
            StringBuilder html = new StringBuilder(); //creating an instanc eof a class called StrignBuilder as an object called html

            //Table start.
            html.Append("<br /><table class='editMenu'>");

            //Building the Header row.
            // below changing the headings of the table

            html.Append("<hr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                course = column.ColumnName;

                if (course == "Name")
                {
                    course = "Name";
                }
                else if (course == "AdditionalInformation")
                {
                    course = "Additional Information";
                }
                else if (course == "PartFullTime")
                {
                    course = "Part/ Full Time";
                }
                else if (course == "LevelOfCourse")
                {
                    course = "Level";
                }
                html.Append(course);
                html.Append("</th>");
            }
            
            html.Append("</tr>");

            //Building the Data rows into the database
            foreach (DataRow row in dt.Rows)
            {
               
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    course = Convert.ToString(row[column.ColumnName]);
                    if (course != "Name1")
                    {
                        html.Append(row[column.ColumnName]);
                    }
                    else {
                        html.Append("Subject Area");
                    }
                    
                    html.Append("</td>");
                    
                }
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }

    // start a new method with the primitive data type caleld 'DataTable' called 'GetData'

    private DataTable GetData()
    {
        // creating as a string the connecting to the database
        string constr = ConfigurationManager.ConnectionStrings["HigherEducationChesterfieldCollegeConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr)) // when the connection of the database is being use
        {
            // if the sql command is possible
            using (SqlCommand cmd = new SqlCommand("SELECT Course.Name, Course.AdditionalInformation, Course.PartFullTime, Course.LevelOfCourse, SubjectArea.Name FROM Course " +
                "INNER JOIN SubjectArea ON Course.SubjectAreaId = SubjectArea.Id"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter()) //using the sql data adapter
                { 
                    cmd.Connection = con; // start the conection and fill the data into the table
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable()) 
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }



}
