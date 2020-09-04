<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .style1
        {
            width: 289px;
        }
        .style2
        {
            width: 129px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-weight: 700">
    
        <span class="style1"><em>Doceira Doces e Mel<br />
        </em></span><br />
        
                    Escolha um 
        bolo:
        <asp:DropDownList ID="ddlBolos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBolos_SelectedIndexChanged">
            <asp:ListItem>Caseiro</asp:ListItem>
            <asp:ListItem>Recheado</asp:ListItem>
            <asp:ListItem>Cremoso</asp:ListItem>
        </asp:DropDownList>
                
                    &nbsp;<asp:Button ID="btnBolosOK" runat="server" Text="OK" OnClick="btnBolosOK_Click" />
               
        <br />
               
        Quantidade Disponível:
        <asp:Label ID="lblQtdDisponivel" runat="server"></asp:Label>
                
               
        <br />
                
               
        Preço de Venda R$:</td>
                
        <asp:Label ID="lblPrecoVenda" runat="server"></asp:Label>
               
                    <asp:SqlDataSource ID="SqlBoloEscolhido" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT cod_bolo, desc_bolo, qtd_disponivel, preco_bolo FROM bolos WHERE (cod_bolo = @COD_BOLO)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlBolos" Name="COD_BOLO" PropertyName="SelectedValue" />
                        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCarregarBolos" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT * FROM bolos"></asp:SqlDataSource>
               
                    <br />
        <br />
               
                    Escolha um
                    sabor:</td>
               
                    <asp:DropDownList ID="ddlSabor" runat="server">
                        <asp:ListItem>Chocolate</asp:ListItem>
                        <asp:ListItem>Morango</asp:ListItem>
                        <asp:ListItem>Fubá</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnSaborOK" runat="server" Text="OK" OnClick="btnSaborOK_Click" />
        <br />
        Acréscimo em R$:
               
                    <asp:Label ID="lblAcresSabor" runat="server"></asp:Label>
                
              
                    <asp:SqlDataSource ID="SqlSaborEscolhido" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT cod_sabor, desc_sabor, acrescimo_sabor FROM sabores WHERE (cod_sabor = @COD_SABOR)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSabor" Name="COD_SABOR" PropertyName="SelectedValue" />
                        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCarregarSabor" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT * FROM sabores"></asp:SqlDataSource>
                
              
                    <br />
        <br />
        Escolha um Vendedor: 
                    <asp:DropDownList ID="ddlVendedor" runat="server">
                        <asp:ListItem>Pedro</asp:ListItem>
                        <asp:ListItem>Antonio</asp:ListItem>
                        <asp:ListItem>Ana</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnVendedorOK" runat="server" Text="OK" OnClick="btnVendedorOK_Click" />
        <br />
                
                   Salário R$:
                    <asp:Label ID="lblSalario" runat="server"></asp:Label>
               
              
        <br />
        Bonus R$:
        <asp:Label ID="lblBonusSalario" runat="server" Text=""></asp:Label>
        <asp:SqlDataSource ID="SqlVendedorEscolhido" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT cod_vendedor, nome_vendedor, sal_vendedor, bonus_vendedor FROM vendedores WHERE (cod_vendedor = @COD_VENDEDOR)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlVendedor" Name="COD_VENDEDOR" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCarregarVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT * FROM vendedores"></asp:SqlDataSource>
        <br />
               
              
        <br />
        <br />
               
              
        Nome do Cliente:
         <asp:TextBox ID="txtNomeCli" runat="server"></asp:TextBox>
                
        <table style="width:100%;">
            <tr>
                <td class="style2">
                
        Data da Compra:</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                
                    </td>
            </tr>
        </table>
               
        Quantidade Desejada:
        <asp:TextBox ID="txtQtdDesejada" runat="server"></asp:TextBox>
               
        <asp:Button ID="btnVerificar" runat="server" Text="Verificar Disponibilidade" OnClick="btnVerificar_Click" />
                
                    <asp:Label ID="lblErro" runat="server"></asp:Label>
               
        <br />
                
       Total a Pagar R$:
        <asp:Label ID="lblTotalPagar" runat="server"></asp:Label>
                
        <br />
                
        <asp:Button ID="btnComprar" runat="server" Text="Comprar" OnClick="btnComprar_Click" />
               
                    <asp:Label ID="lblCompra" runat="server"></asp:Label>
               
&nbsp;<asp:SqlDataSource ID="Cadastrar" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" InsertCommand="INSERT INTO vendas(nomecliente, cod_bolo, cod_sabor, cod_vendedor, data_compra, qtd, total) VALUES (@NOMECLI, @TIPOBOLO, @TIPOSABOR, @TIPOVENDEDOR, @DATA, @QTDDESEJADA, @TOTAL)" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT * FROM vendas
">
            <InsertParameters>
                <asp:ControlParameter ControlID="ddlBolos" Name="TIPOBOLO" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlSabor" Name="TIPOSABOR" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlVendedor" Name="TIPOVENDEDOR" PropertyName="SelectedValue" />
                <asp:Parameter Name="NOMECLI" />
                <asp:Parameter Name="DATA" />
                <asp:Parameter Name="QTDDESEJADA" />
                <asp:Parameter Name="TOTAL" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlUpdateBolo" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT * FROM bolos" UpdateCommand="UPDATE bolos SET qtd_disponivel = @NOVAQTD WHERE (cod_bolo = @IDBOLO)">
            <UpdateParameters>
                <asp:Parameter Name="NOVAQTD" />
                <asp:ControlParameter ControlID="ddlBolos" Name="IDBOLO" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlUpdateVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:doces_melConnectionString %>" ProviderName="<%$ ConnectionStrings:doces_melConnectionString.ProviderName %>" SelectCommand="SELECT * FROM vendedores" UpdateCommand="UPDATE vendedores SET bonus_vendedor = @NOVOBONUS WHERE (cod_vendedor = @IDVENDEDOR)">
            <UpdateParameters>
                <asp:Parameter Name="NOVOBONUS" />
                <asp:ControlParameter ControlID="ddlVendedor" Name="IDVENDEDOR" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnVoltar" runat="server" onclick="btnVoltar_Click" 
            Text="Voltar" />
    
        <br />
    
    </div>
    </form>
</body>
</html>
