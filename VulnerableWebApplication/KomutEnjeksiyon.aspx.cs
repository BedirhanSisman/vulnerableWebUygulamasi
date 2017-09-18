using System;
using System.Diagnostics;

namespace VulnerableWebApplication
{
    public partial class KomutEnjeksiyon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPing_Click(object sender, EventArgs e)
        {
            string ipAdres = txtIpAdres.Text;

            //string[] karakterler = { "'", "<]", ">", ";", "/", "?", "=", "&", "#", "%", "{", "}", "|", "@", "\\" };


            //foreach (string item in karakterler)
            //{
            //    if (ipAdres.Contains(item))
            //    {
            //        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "<script>alert('Geçersiz karakter kullandınız. Lütfen tekrar deneyiniz.');</script>");
            //        lblPingCevabı.Text = "";
            //        return;
            //    }
            //}

            lblPingCevabı.Text = "";
            string command = "/c ping " + ipAdres;          

            ProcessStartInfo procStartInfo = new ProcessStartInfo("CMD", command);

            Process proc = new Process();
            proc.StartInfo = procStartInfo;
            proc.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            proc.Start();
            procStartInfo.CreateNoWindow = true;
            procStartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            procStartInfo.RedirectStandardOutput = true;
            procStartInfo.UseShellExecute = false;
            proc.OutputDataReceived += new DataReceivedEventHandler(proc_OutputDataReceived);
            proc.Start();

            System.Threading.Thread.Sleep(10000); //10 sn bekleme olmazsa eğer label'a yazmıyor.

            proc.BeginOutputReadLine();

            procStartInfo.CreateNoWindow = true;
            procStartInfo.WindowStyle = ProcessWindowStyle.Hidden;
        }

        void proc_OutputDataReceived(object sender, DataReceivedEventArgs e)
        {
            if (e.Data != null)
            {
                string newLine = e.Data.Trim() + Environment.NewLine;
                lblPingCevabı.Text += newLine + "\n";
            }
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