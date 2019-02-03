<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Confirmation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Votre Commande a ete transmise a notre service de vente par correspondance. Nous vous remecions pour votre confiance.
    </h2>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="button" NavigateUrl="~/Default.aspx">Accueil</asp:HyperLink>
</asp:Content>

