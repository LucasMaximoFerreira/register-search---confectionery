<%@ Page Language="C#" AutoEventWireup="true" CodeFile="telaPesquisar.aspx.cs" Inherits="telaPesquisar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Doceira Doces e Mel<br />
        <br />
        NOME DO CLIENTE:
        <asp:TextBox ID="txtNomePesq" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" OnClick="btnPesquisar_Click3" />
        <br />
        <br />
        <asp:GridView ID="gvExibir" runat="server" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="cod_vendas">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="cod_vendas" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="cod_vendas" />
                <asp:BoundField DataField="nomecliente" HeaderText="Nome do Cliente" SortExpression="nomecliente" />
                <asp:BoundField DataField="data_compra" DataFormatString="{0:d}" HeaderText="Data" SortExpression="data_compra" />
                <asp:BoundField DataField="qtd" HeaderText="Quantidade" SortExpression="qtd" />
                <asp:BoundField DataField="total" DataFormatString="{0:c}" HeaderText="Total" SortExpression="total" />
                <asp:BoundField DataField="desc_bolo" HeaderText="Bolo" SortExpression="desc_bolo" />
                <asp:BoundField DataField="desc_sabor" HeaderText="Sabor" SortExpression="desc_sabor" />
                <asp:BoundField DataField="nome_vendedor" HeaderText="Vendedor" SortExpression="nome_vendedor" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlVenda" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT vendas.cod_vendas, vendas.nomecliente, vendas.data_compra, vendas.qtd, vendas.total, bolos.desc_bolo, sabores.desc_sabor, vendedores.nome_vendedor FROM vendas INNER JOIN bolos ON vendas.cod_bolo = bolos.cod_bolo INNER JOIN sabores ON vendas.cod_sabor = sabores.cod_sabor INNER JOIN vendedores ON vendas.cod_vendedor = vendedores.cod_vendedor"></asp:SqlDataSource>
        <br />
&nbsp;<asp:Button ID="btnVoltar" runat="server" Text="Voltar" 
            onclick="btnVoltar_Click" />
    
    </div>
    </form>
</body>
</html>
