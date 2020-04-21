using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About_SubjectArea : BasePage /* About_SubjectArea class is being inherited by superclass BasePage */
{ 
    public int SubjectAreaId; /* integer called SubjectAreaId is public */
    public string cacheKey; /* string called cacheKey is public */

    protected void Page_Load(object sender, EventArgs e) /* start of the function when the page first loads which doesn't return anything */
    {
        SubjectAreaId = Convert.ToInt32(Request.QueryString.Get("SubjectAreaId")); /* converts the passed variable through url into an integer */
        cacheKey = "SubjectArea" + SubjectAreaId.ToString(); /*setting the cache key */
        SubjectArea mySubjectArea = Cache[cacheKey] as SubjectArea; /* creating a new instance of class by calling the object mySubjectArea */
        if (mySubjectArea == null) // when mySubejctArea is null
        {
            // creating a new instance of class by calling the object myEntities
            using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities())  
            {
                // statement below outputs all the courses that are part of that subject area
                var authorizedReviews = from course in myEntities.Courses 
                                        orderby course.Name ascending
                                        where course.SubjectAreaId == SubjectAreaId
                                        select course;
                Repeater1.DataSource = authorizedReviews.ToList(); // output courses to the page
                Repeater1.DataBind();
                mySubjectArea = (from r in myEntities.SubjectAreas // used to output data based on that subject area 
                            where r.Id == SubjectAreaId
                            select r).SingleOrDefault();
                if (mySubjectArea  != null) // when mySubjectArea is not empty
                {
                    Cache.Insert(cacheKey, mySubjectArea, null, DateTime.Now.AddSeconds(1), System.Web.Caching.Cache.NoSlidingExpiration); 
                    // updates changes every second, not possible to set it to 0
                }
            }
        }

        if (mySubjectArea != null) // when mySubjectArea is not empty
        {
            TitleLabel.Text = mySubjectArea.Name; // title label is set dynamically depending on what subject area is selected
            img_SubjectArea.ImageUrl = mySubjectArea.ImageUrl;
            BodyLabel.Text = mySubjectArea.AdditionalInformation; // setting BodyLabel.Text to what information from the database
            Title = "Higher Education Chesterfield College - " + mySubjectArea.Name; // setting the title of the page which depends on whcih subject area is selected */
         
        }
    } /* end of the function when the page loads */

    protected void Ddl_LevelOfCourse_SelectedIndexChanged(object sender, EventArgs e) /* when the level of course dropdown box is selected which doesn't return anything*/
    {
        SubjectArea LevelOfCourse = Cache[cacheKey] as SubjectArea; /* creating a new instance of the object under the class SubjectArea called LevelOfCourse */
        SubjectAreaId = Convert.ToInt32(Request.QueryString.Get("SubjectAreaId")); /*setting SubjectArea depending on the SubjectAreaId passed from the previous variable */
        int level = Convert.ToInt32(Ddl_LevelOfCourse.SelectedValue); /* setting the level of the course by an integer by converting value from drop down box */
        // creating a new instance of class by calling the object myEntities 
        using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities()) 
        {
            // statement updates the level of courses;
            var levelOfCourseReviews = from course in myEntities.Courses
                                           orderby course.Name ascending
                                           where course.SubjectAreaId == SubjectAreaId
                                           where course.LevelOfCourse == level
                                           select course;
                Repeater1.DataSource = levelOfCourseReviews.ToList(); // outputting repeater to pass variable through to the page 
                Repeater1.DataBind();
                LevelOfCourse = (from r in myEntities.SubjectAreas // outputting the courses that changes depending on the level of course that is selected
                            where r.Id == SubjectAreaId
                            select r).SingleOrDefault(); 
                if (LevelOfCourse != null) // when the level of course is nothing
                {
                    Cache.Insert(cacheKey, LevelOfCourse, null, DateTime.Now.AddSeconds(1), System.Web.Caching.Cache.NoSlidingExpiration); // updates the page every second
                }
            }
        // updating page infromation below just in case an administrator has changed information on the web page
        TitleLabel.Text = LevelOfCourse.Name; 
        BodyLabel.Text = LevelOfCourse.AdditionalInformation;
        Title = LevelOfCourse.Name;
    } /* end of level of course dropdown box method */

    protected void Ddl_TypeOfCourse_SelectedIndexChanged(object sender, EventArgs e) // start of the type of course selected item method 
    {
        SubjectArea TypeOfCourse = Cache[cacheKey] as SubjectArea; /* creating a new instance of the object under the class SubjectArea called TypeOfCourse */
        SubjectAreaId = Convert.ToInt32(Request.QueryString.Get("SubjectAreaId")); /*setting SubjectArea depending on the SubjectAreaId passed from the previous variable */
        string typeOfCourse = Ddl_TypeOfCourse.SelectedValue; // selecting  the value based on the part time of full time course selected
         
        using (HigherEducationChesterfieldCollegeEntities myEntities = new HigherEducationChesterfieldCollegeEntities()) // creating a new instance of class by calling the object myEntities 
        {
            // statement updates the type of course and outputs it onto the subject area page
            var levelOfCourseReviews = from course in myEntities.Courses
                                       orderby course.Name ascending
                                       where course.SubjectAreaId == SubjectAreaId && course.PartFullTime == typeOfCourse
                                       select course;

            Repeater1.DataSource = levelOfCourseReviews.ToList();
            Repeater1.DataBind();

           // selecting the subject areas again just in case they have been updated
            TypeOfCourse = (from r in myEntities.SubjectAreas
                            where r.Id == SubjectAreaId
                            select r).SingleOrDefault();
            if (TypeOfCourse != null) // when the type of null is not nothing
            {
                Cache.Insert(cacheKey, TypeOfCourse, null, DateTime.Now.AddSeconds(1), System.Web.Caching.Cache.NoSlidingExpiration); // updates the information every second
            }


        }
        // updating page infromation below just in case an administrator has changed information on the web page
        TitleLabel.Text = TypeOfCourse.Name;
        BodyLabel.Text = TypeOfCourse.AdditionalInformation;
        Title = TypeOfCourse.Name;

    } //end of the type of course selected item method 
}
