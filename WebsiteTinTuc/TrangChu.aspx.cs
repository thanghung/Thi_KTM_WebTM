using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteTinTuc
{
    public partial class TrangChu1 : System.Web.UI.Page
    {
        QuanLyTinTucEntities db = new QuanLyTinTucEntities();
        Random rd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (RouteData.Values["modul"] != null)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;

                string id = RouteData.Values["modul"].ToString().Trim();

                if (id == "TG")
                    PlaceHolder1.Controls.Add(LoadControl("/UserControl/QL_tacgia.ascx"));
                else
                    PlaceHolder1.Controls.Add(LoadControl("/UserControl/QL_ChuDe.ascx"));
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;

                ShowData();
                hienthi();
            }
        }

        public void hienthi()
        {
            if (RouteData.Values["id"] != null)
            {
                string id = RouteData.Values["id"].ToString().Trim();
                TinTuc tt = db.TinTucs.Where(x => x.id == id).SingleOrDefault();

                txtTacGia.Text = tt.IDTG;
                txtChuDe.Text = tt.ChuDe;
                txtNoiDung.Text = tt.NoiDung;
                txtTieuDe.Text = tt.TieuDe;
            }

        }

        public void ShowData()
        {
            TableTinTuc.DataSource = db.TinTucs.OrderByDescending(x => x.NgayDang).ToList();
            TableTinTuc.DataBind();

            if (TableTinTuc.Rows.Count > 0)
                TableTinTuc.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            TinTuc tt = new TinTuc();
            int key = rd.Next(0, 99999999);
            var s = "TT" + key.ToString();

            while (db.TinTucs.Where(x => x.id == s).SingleOrDefault() != null)
            {
                key = rd.Next(0, 99999999);
                s = "TT" + key.ToString();

            }

            tt.id = "TT" + key.ToString();
            tt.TieuDe = txtTieuDe.Text;
            tt.NoiDung = txtNoiDung.Text;
            tt.NgayDang = DateTime.Now.ToString("dd/MM/yyyy");
            tt.ChuDe = txtChuDe.Text.Trim();

            TacGia tg = db.TacGias.Where(x => x.IDTG == txtTacGia.Text.Trim()).SingleOrDefault();

            if (tg == null)
                WebMsgBox.Show("Không tìm thấy tác giả");
            else
            {
                tt.IDTG = tg.IDTG;
                tt.TenTG = tg.TenTG;

                db.TinTucs.Add(tt);
                db.SaveChanges();
                Response.Redirect("/TrangChu");
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            var id = RouteData.Values["id"].ToString().Trim();
            TinTuc tt = db.TinTucs.Where(x => x.id == id).SingleOrDefault();

            tt.TieuDe = txtTieuDe.Text;
            tt.NoiDung = txtNoiDung.Text;
            tt.NgayDang = DateTime.Now.ToString("dd/MM/yyyy");
            tt.ChuDe = txtChuDe.Text.Trim();

            TacGia tg = db.TacGias.Where(x => x.IDTG == txtTacGia.Text.Trim()).SingleOrDefault();

            if (tg == null)
                WebMsgBox.Show("Không tìm thấy tác giả");
            else
            {
                tt.TenTG = txtTacGia.Text.Trim();

                db.TinTucs.Attach(tt);
                db.Entry(tt).State = EntityState.Modified;
                db.SaveChanges();

                Response.Redirect("/TrangChu");
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            var id = RouteData.Values["id"].ToString().Trim();
            TinTuc tt = db.TinTucs.Where(x => x.id == id).SingleOrDefault();

            db.TinTucs.Remove(tt);
            db.SaveChanges();
            Response.Redirect("/TrangChu");
        }
    }
}