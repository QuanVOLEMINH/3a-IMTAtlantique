using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Service
/// </summary>
public class Service
{
    private static readonly float TVA = 0.196f;
    private static readonly float EURODOLLARRATE = 1.15f;
    private static readonly float EUROFRANCRATE = 6.56f;

    public Service()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static float convertEuroToDollar(float euros)
    {
        return euros * EURODOLLARRATE;
    }

    public static float convertEuroToFrancs(float euros)
    {
        return euros * EUROFRANCRATE;
    }

    public static float PrixAfterTax(float total)
    {
        return total*(1 + TVA);
    }

    public static float TaxAmount(float total)
    {
        return total * TVA;
    }

    public static float TVARate()
    {
        return TVA;
    }
}