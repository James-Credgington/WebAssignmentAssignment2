﻿<%@ Application Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Net.Mail" %>

<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(System.Web.Routing.RouteTable.Routes);
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", 
    new ScriptResourceDefinition
    {
        Path = "~/scripts/jquery-3.4.2.min.js",
        DebugPath = "~/scripts/jquery-3.4.2.min.js",
        CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
        CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
    });

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
