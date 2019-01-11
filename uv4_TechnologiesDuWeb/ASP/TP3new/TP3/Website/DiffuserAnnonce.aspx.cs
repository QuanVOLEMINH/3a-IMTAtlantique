using System;
using System.Web.UI.WebControls;

public partial class DiffuserAnnonce : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ValiderInsertion(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            Server.Transfer("DiffuserAnnonceTerminee.aspx?Status=0");
        }
        else
        {
            Server.Transfer("DiffuserAnnonceTerminee.aspx?Status=1");
        }
    }
}