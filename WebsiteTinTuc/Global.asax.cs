using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebsiteTinTuc
{
    public class Global : System.Web.HttpApplication
    {
        //Hệ thống
        public static void TrangHeThong(RouteCollection routeCollection)
        {
            routeCollection.MapPageRoute("TrangChu", "TrangChu", "~/TrangChu.aspx");
            routeCollection.MapPageRoute("TrangChu_id", "TrangChu/{id}", "~/TrangChu.aspx");
            routeCollection.MapPageRoute("TacGia", "TacGia/{modul}", "~/TrangChu.aspx");
            routeCollection.MapPageRoute("TacGia_id", "TacGia/{modul}/{id}", "~/TrangChu.aspx");
            routeCollection.MapPageRoute("ChuDe", "ChuDe/{modul}", "~/TrangChu.aspx");
            routeCollection.MapPageRoute("ChuDe_id", "ChuDe/{modul}/{id}", "~/TrangChu.aspx");
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            TrangHeThong(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}