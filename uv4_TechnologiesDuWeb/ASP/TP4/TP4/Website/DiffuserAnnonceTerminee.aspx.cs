using System;

public partial class DiffuserAnnonceTerminee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string IdRegion = Request.QueryString["Status"];
        if (IdRegion == "0")
        {
            Label1.Text = "Erreur dans l'ajout de votre annonce. Recommencez ou contactez-nous au 0.000.000.000";
        }
        else
        {
            Label1.Text = "Votre annonce sera diffusée sous 24h. Vous recevrez un message de confirmation. Merci de votre confiance";
        }
    }
}