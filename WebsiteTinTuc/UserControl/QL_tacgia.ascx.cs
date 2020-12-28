using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteTinTuc
{
    public partial class QL_tacgia : System.Web.UI.UserControl
    {
        QuanLyTinTucEntities db = new QuanLyTinTucEntities();
        Random rd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowData();
            HienThi();
        }

        public void ShowData()
        {
            tabletacgia.DataSource = db.TacGias.OrderByDescending(x => x.TenTG).ToList();
            tabletacgia.DataBind();

            if (tabletacgia.Rows.Count > 0)
                tabletacgia.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        public void HienThi()
        {
            if (Request.Cookies["id"] != null)
            {
                var id = Request.Cookies["id"].Value.Trim();
                TacGia tg = db.TacGias.Where(x => x.IDTG == id).SingleOrDefault();

                if(tg != null)
                {
                    txtTacGia.Text = tg.TenTG;
                    txtNgaySinh.Text = tg.NgaySinh;
                    txtSDT.Text = tg.SDT;
                }    
              
            }


        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            TacGia tg = new TacGia();
            int key = rd.Next(0, 99999999);
            var s = "TG" + key.ToString();

            while (db.TacGias.Where(x => x.IDTG == s).SingleOrDefault() != null)
            {
                key = rd.Next(0, 99999999);
                s = "TG" + key.ToString();
            }

            tg.IDTG = "TG" + key.ToString();
            tg.TenTG = txtTacGia.Text.Trim();
            tg.NgaySinh = txtNgaySinh.Text.Trim();
            tg.SDT = txtSDT.Text.Trim();


            db.TacGias.Add(tg);
            db.SaveChanges();
            Response.Redirect("/TacGia/TG");
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"].Value.Trim();
            TacGia tg = db.TacGias.Where(x => x.IDTG == id).SingleOrDefault();

            tg.TenTG = txtTacGia.Text.Trim();
            tg.NgaySinh = txtNgaySinh.Text.Trim();
            tg.SDT = txtSDT.Text.Trim();


            db.TacGias.Attach(tg);
            db.Entry(tg).State = EntityState.Modified;
            db.SaveChanges();

            HttpCookie ck = new HttpCookie("id");
            ck.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(ck);

            Response.Redirect("/TacGia/TG");
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            var id = Request.Cookies["id"].Value.Trim();
            TacGia tg = db.TacGias.Where(x => x.IDTG == id).SingleOrDefault();

            db.TacGias.Remove(tg);
            db.SaveChanges();

            HttpCookie ck = new HttpCookie("id");
            ck.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(ck);

            Response.Redirect("/TacGia/TG");
        }
    }
}