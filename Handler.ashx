<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using DB;

public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        int LOPID = 0;
        int STEP = 0;
        try
        {
            LOPID = int.Parse(context.Request["ID"]);
            STEP = int.Parse(context.Request["Step"]);
        }
        catch
        {
            context.Response.Write("bad request");
            return;
        }
        context.Response.ContentType = "image/jpeg";
        
        context.Response.Cache.SetCacheability(HttpCacheability.Public);
        context.Response.BufferOutput = false;
    }
    

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }

}