using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Caddie
/// </summary>
public class Caddie
{
    // idvin et quantite
    private static readonly IDictionary<int, int> _Caddie = new Dictionary<int, int>();
    public Caddie()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void ModifierVin(int idvin, int quantite)
    {
        if (_Caddie.ContainsKey(idvin) && quantite > 0)
        {
            _Caddie[idvin] = quantite;
        }
        else if (quantite > 0)
        {
            _Caddie.Add(idvin, quantite);
        }
        else
        {
            _Caddie.Remove(idvin);
        }
    }

    public void ClearCaddie()
    {
        _Caddie.Clear();
    }

    public int GetQuantityByIdVin(int idvin)
    {
        if (_Caddie.ContainsKey(idvin))
            return _Caddie[idvin];
        return 0;
    }

    public float GetToTalByIdVin(int idvin, float price)
    {
        if (_Caddie.ContainsKey(idvin))
            return _Caddie[idvin]*price;
        return 0;
    }

    public void AddToDB()
    {

    }

    public DataSet RecupererCaddie()
    {
        if (_Caddie.Count == 0)
            return null as DataSet;

        // Construit une commande SELECT avec une clause IN
        StringBuilder builder = new StringBuilder("SELECT [idvin], [nom], [region], [millesime], [nomgif], [commentaire], [prix], CASE ");

        foreach (KeyValuePair<int, int> entry in _Caddie)
        {
            builder.Append("WHEN [idvin] = " + entry.Key.ToString() + " THEN ");
            builder.Append(entry.Value.ToString() + " ");
        }

        builder.Append("END AS quantite FROM [vins]  WHERE [idvin] IN (");

        foreach (KeyValuePair<int, int> entry in _Caddie)
        {
            builder.Append(entry.Key.ToString());
            builder.Append(',');
        }

        builder.Remove(builder.Length - 1, 1);
        builder.Append(");");

        // Executer la commande SELECT
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["laVinotheque"].ConnectionString);
        SqlCommand command = new SqlCommand(builder.ToString(), connection);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        return ds;
    }

    public DataSet RecupererPrixCaddie()
    {
        if (_Caddie.Count == 0)
            return null as DataSet;

        // Construit une commande SELECT avec une clause IN
        StringBuilder builder = new StringBuilder("SELECT sum(prix*quantite) as total from (SELECT idvin, prix, CASE ");

        foreach (KeyValuePair<int, int> entry in _Caddie)
        {
            builder.Append("WHEN [idvin] = " + entry.Key.ToString() + " THEN ");
            builder.Append(entry.Value.ToString() + " ");
        }

        builder.Append("END AS quantite FROM [vins]  WHERE [idvin] IN (");

        foreach (KeyValuePair<int, int> entry in _Caddie)
        {
            builder.Append(entry.Key.ToString());
            builder.Append(',');
        }

        builder.Remove(builder.Length - 1, 1);
        builder.Append(")) as prixtable;");

        // Executer la commande SELECT
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["laVinotheque"].ConnectionString);
        SqlCommand command = new SqlCommand(builder.ToString(), connection);
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        return ds;
    }
}

public class CaddieDB
{
    public DataSet Select()
    {
        Caddie Selection = (Caddie)HttpContext.Current.Profile["MaCaddie"];
        if (Selection == null)
            return null as DataSet;
        return Selection.RecupererCaddie();
    }
}

public class CaddiePriceDB
{
    public DataSet Select()
    {
        Caddie Selection = (Caddie)HttpContext.Current.Profile["MaCaddie"];
        if (Selection == null)
            return null as DataSet;
        return Selection.RecupererPrixCaddie();
    }
}