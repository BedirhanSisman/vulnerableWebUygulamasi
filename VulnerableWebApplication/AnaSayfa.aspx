<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnaSayfa.aspx.cs" Inherits="VulnerableWebApplication.AnaSayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Koü</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Style/AnaSayfaStyle.css" rel="stylesheet" />
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/jquery-1.9.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="UstKisim">
            <img src="Image/kouImage.png" height="200" width="200"></img>
        </div>
        <div>
            <div id="SolKisim">
                <div class="list-group">
                    <asp:Button ID="btnAnasayfa" class="list-group-item" runat="server" Text="AnaSayfa" OnClick="btnAnasayfa_Click" Width="300" />
                    <asp:Button ID="btnKurulum" class="list-group-item" runat="server" Text="Kurulum Dökümantasyonu" OnClick="btnKurulum_Click" Width="300" />
                    <br />
                    <br />
                    <asp:Button ID="btnSqlEnjeksiyon" class="list-group-item" runat="server" Text="SQL Enjeksiyonu" OnClick="btnSqlEnjeksiyon_Click" Width="300" />
                    <asp:Button ID="btnXSS" class="list-group-item" runat="server" Text="XSS" OnClick="btnXSS_Click" Width="300" />
                    <asp:Button ID="btnKomutEnjeksiyon" class="list-group-item" runat="server" Text="Komut Enjeksiyonu" OnClick="btnKomutEnjeksiyon_Click" Width="300" />
                </div>
            </div>
            <div id="SagKisim">
                <div class="baslik">
                    <asp:Label ID="lblBaslik" runat="server"></asp:Label>
                </div>
                <div class="icerik">
                    <asp:Label ID="lblIcerik" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <div id="AltKisim">
            <p style="color: lightgray">Zayıf Web Uygulaması v1.01</p>
        </div>
    </form>
</body>
</html>
