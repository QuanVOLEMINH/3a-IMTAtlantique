using System;
using System.Web.UI.WebControls;

public partial class Catalogue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddToCaddie(object sender, CommandEventArgs e)
    {
        string[] tokens = e.CommandArgument.ToString().Split(';');
        int index = int.Parse(tokens[0]);
        int idvin = int.Parse(tokens[1]);
        string q = ((TextBox)DataList1.Items[index].FindControl("quantite")).Text;
        int quantite = int.Parse(q);

        Profile.MaCaddie.ModifierVin(idvin, quantite);
        DataList1.DataBind();
    }
}