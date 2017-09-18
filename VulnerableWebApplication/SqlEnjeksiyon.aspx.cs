using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VulnerableWebApplication
{
    public partial class SqlEnjeksiyon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection("server=localhost;database=VulnerableDB;integrated security=true;User=sa;Password=1");
            SqlCommand komut = new SqlCommand();
            baglanti.Open();
            komut.Connection = baglanti;

            string id = Request.QueryString["id"];

            if(id == null)
            {
                id = "0";
            }

            komut.CommandText = "SELECT AD, SOYAD FROM Musteri WHERE ID = " + id;            
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();

            DataTable dtMusteriler = new DataTable();

            dtMusteriler.Load(dr);

            GenerateTable(dtMusteriler);

            baglanti.Dispose();
            baglanti.Close();
        }

        //http://geekswithblogs.net/dotNETvinz/archive/2009/06/24/fill-asp.net-table-with-data-from-datatable.aspx
        private void GenerateTable(DataTable dt)
        {
            Table table = new Table();
            TableRow row = null;

            //Add the Headers
            row = new TableRow();
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = dt.Columns[j].ColumnName;
                row.Cells.Add(headerCell);
            }
            table.Rows.Add(row);

            //Add the Column values
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                row = new TableRow();
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = dt.Rows[i][j].ToString();
                    row.Cells.Add(cell);
                }
                // Add the TableRow to the Table
                table.Rows.Add(row);
            }
            // Add the the Table in the Form
            table.CssClass = "table table-hover";
            form1.Controls.Add(table);
        }

        protected void btnYardim_Click(object sender, EventArgs e)
        {
            mp1.Show();
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("AnaSayfa.aspx");
        }
    }
}