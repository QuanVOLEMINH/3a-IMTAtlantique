using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Caddie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddToCaddie(object sender, CommandEventArgs e)
    {
        string[] tokens = e.CommandArgument.ToString().Split(';');
        int index = int.Parse(tokens[0]);
        int idvin = int.Parse(tokens[1]);
        string q = ((TextBox)GridView1.Rows[index].Cells[3].FindControl("quantite")).Text;
        int quantite = int.Parse(q);

        Profile.MaCaddie.ModifierVin(idvin, quantite);
        GridView1.DataBind();
        DataList1.DataBind();
    }
}