using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page 
{
    Criptografia cripto = new Criptografia("ETEP");
    string bolo, sabor, vendedor;
    int qtdDisp, qtdDes, qtdAtualizada, bonus, bonusFinal;
    double preco, total, salario, acrescimoSabor;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            carregarDDLBolos();
            carregarDDLSabor();
            carregarDDLVendedor();
        }
        
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    protected void btnBolosOK_Click(object sender, EventArgs e)
    {
        DataView boloEscolhido;
        boloEscolhido = (DataView)SqlBoloEscolhido.Select(DataSourceSelectArguments.Empty);
        Session["codBoloDDL"] = ddlBolos.SelectedIndex;
        //precaucao
        Session["codBolo"] = boloEscolhido.Table.Rows[0]["cod_bolo"].ToString();
        lblQtdDisponivel.Text = cripto.Decrypt(boloEscolhido.Table.Rows[0]["qtd_disponivel"].ToString());       
        lblPrecoVenda.Text = cripto.Decrypt(boloEscolhido.Table.Rows[0]["preco_bolo"].ToString());

    }

    protected void btnSaborOK_Click(object sender, EventArgs e)
    {
        DataView SaborEscolhido;
        SaborEscolhido = (DataView)SqlSaborEscolhido.Select(DataSourceSelectArguments.Empty);
        Session["codSaborDDL"] = ddlSabor.SelectedIndex;
        //precaucao
        Session["codSabor"] = SaborEscolhido.Table.Rows[0]["cod_sabor"].ToString();
        lblAcresSabor.Text = cripto.Decrypt(SaborEscolhido.Table.Rows[0]["acrescimo_sabor"].ToString().Replace('.', '.')); 
    }


    protected void btnVendedorOK_Click(object sender, EventArgs e)
    {

        DataView vendedorEscolhido;
        vendedorEscolhido = (DataView)SqlVendedorEscolhido.Select(DataSourceSelectArguments.Empty);
        Session["codVendedorDDL"] = ddlVendedor.SelectedIndex;
        //precaucao
        Session["codVendedor"] = vendedorEscolhido.Table.Rows[0]["cod_vendedor"].ToString();
        lblSalario.Text = cripto.Decrypt(vendedorEscolhido.Table.Rows[0]["sal_vendedor"].ToString()); 
        lblBonusSalario.Text = cripto.Decrypt(vendedorEscolhido.Table.Rows[0]["bonus_vendedor"].ToString());

    }

    protected void btnVerificar_Click(object sender, EventArgs e)
    {
        qtdDes = Convert.ToInt32(txtQtdDesejada.Text);
        qtdDisp = Convert.ToInt32(lblQtdDisponivel.Text);
        preco = Convert.ToDouble(lblPrecoVenda.Text.Replace('.', ','));
        acrescimoSabor = Convert.ToDouble(lblAcresSabor.Text);
        
        if (qtdDisp >= qtdDes)
        {
            total = (preco + acrescimoSabor) * qtdDes;

            lblTotalPagar.Text = Convert.ToString(total);
            lblErro.Text = "";
        }
        else
        {
            lblErro.Text = "Qtd insuficiente";
            lblTotalPagar.Text = "";
            txtQtdDesejada.Text = "";
        }
    }

    protected void btnComprar_Click(object sender, EventArgs e)
    {
        qtdDes = Convert.ToInt32(txtQtdDesejada.Text);
        qtdDisp = Convert.ToInt32(lblQtdDisponivel.Text);

        qtdAtualizada = qtdDisp - qtdDes;

        SqlUpdateBolo.UpdateParameters["NOVAQTD"].DefaultValue = cripto.Encrypt(qtdAtualizada.ToString());
        SqlUpdateBolo.Update();
        bonus = Convert.ToInt32(lblBonusSalario.Text);
        bonusFinal = bonus + 50;
        
        SqlUpdateVendedor.UpdateParameters["NOVOBONUS"].DefaultValue = cripto.Encrypt(bonusFinal.ToString());
        SqlUpdateVendedor.Update();
        


        Cadastrar.InsertParameters["NOMECLI"].DefaultValue = cripto.Encrypt(txtNomeCli.Text);
        Cadastrar.InsertParameters["TOTAL"].DefaultValue = cripto.Encrypt(lblTotalPagar.Text.Replace(',','.'));
        Cadastrar.InsertParameters["DATA"].DefaultValue = cripto.Encrypt(Calendar1.SelectedDate.ToShortDateString());
        Cadastrar.InsertParameters["QTDDESEJADA"].DefaultValue = cripto.Encrypt(txtQtdDesejada.Text);

        Cadastrar.Insert();
        lblCompra.Text = "Compra efetuada com sucesso";
         
        lblQtdDisponivel.Text = "";
        lblPrecoVenda.Text = "";
        lblAcresSabor.Text = "";
        lblSalario.Text = "";
        lblBonusSalario.Text = "";
        txtNomeCli.Text = "";
        txtQtdDesejada.Text = "";
        lblTotalPagar.Text = "";
        



    }
    private void carregarDDLBolos()
    {
        DataView listaBolo;

        listaBolo = (DataView)SqlCarregarBolos.Select(DataSourceSelectArguments.Empty);

        ddlBolos.Items.Clear();

        for (int i = 0; i < listaBolo.Table.Rows.Count; i++)
        {
            ddlBolos.Items.Add(new ListItem(
                cripto.Decrypt(listaBolo.Table.Rows[i]["desc_bolo"].ToString()),
                listaBolo.Table.Rows[i]["cod_bolo"].ToString()));
        }
    }
    private void carregarDDLSabor()
    {
        DataView listaSabor;

        listaSabor = (DataView)SqlCarregarSabor.Select(DataSourceSelectArguments.Empty);

        ddlSabor.Items.Clear();

        for (int i = 0; i < listaSabor.Table.Rows.Count; i++)
        {
            ddlSabor.Items.Add(new ListItem(
                cripto.Decrypt(listaSabor.Table.Rows[i]["desc_sabor"].ToString()),
                listaSabor.Table.Rows[i]["cod_sabor"].ToString()));
        }
    }
    private void carregarDDLVendedor()
    {
        DataView listaVendedor;

        listaVendedor = (DataView)SqlCarregarVendedor.Select(DataSourceSelectArguments.Empty);

        ddlVendedor.Items.Clear();

        for (int i = 0; i < listaVendedor.Table.Rows.Count; i++)
        {
            ddlVendedor.Items.Add(new ListItem(
                cripto.Decrypt(listaVendedor.Table.Rows[i]["nome_vendedor"].ToString()),
                listaVendedor.Table.Rows[i]["cod_vendedor"].ToString()));
        }
    }

    protected void ddlBolos_SelectedIndexChanged(object sender, EventArgs e)
    {
        

    }
}