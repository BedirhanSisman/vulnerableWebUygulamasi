using System;

namespace VulnerableWebApplication
{
    public partial class AnaSayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AnaSayfaDoldur();
        }
        protected void btnAnasayfa_Click(object sender, EventArgs e)
        {
            AnaSayfaDoldur();
        }

        public void AnaSayfaDoldur()
        {
            lblBaslik.Text = "Zayıf Web Uygulaması";
            lblIcerik.Text = "<p>Kasıtlı olarak bırakılmış güvenlik zafiyetlerini (vulnerability) içeren zayıf (vulnerable) web uygulamaları, uygulamalı siber güvenlik eğitimlerinde önemli bir rol oynamaktadır. Öğrenciler, yasal olmayan bir şekilde gerçek sistemlere saldırmadan bu tip uygulamalar üzerinde öğrendiklerini tecrübe ederek kendilerini geliştirebilmektedirler.<br>" +
                            "<p>Farklı programlama dillerinde(PHP, ASP, C# .NET, Node.js, PERL, Java, Ruby on Rails, Python, C++, ColdFusion vb.) yazılmış vulnerable web uygulamaları bulunmaktadır. Fakat, Türkçe yazılmış ve iyi bir şekilde dokümantasyonu yapılmış vulnerable web uygulamaları yok denecek kadar azdır. <br>" +
                            "<p>Bu projenin amacı ülkemizdeki siber güvenlik derslerinde kullanılabilecek bir düzeyde vulnerable web uygulamaları geliştirmektir.Bunun için sadece üzerinde zafiyetler bulunan bir web uygulaması geliştirmek yeterli değildir, bu uygulamadaki zafiyetlerin neden kaynaklandığının ve bu zafiyetlerin nasıl sömürüleceğinin(exploitation) de açık ve anlaşılır bir şekilde dokümantasyonun yapılması gereklidir.";
        }

        protected void btnKurulum_Click(object sender, EventArgs e)
        {
            lblBaslik.Text = "Kurulum Dökümantasyonu";
            lblIcerik.Text = "1. Windows işletim sisteminde çalışmaktadır. <br> 2. Veritabanı için bilgisayarınızda SQL Server Management kurulu olmalıdır. <br> 3. Veritabanının kurulumu için aşağıdaki adımları takip etmelisiniz. <br> &emsp; a. SQL Server Management'i açıyoruz. 'Databases' kısmına sağ tıklarak 'Restore Database' seçeneğini seçiyoruz. <br> &emsp; b. Source kısmından proje dosyası içindeki 'VulnerableDB.bak' yedeği seçiyoruz. Destination kısmından yedeği yükleyeceğimiz veritabanını seçiyoruz. Restore Plan kısmında aldığımız yedeklerin listesi ve bilgileri görünüyor, eğer birden çok yedeğiniz varsa hangi yedeği yüklemek istediğinizi seçiyorsunuz. Ok tuşuna bastığınızda veritabanı geri yükleme işlemi başlıyor. <br> &emsp; c.İşlem tamamlandığında hata almazsanız 'Database ABC restored succesfully' gibi işlemin başarılı olduğuna dair bir mesaj gösterilecek. <br> 4. Ugulamanın kurulumunda projeyi Visual Studio ile çalıştırıp debug etmeniz yeterlidir.";
        }

        protected void btnSqlEnjeksiyon_Click(object sender, EventArgs e)
        {
            Response.Redirect("SqlEnjeksiyon.aspx");
        }

        protected void btnXSS_Click(object sender, EventArgs e)
        {
            Response.Redirect("XSSAcigi.aspx");
        }

        protected void btnKomutEnjeksiyon_Click(object sender, EventArgs e)
        {
            Response.Redirect("KomutEnjeksiyon.aspx");
        }
    }
}