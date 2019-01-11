using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Profile;
using System.Text;
using System.Xml.Serialization;

/// <summary>
/// Cette classe AnnoncesFavorites encapsule un tableau d'entiers qui stocke les Ids des annonces
/// favorites sélectionnées par l'utilisateur
/// </summary>
public class AnnoncesFavorites
{
    [XmlIgnore] // Ce champ ne doit pas être sérialisé !
    public static readonly DataSet EmptyDataSet = RecupererToutesLesAnnonces();

    public List<int> _AnnoncesFavorites = new List<int>();

    public void AjouterAnnonce(int id)
    {
        _AnnoncesFavorites.Add(id);
    }

    public void SupprimerAnnonce(int id)
    {
        _AnnoncesFavorites.Remove(id);
    }

    public bool EstDansListeAnnoncesFavorites(int id)
    {
        return _AnnoncesFavorites.IndexOf(id) != -1;
    }

    public DataSet RecupererAnnoncesFavorites()
    {
        if (_AnnoncesFavorites.Count == 0)
            return EmptyDataSet;

        // Construit une commande SELECT avec une clause IN
        StringBuilder builder = new StringBuilder("SELECT [Ann_Id], [Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Cat_Id], [Reg_Id], [Ann_UserEmail] FROM [Annonces] WHERE Ann_Id IN (");

        foreach (int id in _AnnoncesFavorites)
        {
            builder.Append(id.ToString());
            builder.Append(',');
        }

        builder.Remove(builder.Length - 1, 1); // Supprimer la dernière virgule 
        builder.Append(")");                   // Ajouter la parenthèse à la fin de la requête

        // Executer la commande SELECT
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["csAffairesSansRisque"].ConnectionString);
        SqlCommand command = new SqlCommand(builder.ToString(), connection);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        return ds;
    }

    static DataSet RecupererToutesLesAnnonces()
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["csAffairesSansRisque"].ConnectionString);
        SqlCommand command = new SqlCommand("SELECT [Ann_Id], [Ann_Texte], [Ann_Telephone], [Ann_Email], [Ann_Prix], [Ann_Ville], [Ann_CodePostal], [Cat_Id], [Reg_Id], [Ann_UserEmail] FROM [Annonces]", connection);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.FillSchema(ds, SchemaType.Source);
        return ds;
    }
}
/// <summary>
/// Cette classe AnnoncesFavoritesDB gère les appels à la classe AnnoncesFavorites et 
/// est directement invoquée par la couche de présentation pour rendre l'information dans les pages.
/// </summary>
public class AnnoncesFavoritesDB
{
    public DataSet Select()
    {
        AnnoncesFavorites Selection = (AnnoncesFavorites)HttpContext.Current.Profile["MaSelectionDAnnonces"];
        if (Selection == null)
            return AnnoncesFavorites.EmptyDataSet;
        return Selection.RecupererAnnoncesFavorites();
    }

    public void Delete(int Ann_Id)
    {
        AnnoncesFavorites Selection = (AnnoncesFavorites)HttpContext.Current.Profile["MaSelectionDAnnonces"];
        if (Selection != null)
            Selection.SupprimerAnnonce(Ann_Id);
    }
}