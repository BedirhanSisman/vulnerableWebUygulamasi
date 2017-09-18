<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KomutEnjeksiyon.aspx.cs" Inherits="VulnerableWebApplication.KomutEnjeksiyon" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/jquery-1.9.1.js"></script>
    <link href="Style/SqlEnjeksiyonStyle.css" rel="stylesheet" />
    <title>Komut Enjeksiyon</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-lg-1">
            <asp:Button ID="btnYardim" class="btn btn-success" runat="server" Text="Yardım" OnClick="btnYardim_Click" />
            <asp:Button ID="btnGeri" class="btn btn-danger" runat="server" Text="Geri" OnClick="btnGeri_Click" />
        </div>
        <div class="col-lg-6">
            <div class="input-group">
                <asp:TextBox ID="txtIpAdres" runat="server" class="form-control" placeholder="Ip Adresi Giriniz.."></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="btnPing" runat="server" Text="Ping" class="btn btn-default" OnClick="btnPing_Click" />
                </span>
            </div>
        </div>
        <div class="col-lg-6">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Komut Cevabı : <br/> <br/>"></asp:Label>            
            <asp:Label ID="lblPingCevabı" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnYardim"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                <div class="aciklama">
                    <div class="baslik">
                        Komut Enjeksiyon Nedir?
                    </div>
                    <div class="icerik">
                      Genellikle komut (shell) enjeksiyon saldırılar SQL enjeksiyon ve XSS saldırılarının aksine doğrudan sunucuları hedefleyen bir saldırı tipidir. Web Uygulamasının komut satırını kullanarak uzaktan erişimle işletim sistemi, veritabanı yönetim sistemi ve sunucudaki bilgilere erişimi hedefler.
                    </div>
                    <div class="baslik">
                        Kod Bloğu
                    </div>
                    <div class="icerik">
                        string command = "/c ping " + txtIpAdres.Text; <strong style="color:green"> TextBox'dan ip veya web adres değerini alarak ping komutuna ekler.</strong> <br />

                        ProcessStartInfo procStartInfo = new ProcessStartInfo("CMD", command); <strong style="color:green"> Ping komutunu process bilgilerine ekler.</strong><br />

                        Process proc = new Process(); <strong style="color:green"> Bir process(işlem) oluşturur.</strong><br />

                        proc.Start(); <strong style="color:green"> Process'i başlatır.</strong><br />
                    </div>
                    <div class="baslik">
                        Kod Açıklaması
                    </div>
                    <div class="icerik">
                        Yukarıdaki kod ile birlikte herhangi bir sunucu adresine, sunucunun aktif olup olmadığını öğrenebilmemiz adına ping gönderebiliyoruz.Örnek olarak :  <strong>ping www.google.com</strong> <br />
                        Fakat komut enjeksiyonu açığı ile birlikte bir kişi Textbox'a sunucu adresi yanında başka bir komut daha girerse kod bloğu bu komutuda çalıştıracaktır. <br />
                        Örnek olarak <strong>www.google.com && ipconfig</strong> değerini Textbox'a girerek deneyebilirsiniz. ipconfig komutu ile sunucudaki ip bilgileri elde edinilebilir.
                    </div>
                    <div class="baslik">
                        Çözüm
                    </div>
                    <div class="icerik">
                        Çözüm için Textbox'a özel karakter filtrelemesi yapıyoruz.  <br />
                        <br />
                        string[] karakterler = { "'", "<]", ">", ";", "/", "?", "=", "&", "#", "%", "{", "}", "|", "@", "\\" }; <br />

                         foreach (string item in karakterler) { <br />
                         
                             if (ipAdres.Contains(item)) { <br />
                             
                             Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "< script>alert('Geçersiz karakter kullandınız. Lütfen tekrar deneyiniz.');< /script>"); <br />
                             lblPingCevabı.Text = ""; <br />
                             return; } }
                    </div>
                </div>
                <asp:Button ID="btnClose" runat="server" Text="Kapat" class="btn btn-danger" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
