using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "Création du premier site ASP";
        Master.PiedDePage = "Merci de prendre quelques instants pour répondre à notre <a href=EnqueteSatisfaction.aspx>enquête de satisfaction</a>";
    }
}