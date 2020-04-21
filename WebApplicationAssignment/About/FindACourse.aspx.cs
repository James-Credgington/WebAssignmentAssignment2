using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About_FindACourse : BasePage /* About_FindACourse Class is inherited by superclass BasePage */
{ 
    protected void Page_Load(object sender, EventArgs e)  /* start of pageLoad method */
    {
        /* new instance of class as an object called tables */
        using (HigherEducationChesterfieldCollegeEntities tables = new HigherEducationChesterfieldCollegeEntities()) 
        {
            /* var for authorised reviews is for all subject areas to be liste dinto the reepater */
            var authorizedReviews = from subjectArea in tables.SubjectAreas orderby subjectArea.Name ascending
                                    select subjectArea;
            Repeater1.DataSource = authorizedReviews.ToList();
            Repeater1.DataBind();
        }
    }
}