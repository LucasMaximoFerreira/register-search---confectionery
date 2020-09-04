<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            width: 289px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1"><em style="font-weight: 700">Doceira Doces e Mel<br />
        <br />
        </em>
        <asp:Button ID="btnCadastrar" runat="server" onclick="btnCadastrar_Click" 
            Text="Cadastrar" />
        <br />
        <br />
        </span>
        <asp:Button ID="btnPesquisar" runat="server" onclick="btnPesquisar_Click" 
            Text="Pesquisar" />
    
    </div>
    </form>
</body>
</html>
