using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class telaPesquisar : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP"); 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }

    protected void btnPesquisar_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnPesquisar_Click1(object sender, EventArgs e)
    {

    }
    private void carregarGrid()
    {

        DataTable listaDescripto = new DataTable();

        listaDescripto.Columns.Add("cod_vendas", typeof(int));
        listaDescripto.Columns.Add("nomecliente", typeof(String));
        listaDescripto.Columns.Add("desc_bolo", typeof(String));
        listaDescripto.Columns.Add("desc_sabor", typeof(String));
        listaDescripto.Columns.Add("nome_vendedor", typeof(String));
        listaDescripto.Columns.Add("data_compra", typeof(DateTime));
        listaDescripto.Columns.Add("qtd", typeof(int));
        listaDescripto.Columns.Add("total", typeof(double));

        DataView listaVenda;
        listaVenda = (DataView)SqlVenda.Select(DataSourceSelectArguments.Empty);

        listaDescripto.DefaultView.RowFilter = "nomecliente like '"+txtNomePesq.Text+"%'";

        for (int i = 0; i < listaVenda.Table.Rows.Count; i++)   
        {
            DataRow linha = listaDescripto.NewRow();

            linha["cod_vendas"] = listaVenda.Table.Rows[i]["cod_vendas"].ToString();
            linha["nomecliente"] = cripto.Decrypt(listaVenda.Table.Rows[i]["nomecliente"].ToString());
            linha["desc_bolo"] = cripto.Decrypt(listaVenda.Table.Rows[i]["desc_bolo"].ToString());
            linha["desc_sabor"] = cripto.Decrypt(listaVenda.Table.Rows[i]["desc_sabor"].ToString());
            linha["nome_vendedor"] = cripto.Decrypt(listaVenda.Table.Rows[i]["nome_vendedor"].ToString());
            linha["data_compra"] = cripto.Decrypt(listaVenda.Table.Rows[i]["data_compra"].ToString());
            linha["qtd"] = cripto.Decrypt(listaVenda.Table.Rows[i]["qtd"].ToString());
            linha["total"] = cripto.Decrypt(listaVenda.Table.Rows[i]["total"].ToString());

            listaDescripto.Rows.Add(linha);
        }

        gvExibir.DataSource = listaDescripto;
        gvExibir.DataBind();

    }

    protected void btnPesquisar_Click2(object sender, EventArgs e)
    {

    }

    protected void btnPesquisar_Click3(object sender, EventArgs e)
    {
       
        carregarGrid();
    }
}