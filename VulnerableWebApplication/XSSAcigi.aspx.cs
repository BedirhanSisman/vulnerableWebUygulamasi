using System;
using System.Web;

namespace VulnerableWebApplication
{
    public partial class XSSAcigi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnMusteriAra_Click(object sender, EventArgs e)
        {
            string arananMusteri = txtMusteriAra.Text;

            //string[] karakterler = { "'", "<]", ">", ";", "/", "?", "=", "&", "#", "%", "{", "}", "|", "@", "\\" };


            //foreach (string item in karakterler)
            //{
            //    if (arananMusteri.Contains(item))
            //    {
            //        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "<script>alert('Geçersiz karakter kullandınız. Lütfen müşteri adını giriniz.');</script>");
            //        lblArananMusteri.Text = "";
            //        return;
            //    }
            //}

            lblArananMusteri.Text = arananMusteri;
        }

        protected void btnYardim_Click(object sender, EventArgs e)
        {
            mp1.Show();
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("AnaSayfa.aspx");
        }
    }
}