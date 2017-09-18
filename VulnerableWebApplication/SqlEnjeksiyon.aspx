<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SqlEnjeksiyon.aspx.cs" Inherits="VulnerableWebApplication.SqlEnjeksiyon" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SQL Enjeksiyon</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/jquery-1.9.1.js"></script>
    <link href="Style/SqlEnjeksiyonStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Button ID="btnYardim" class="btn btn-success" runat="server" Text="Yardım" OnClick="btnYardim_Click" />
            <asp:Button ID="btnGeri" class="btn btn-danger" runat="server" Text="Geri" OnClick="btnGeri_Click" />

            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnYardim"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                <div class="aciklama">
                    <div class="baslik">
                        SQL Enjeksiyon Nedir?
                    </div>
                    <div class="icerik">
                        SQL injection kötü amaçlı, normalde çalışmaması gereken SQL komutlarıdır. SQL injection ya adres satırından ya da input alanından yapılır. Kötü amaçlı SQL kodu eğer veriler POST ile yollanıyorsa input alanına (genellikle text kutusuna), GET metodu ile yollanıyorsa adres satırına girilir. 
                    </div>
                </div>
                <div class="aciklama">
                    <div class="baslik">
                        Kod Bloğu
                    </div>
                        <div class="icerik">
                                string id = Request.QueryString["id"]; <strong style="color:green"> //Query string değerini id değişkenine atar. </strong> <br />
                                if(id == null) { id = "0"; } <strong style="color:green"> //id değeri için null kontrolü yapılır. </strong> <br />
                                
                                <strong style="color:red">komut.CommandText = "SELECT AD, SOYAD FROM Musteri WHERE ID = " + id;</strong>  <strong style="color:green"> //Sql komutu oluşturulur. </strong> <br />
                                
                                komut.ExecuteNonQuery(); <strong style="color:green"> //Sql komutu çalıştırılır. </strong> <br />
                        </div>
                </div>
                <div class="aciklama">
                    <div class="baslik">
                        Kod Açıklaması
                    </div>
                    <div class="icerik">
                        SQL injection kodumuzu inceleyelim: '' OR 1 = 1
                        '' iki tek tırnak karakteri id değerine boş değer yollamamızı sağlıyor. Fakat sorgunun boş değer döndürüp hata vermesini engellemek için OR komutu 1 = 1 ifadesi ile birleştirilerek her zaman doğru sonuç döndürecek kriter ekleyerek tüm kişileri görebiliyoruz. 
                    </div>
                </div>
                <div class="aciklama">
                    <div class="baslik">
                        Çözüm
                    </div>
                <div class="icerik">
                    SQL injection çözümü için kodu aşağıdaki şekilde düzenlemeliyiz.
                    string id = Request.QueryString["id"];<br />
                    if(id == null) { id = "0"; }  <br />
                    <strong style="color:red">komut.CommandText = "SELECT AD, SOYAD FROM Musteri WHERE ID = @id";</strong>
                    <strong style="color:red">komut.Parameters.AddWithValue("@id", id); </strong>
                    <br />
                    komut.ExecuteNonQuery();<br />
                </div>
                    </div>
                <asp:Button ID="btnClose" runat="server" Text="Close" />
            </asp:Panel>
        </div>

    </form>
</body>
</html>

            