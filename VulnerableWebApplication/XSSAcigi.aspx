<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XSSAcigi.aspx.cs" Inherits="VulnerableWebApplication.XSSAcigi" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/jquery-1.9.1.js"></script>
    <link href="Style/SqlEnjeksiyonStyle.css" rel="stylesheet" />
    <title>XSS Açığı</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-lg-1">
            <asp:Button ID="btnYardim" class="btn btn-success" runat="server" Text="Yardım" OnClick="btnYardim_Click" />
            <asp:Button ID="btnGeri" class="btn btn-danger" runat="server" Text="Geri" OnClick="btnGeri_Click" />
        </div>
        <div class="col-lg-6">
            <div class="input-group">
                <asp:TextBox ID="txtMusteriAra" runat="server" class="form-control" placeholder="Aramak icin..."></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="btnMusteriAra" runat="server" Text="Musteri Ara" class="btn btn-default" OnClick="btnMusteriAra_Click" />
                </span>
            </div>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Aranan Müşteri : "></asp:Label>
            <asp:Label ID="lblArananMusteri" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnYardim"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                <div class="aciklama">
                    <div class="baslik">
                        Açıklama
                    </div>
                    <div class="icerik">
                        Web uygulamasında açığın meydana geldiği input/inject point (veri girişi) alanına gönderilen kötü niyetli javascript kodlarının, kullanıcının web tarayıcısında çalıştırıldığı bir saldırı türüdür. Yani Client-Side (kullanıcı taraflı) bir saldırıdır. URL adreslerindeki query stringler ve form alanlarında sıklıkla görülür. Phishing saldırılarına zemin oluşturur.Genellikle POST ve GET metotlarının kullanıldığı alanlarda olur. 
                    </div>                
                 <div class="baslik">
                        Kod Bloğu
                    </div>
                <div class="icerik">      
                    <strong style="color: green">//C# kodu</strong> <br />              
                    lblArananMusteri1.Text = txtMusteriAra1.Text; <br />                    
                    <strong style="color: green">//HTML kodu</strong> <xmp> <asp:Label ID="lblArananMusteri1" runat="server" Text=""></asp:Label></xmp>
                    <strong style="color: green">//HTML kodu</strong> <xmp> <asp:TextBox ID="txtMusteriAra1" runat="server" class="form-control" placeholder="Aramak icin..."></asp:TextBox></xmp> 
                </div>
                    <div class="baslik">
                        Kod Açıklaması
                    </div>
                    <div class="icerik">
                        Textbox'a yazdığımız aranan müşteri adını, lblArananMusteri1 id'li Label'a yazdırıyoruz. Fakat sayfamızda XSS açığı bulunduğu için text içerisine yazılan script kodları ile sayfamız kontrol edilebilir oluyor. Aşağıdaki kodları text içerine yazarak XSS açığını açık bir şekilde görebilirsiniz. <br />
                        <xmp><script>document.body.style.background = 'blue'</script></xmp>
                        <xmp><script>alert("Selam")</script> <br /></xmp>
                    </div>
                     <div class="baslik">
                        Çözüm
                    </div>
                    <div class="icerik">
                        Çözüm için Textbox'a özel karakter filtrelemesi yapıyoruz.  <br />
                        <br />
                        string[] karakterler = { "'", "<]", ">", ";", "/", "?", "=", "&", "#", "%", "{", "}", "|", "@", "\\" }; <br />

                         foreach (string item in karakterler) { <br />
                         
                             if (arananMusteri.Contains(item)) { <br />
                             
                             Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "< script>alert('Geçersiz karakter kullandınız. Lütfen müşteri adını giriniz.');< /script>"); <br />
                             blArananMusteri.Text = ""; <br />
                             return; } } <br />
                         Diğer çözümler ise aşağıki gibidir. <br />
                        <xmp> <pages validateRequest ="false"> </xmp>
                        <xmp> <httpRuntime targetFramework="4.5.2" requestValidationMode="2.0" /></xmp>
                    </div>
               </div>
                <asp:Button ID="btnClose" runat="server" Text="Kapat" class="btn btn-danger" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>

