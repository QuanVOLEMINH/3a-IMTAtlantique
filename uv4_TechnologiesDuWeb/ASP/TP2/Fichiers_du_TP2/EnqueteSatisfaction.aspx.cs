using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class EnqueteSatisfaction : System.Web.UI.Page
{
    //construction d'un récapitulatif sur la base des valeurs
    //des différents contrôles du wizard
    protected void ActivationDernierEtape(object sender, EventArgs e)
    {
        System.Text.StringBuilder builder = new System.Text.StringBuilder(1024);

        // Etape 2
        builder.Append("<p><b>Ce qui vous a amené sur notre site</b></p><p>");
        builder.Append(TextBox1.Text);
        builder.Append("</p><br><br>");

        //Etape 3
        builder.Append("<p><b>Votre opinion sur la notion de risque</b></p><p>");
        builder.Append(RadioButtonList1.SelectedValue);
        builder.Append("</p>");

        //Afficher le résultat de la concaténation des autres étapes
        Label1.Text = builder.ToString();
    }

}
