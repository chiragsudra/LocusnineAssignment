using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LocusnineAssignmentAPI
{
    public class ExceptionWrite
    {
        public static void Log(Exception ex, string source)
        {
            System.IO.StreamWriter file = new System.IO.StreamWriter(HttpContext.Current.Server.MapPath("~/Log.txt"));

            string logText = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss tt") + " | Message: " + ex.Message + " | Source: " + source;

            file.WriteLineAsync(logText);

        }
    }
}