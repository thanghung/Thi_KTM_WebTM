using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteTinTuc
{
    public partial class QL_ChuDe : System.Web.UI.UserControl
    {
        QuanLyTinTucEntities db = new QuanLyTinTucEntities();
        Random rd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowData();
            hienThi();
        }

        public void ShowData()
        {
            TableChuDe.DataSource = db.ChuDes.OrderByDescending(x => x.TenChuDe).ToList();
            TableChuDe.DataBind();

            if (TableChuDe.Rows.Count > 0)
                TableChuDe.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        public void hienThi()
        {
            if (Request.Cookies["id"] != null)
            {
                var id = Request.Cookies["id"].Value.Trim();
                ChuDe cd = db.ChuDes.Where(x => x.IDCD == id).SingleOrDefault();

                if (cd != null)
                    txtChuDe.Text = cd.TenChuDe;
            }

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            ChuDe cd = new ChuDe();
            int key = rd.Next(0, 99999999);
            var s = "CD" + key.ToString();

            while (db.ChuDes.Where(x => x.IDCD == s).SingleOrDefault() != null)
            {
                key = rd.Next(0, 99999999);
                s = "CD" + key.ToString();
            }

            cd.IDCD = "CD" + key.ToString();
            cd.TenChuDe = txtChuDe.Text;

            db.ChuDes.Add(cd);
            db.SaveChanges();
            Response.Redirect("/ChuDe/CD");
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"].Value.Trim();
            ChuDe cd = db.ChuDes.Where(x => x.IDCD == id).SingleOrDefault();

            cd.TenChuDe = txtChuDe.Text;


            db.ChuDes.Attach(cd);
            db.Entry(cd).State = EntityState.Modified;
            db.SaveChanges();

            HttpCookie ck = new HttpCookie("id");
            ck.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(ck);

            Response.Redirect("/ChuDe/CD");
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"].Value.Trim();
            ChuDe cd = db.ChuDes.Where(x => x.IDCD == id).SingleOrDefault();

            db.ChuDes.Remove(cd);
            db.SaveChanges();

            HttpCookie ck = new HttpCookie("id");
            ck.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(ck);
            Response.Redirect("/ChuDe/CD");
        }
    }
}