using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Enquiry
/// </summary>
public class Enquiry
{
    public Enquiry()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string EmailAddress { get; set; }
    public string MessageSubject {get; set; }
    public string Message { get; set; }

}